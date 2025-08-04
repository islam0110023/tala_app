import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';

class CustomFirstCardDating extends StatelessWidget {
  const CustomFirstCardDating({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchUserEntity? matchUser = MatchUserProvider.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: AppDimensions.h377,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.kLightCloud,
              AppColor.kSoftPinkAura,
              AppColor.kVibrantRoseGlow,
            ],
            stops: [0.2, .5, .7],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(matchUser?.name ?? 'Unknown', style: Styling.textStyle32),
            Text(
              '${matchUser?.old ?? 0} years,${matchUser?.location ?? 'Unknown'}',
              style: Styling.textStyle18,
            ),

            ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: matchUser?.passions.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  '• ${matchUser?.passions[index] ?? 'Unknown'}',
                  style: Styling.textStyle14,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
