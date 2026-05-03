import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/event_show_manager.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_home_event_container.dart';
import 'package:tala_app/feature/profile_home/presentation/manager/event_favorite/event_favorite_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class FavoriteEventScreenBody extends StatelessWidget {
  const FavoriteEventScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const RSizedBox(height: 55),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomArrowBack(
                onTap: () {
                  context.pop();
                },
              ),
              Text(
                LocaleKeys.favorite.tr(),
                style: Styling.textStyle18700Purple,
              ),
              const RSizedBox(width: 15),
            ],
          ),
          const RSizedBox(height: 16),
          BlocBuilder<EventFavoriteCubit, EventFavoriteState>(
            builder: (context, state) {
              if (state is EventFavoriteSuccess) {
                return Expanded(
                  child: ListView.separated(
                    padding: REdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      return EventShowManager(
                        event: state.events[index],
                        isFav: true,
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

              return const SizedBox();
            },
          ),
          const RSizedBox(height: 24),
        ],
      ),
    );
  }
}
