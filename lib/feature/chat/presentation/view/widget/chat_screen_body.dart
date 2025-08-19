import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/presentation/manager/apply_connection/apply_connection_cubit.dart';
import 'package:tala_app/feature/chat/presentation/manager/check_connection/check_connection_cubit.dart';
import 'package:tala_app/feature/chat/presentation/manager/message_cubit/message_cubit.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/test_chat.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  late final ChatEntity chat;
  late ChatController chatController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chat = GoRouter.of(context).state.extra as ChatEntity;
    context.read<CheckConnectionCubit>().checkConnection(chat.uid);
    chatController = ChatController(
      initialMessageList: [],
      scrollController: ScrollController(),
      otherUsers: [
        ChatUser(
          id: chat.uid,
          name: chat.name,
          profilePhoto: chat.photoUrl.isEmpty
              ? 'https://media.istockphoto.com/id/2151669184/vector/vector-flat-illustration-in-grayscale-avatar-user-profile-person-icon-gender-neutral.jpg?s=612x612&w=0&k=20&c=UEa7oHoOL30ynvmJzSCIPrwwopJdfqzBs0q69ezQoM8='
              : chat.photoUrl,
          imageType: ImageType.network,
          defaultAvatarImage:
              'https://media.istockphoto.com/id/2151669184/vector/vector-flat-illustration-in-grayscale-avatar-user-profile-person-icon-gender-neutral.jpg?s=612x612&w=0&k=20&c=UEa7oHoOL30ynvmJzSCIPrwwopJdfqzBs0q69ezQoM8=',
        ),
      ],
      currentUser: ChatUser(
        id: FirebaseAuth.instance.currentUser!.uid,
        name: chat.currentUName,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ApplyConnectionCubit, ApplyConnectionState>(
          listener: (context, state) {
            if (state is NotConnectionSuccess) {
              if (context.canPop()) {
                context.pop();
              }
              context.pop();
            }
            if (state is AcceptConnectionSuccess) {
              if (context.canPop()) {
                context.pop();
              }
              AppConstant.buildShowSnackBar(
                context,
                'You are now connected with ${chat.name}. Start chatting!',
                ContentType.success,
                'congrats',
              );
            }
          },
        ),
        BlocListener<CheckConnectionCubit, CheckConnectionState>(
          listener: (context, state) {
            if (state is CheckConnectionNotConnection) {
              buildAlertDialog(context, context.read<ApplyConnectionCubit>());
            }
            if (state is CheckConnectionNoConnectionFromUser) {
              buildAlertDialogFromUser(context);
            }
            if (state is CheckConnectionIsConnection) {
              context.read<MessageCubit>().loadMessages(chat.chatId);
              context.read<MessageCubit>().isConnection();
              context.read<MessageCubit>().markMessagesAsRead(
                chat.chatId,
                FirebaseAuth.instance.currentUser!.uid,
              );
            }
          },
        ),
      ],
      child: BlocConsumer<MessageCubit, MessageState>(
        listenWhen: (previous, current) =>
            previous.messages != current.messages ||
            previous.isLoading != current.isLoading ||
            previous.errMessage != current.errMessage,
        listener: (context, state) {
          for (final msg in state.messages) {
            if (!chatController.initialMessageList.any((m) => m.id == msg.id)) {
              chatController.addMessage(msg);
            } else {
              final index = chatController.initialMessageList.indexWhere(
                (m) => m.id == msg.id,
              );
              if (index != -1 &&
                  chatController.initialMessageList[index] != msg) {
                chatController.initialMessageList[index].setStatus = msg.status;

                chatController.initialMessageList[index].statusNotifier;
              }
            }
          }
          context.read<MessageCubit>().markMessagesAsRead(
            chat.chatId,
            FirebaseAuth.instance.currentUser!.uid,
          );
        },
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.errMessage != current.errMessage,
        builder: (context, state) {
          return CustomChatView(
            chatController: chatController,
            chatViewState: state.isLoading || state.isConnection
                ? ChatViewState.loading
                : state.errMessage?.isNotEmpty ?? false
                ? ChatViewState.error
                : state.messages.isEmpty
                ? ChatViewState.noData
                : ChatViewState.hasMessages,
            onSendTap: (message, replyMessage, messageType) {
              final newMessage = Message(
                id: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(chat.chatId)
                    .collection('messages')
                    .doc()
                    .id,
                message: message,
                createdAt: DateTime.now(),
                sentBy: FirebaseAuth.instance.currentUser!.uid,
                replyMessage: replyMessage,
                messageType: messageType,
                status: MessageStatus.pending,
              );
              context.read<MessageCubit>().sendMessage(
                chat.chatId,
                newMessage,
                chat.uid,
              );
              chatController.scrollToLastMessage();
            },
          );
        },
      ),
    );
  }

  void buildAlertDialogFromUser(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('New Chat Request', style: Styling.textStyle15),
        content: Text(
          'State of chatting with ${chat.name} is ${chat.status}.',
          style: Styling.textStyle20,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.pop();
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }

  void buildAlertDialog(
    BuildContext context,
    final ApplyConnectionCubit cubit,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('New Chat Request', style: Styling.textStyle15),
        content: Text(
          'Do you want to start chatting with ${chat.name}?',
          style: Styling.textStyle20,
        ),
        actions: [
          TextButton(
            onPressed: () {
              cubit.notConnection(chat.chatId);
              Navigator.of(context).pop();
              AppConstant.showLoadingDialog(context);
              //context.pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              cubit.acceptConnection(chat.chatId);
              Navigator.of(context).pop();
              AppConstant.showLoadingDialog(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
