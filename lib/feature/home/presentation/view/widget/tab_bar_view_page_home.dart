import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/home/presentation/manager/event_cubit/event_cubit.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/event_show_manager.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_card_shimmer_event.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_event_container.dart';

class TabBarViewPageHome extends StatefulWidget {
  const TabBarViewPageHome({super.key});

  @override
  State<TabBarViewPageHome> createState() => _TabBarViewPageHomeState();
}

class _TabBarViewPageHomeState extends State<TabBarViewPageHome>
    with SingleTickerProviderStateMixin {
  // late TabController tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   tabController = TabController(length: 4, vsync: this);
  //   tabController.addListener(() {
  //     setState(() {});
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventLoading) {
          return Expanded(
            child: ListView.separated(
              padding: REdgeInsets.only(bottom: 10),
              itemBuilder: (context, index) {
                return const CustomCardShimmerEvent();
              },
              separatorBuilder: (context, index) {
                return const RSizedBox(height: 16);
              },
              itemCount: 10,
            ),
          );
        }
        else if (state is EventSuccess) {
          return Expanded(
            child: ListView.separated(
              padding: REdgeInsets.only(bottom: 10),
              itemBuilder: (context, index) {
                return EventShowManager(
                  event: state.events[index],
                  isFav: false,
                  child: const CustomHomeEventContainer(),
                );
              },
              separatorBuilder: (context, index) {
                return const RSizedBox(height: 16);
              },
              itemCount: state.events.length,
            ),
          );
        }
        else if (state is EventFailure) {
          return Expanded(
            child: ListView(
              children: [
                const RSizedBox(height: 200),
                Text(
                  'Something went wrong',
                  style: Styling.textStyle32.copyWith(color: AppColor.kBlack),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
    // return Column(
    //   children: [
    //     // CustomTabBar(tabController: tabController),
    //     // SizedBox(height: AppDimensions.h20),
    //     // Expanded(
    //     //   child: TabBarView(
    //     //     controller: tabController,
    //     //     children: const [
    //     //       CustomHomeEventContainer(),
    //     //       CustomHomeEventContainer(),
    //     //       CustomHomeEventContainer(),
    //     //       CustomHomeEventContainer(),
    //     //     ],
    //     //   ),
    //     // ),
    //
    //   ],
    // );
  }
}
