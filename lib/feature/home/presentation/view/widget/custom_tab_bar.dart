import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_tab_widget.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      tabs: List.generate(4, (index) {
        return CustomTabWidget(
          text: ['For you', 'Trending', 'Popular', 'Nearby'][index],
          isSelected: _tabController.index == index,
        );
      }),
      dividerColor: Colors.transparent,
      splashBorderRadius: BorderRadius.circular(AppDimensions.r25),
      physics: const BouncingScrollPhysics(),
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.center,
      indicator:  BoxDecoration(

        color: AppColor.kPrimaryPink,
        borderRadius: BorderRadius.circular(AppDimensions.r25),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColor.kWhite,
      unselectedLabelStyle: Styling.textStyle16700,
      unselectedLabelColor: AppColor.kPrimaryPink,
      labelStyle: Styling.tabStyle,
      labelPadding: EdgeInsets.symmetric(horizontal: AppDimensions.r8),
    );
  }
}