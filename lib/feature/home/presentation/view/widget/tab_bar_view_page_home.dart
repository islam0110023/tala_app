import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_event_container.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_tab_bar.dart';

class TabBarViewPageHome extends StatefulWidget {
  const TabBarViewPageHome({super.key});

  @override
  State<TabBarViewPageHome> createState() => _TabBarViewPageHomeState();
}

class _TabBarViewPageHomeState extends State<TabBarViewPageHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTabBar(tabController: tabController),
          SizedBox(height: AppDimensions.h20),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                CustomHomeEventContainer(),
                CustomHomeEventContainer(),
                CustomHomeEventContainer(),
                CustomHomeEventContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
