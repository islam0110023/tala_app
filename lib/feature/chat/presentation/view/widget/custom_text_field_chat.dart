import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomTextFieldChat extends StatelessWidget {
  const CustomTextFieldChat({
    super.key,
    required this.controller,
    required this.onPressedFile,
    required this.onPressedCamera,
  });
  final TextEditingController controller;
  final VoidCallback onPressedFile;
  final VoidCallback onPressedCamera;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      minLines: 1,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimensions.r10,
          vertical: AppDimensions.r15,
        ),
        hintText: LocaleKeys.type_a_message.tr(),
        hintStyle: Styling.chatFieldStyle,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.attach_file_rounded,
                color: AppColor.kPrimaryPink,
                size: AppDimensions.r24,
              ),
              onPressed: onPressedFile,
            ),
            IconButton(
              icon: Icon(
                Icons.camera_alt_rounded,
                color: AppColor.kPrimaryPink,
                size: AppDimensions.r24,
              ),
              onPressed: onPressedCamera,
            ),
          ],
        ),
        // prefixIcon: IconButton(
        //   icon: Icon(
        //     Icons.tag_faces_rounded,
        //     color: AppColor.kPrimaryPink,
        //     size: AppDimensions.r24,
        //   ),
        //   onPressed: () {},
        // ),
        border: InputBorder.none,
      ),
    );
  }
}
