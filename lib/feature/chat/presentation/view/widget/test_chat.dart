import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_rounded_chat_icon_button.dart';

class CustomChatView extends StatelessWidget {
  const CustomChatView({
    super.key,
    this.onSendTap,
    this.loadMoreData,
    this.chatController,
    this.onTypeWriterStatus,
    this.status,
    this.onReactionTap,
  });
  final void Function(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  )?
  onSendTap;
  final Future<void> Function()? loadMoreData;
  final ChatController? chatController;
  final void Function(TypeWriterStatus typeWriterStatus)? onTypeWriterStatus;
  final String? status;
  final void Function(Message message, String emoje)? onReactionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChatView(
        isLastPage: true,
        chatController: chatController!,
        onSendTap: onSendTap,
        loadMoreData: loadMoreData,
        featureActiveConfig: const FeatureActiveConfig(
          enableOtherUserProfileAvatar: false,
          enableOtherUserName: false,
          lastSeenAgoBuilderVisibility: false,
          receiptsBuilderVisibility: true,
        ),
        chatViewState: ChatViewState.hasMessages,
        appBar: ChatViewAppBar(
          profilePicture: chatController!.otherUsers[0].profilePhoto,
          chatTitle: chatController!.otherUsers[0].name,
          chatTitleTextStyle: Styling.chatNumberStyle,
          userStatus: status,
          userStatusTextStyle: Styling.chatStateStyle,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(right: AppDimensions.r13),
            child: CustomArrowBack(
              onTap: () {
                context.pop();
              },
            ),
          ),
          actions: [
            CustomRoundedChatButton(
              icon: Icons.call,
              onPressed: () {},
              radius: AppDimensions.r50,
            ),
          ],
        ),
        chatBackgroundConfig: ChatBackgroundConfiguration(
          backgroundColor: AppColor.kWhite1,
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r20),
        ),

        sendMessageConfig: SendMessageConfiguration(
          allowRecordingVoice: true,
          enableCameraImagePicker: true,
          enableGalleryImagePicker: true,
          cancelRecordConfiguration: const CancelRecordConfiguration(),
          voiceRecordingConfiguration: const VoiceRecordingConfiguration(
            androidEncoder: AndroidEncoder.aac,
            androidOutputFormat: AndroidOutputFormat.mpeg4,
            bitRate: 256000,
            sampleRate: 44100,
            iosEncoder: IosEncoder.kAudioFormatMPEG4AAC,
            waveStyle: WaveStyle(
              waveColor: Color(0xffEE5366),
              showBottom: true,
              showMiddleLine: true,
              extendWaveform: true,
              showDurationLabel: true,
              showHourInDuration: true,
              showTop: true,
              waveCap: StrokeCap.round,
            ),
            backgroundColor: Colors.white,
          ),
          imagePickerIconsConfig: const ImagePickerIconsConfiguration(
            cameraIconColor: Color(0xffEE5366),
            galleryIconColor: Color(0xffEE5366),
          ),
          textFieldBackgroundColor: Colors.grey[100],
          textFieldConfig: TextFieldConfiguration(
            hintText: 'Type a message',
            hintStyle: const TextStyle(color: Colors.grey),
            textStyle: const TextStyle(color: Colors.black),
            borderRadius: BorderRadius.circular(AppDimensions.r20),
            onMessageTyping: onTypeWriterStatus,
          ),
          replyMessageColor: Colors.grey,
          defaultSendButtonColor: const Color(0xffEE5366),
        ),
        chatBubbleConfig: ChatBubbleConfiguration(
          outgoingChatBubbleConfig: ChatBubble(
            color: AppColor.kPrimaryPink,
            textStyle: Styling.textStyleChat12.copyWith(color: Colors.white),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.r10),
              topRight: Radius.circular(AppDimensions.r10),
              bottomLeft: Radius.circular(AppDimensions.r10),
            ),
            margin: EdgeInsets.only(
              bottom: AppDimensions.r16,
              right: AppDimensions.r8,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.r12,
              vertical: AppDimensions.r8,
            ),
            receiptsWidgetConfig: ReceiptsWidgetConfig(
              showReceiptsIn: ShowReceiptsIn.all,
              receiptsBuilder: (status) {
                switch (status) {
                  case MessageStatus.read:
                    return Icon(
                      Icons.done_all,
                      color: Colors.blue,
                      size: AppDimensions.r16,
                    );
                  case MessageStatus.delivered:
                    return Icon(
                      Icons.done_all,
                      color: Colors.grey,
                      size: AppDimensions.r16,
                    );
                  case MessageStatus.undelivered:
                    return Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: AppDimensions.r16,
                    );
                  case MessageStatus.pending:
                    return Icon(
                      Icons.done,
                      color: Colors.grey,
                      size: AppDimensions.r16,
                    );
                }
              },
            ),
          ),
          inComingChatBubbleConfig: ChatBubble(
            color: const Color(0x82D9D9D9),
            textStyle: Styling.textStyleChat12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.r10),
              topRight: Radius.circular(AppDimensions.r10),
              bottomRight: Radius.circular(AppDimensions.r10),
            ),
            margin: EdgeInsets.only(
              bottom: AppDimensions.r16,
              left: AppDimensions.r8,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.r12,
              vertical: AppDimensions.r8,
            ),
          ),
        ),
        reactionPopupConfig: ReactionPopupConfiguration(
          backgroundColor: Colors.white,
          userReactionCallback: onReactionTap,
          shadow: BoxShadow(color: Colors.grey.withAlpha(64), blurRadius: 10),
        ),

        messageConfig: MessageConfiguration(
          messageReactionConfig: MessageReactionConfiguration(
            borderRadius: BorderRadius.circular(AppDimensions.r12),
          ),
          imageMessageConfig: ImageMessageConfiguration(
            height: AppDimensions.r200,
            width: AppDimensions.r200,
            hideShareIcon: true,
          ),
        ),
        typeIndicatorConfig: const TypeIndicatorConfiguration(
          flashingCircleBrightColor: const Color(0x82D9D9D9),
          flashingCircleDarkColor: Colors.grey,
          indicatorSize: 8,
        ),
      ),
    );
  }
}

// void initState() {
//   super.initState();
//   chatController = ChatController(
//     initialMessageList: [],
//     scrollController: ScrollController(),
//     currentUser: const ChatUser(id: '1', name: 'Bruce'),
//     otherUsers: const [
//       ChatUser(
//         id: '2',
//         name: 'Doris Diaz',
//         profilePhoto:
//             'https://media.craiyon.com/2025-08-08/8AU1VGWBTAGr9NvVVPmeNQ.webp',
//       ),
//     ],
//   );
// }
// @override
// void dispose() {
//   chatController.dispose();
//   super.dispose();
// }
// void _onSendTap(
//   String message,
//   ReplyMessage replyMessage,
//   MessageType messageType,
// ) {
//   final newMessage = Message(
//     id: DateTime.now().millisecondsSinceEpoch.toString(),
//     message: message,
//     createdAt: DateTime.now(),
//     sentBy: '1',
//     replyMessage: replyMessage,
//     messageType: messageType,
//     status: MessageStatus.read,
//   );
//
//   chatController.addMessage(newMessage);
//   Future.delayed(const Duration(seconds: 2), () {
//     chatController.setTypingIndicator = false;
//   });
// }
