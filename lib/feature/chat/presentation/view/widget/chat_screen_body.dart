import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/presentation/manager/apply_connection/apply_connection_cubit.dart';
import 'package:tala_app/feature/chat/presentation/manager/check_connection/check_connection_cubit.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_field_row.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_header_chat_row.dart';

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  late final ChatEntity chat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chat = GoRouter.of(context).state.extra as ChatEntity;
    context.read<CheckConnectionCubit>().checkConnection(chat.uid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: AppDimensions.r24),
          child: Column(
            children: [
              const CustomHeaderChatRow(),
              SizedBox(height: AppDimensions.h30),
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
                child: BlocConsumer<CheckConnectionCubit, CheckConnectionState>(
                  listener: (context, state) {
                    if (state is CheckConnectionNotConnection) {
                      buildAlertDialog(
                        context,
                        context.read<ApplyConnectionCubit>(),
                      );
                    }
                    if (state is CheckConnectionNoConnectionFromUser) {
                      buildAlertDialogFromUser(context);
                    }
                  },
                  builder: (context, state) {
                    return Expanded(child: ListView());
                  },
                ),
              ),

              const CustomChatFieldRow(),
              SizedBox(height: AppDimensions.h12),
            ],
          ),
        ),
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
