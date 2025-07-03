import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';

class CustomChatsScreenHeader extends StatelessWidget {
  const CustomChatsScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomChatImageContainer(img: AssetImage(AppImage.kImageIslam) ,width: 45, height: 45,),
        const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.plus))

      ],
    );
  }
}
