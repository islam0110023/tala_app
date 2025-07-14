import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_event_container.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_header.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_tab_bar.dart';
class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: AppDimensions.h18),
            const CustomHomeHeader(),
            SizedBox(height: AppDimensions.h20,),
            CustomTabBar(tabController: _tabController),
            SizedBox(height: AppDimensions.h20,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                  children: const [
                    CustomHomeEventContainer(),
                    CustomHomeEventContainer(),
                    CustomHomeEventContainer(),
                    CustomHomeEventContainer(),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















