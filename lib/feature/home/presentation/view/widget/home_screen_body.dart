import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_header.dart';
import 'package:tala_app/feature/home/presentation/view/widget/tab_bar_view_page_home.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:AppDimensions.r16),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.h18),
            const CustomHomeHeader(),
            SizedBox(height: AppDimensions.h20),
            const TabBarViewPageHome(),
          ],
        ),
      ),
    );
  }
}
