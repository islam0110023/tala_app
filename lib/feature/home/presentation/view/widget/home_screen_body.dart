import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/manager/event_cubit/event_cubit.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_header.dart';
import 'package:tala_app/feature/home/presentation/view/widget/tab_bar_view_page_home.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async{
        context.read<EventCubit>().getEvents();
      },
      displacement: 120,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r16),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h18),
              const CustomHomeHeader(),
              SizedBox(height: AppDimensions.h20),
              const TabBarViewPageHome(),
            ],
          ),
        ),
      ),
    );
  }
}
