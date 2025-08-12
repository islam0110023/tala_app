import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_upper_chat.dart';

class ChatsScreenBody extends StatelessWidget {
  const ChatsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomUpperChat()),
            SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomPersonChat(
                  img: AssetImage(AppImage.kImageIslam),
                  name: 'Islam Ramadan',
                  message: 'Can you buy me dinner?',
                  time: '12:35',
                  number: 100,
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: AppDimensions.h6,
                thickness: AppDimensions.sp1,
                indent: AppDimensions.w68,
                color: AppColor.kDividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
