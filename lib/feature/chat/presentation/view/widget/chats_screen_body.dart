import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_upper_chat.dart';

class ChatsScreenBody extends StatelessWidget {
  const ChatsScreenBody({super.key});

  static const List<Widget> _buildList = [
    CustomPersonChat(
      img: AssetImage(AppImage.kImageIslam),
      name: 'Islam Ramadan',
      message: 'Can you buy me dinner?',
      time: '12:35',
      number: 100,
    ),
    CustomPersonChat(
      img: AssetImage(AppImage.kImageIslam),
      name: 'Sara Sanders',
      message: 'Can you buy me dinner?',
      time: '12:35',
      number: 50,
    ),
    CustomPersonChat(
      img: AssetImage(AppImage.kImageIslam),
      name: 'Sara Sanders',
      message: 'Can you buy me dinner?',
      time: '12:35',
      number: 0,
    ),
    CustomPersonChat(
      img: AssetImage(AppImage.kImageIslam),
      name: 'Sara Sanders',
      message: 'Can you buy me dinner?',
      time: '12:35',
      number: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: Column(
          children: [
            const CustomUpperChat(),
            Expanded(
              child: ListView.separated(
                itemCount: _buildList.length,
                itemBuilder: (context, index) {
                  return _buildList[index];
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: AppDimensions.h6,
                  thickness: AppDimensions.sp1,
                  indent: AppDimensions.w68,
                  color: AppColor.kDividerColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
