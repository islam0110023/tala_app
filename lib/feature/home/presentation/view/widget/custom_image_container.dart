import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/home/presentation/manager/event_cubit/event_cubit.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/event_show_manager.dart';
import 'package:tala_app/feature/profile_home/presentation/manager/event_favorite/event_favorite_cubit.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final event = EventShowManager.of(context).event;
    final isFav = EventShowManager.of(context).isFav;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.r20),
          child: Container(
            width: double.infinity,
            height: AppDimensions.h240,
            decoration: ShapeDecoration(
              // image: const DecorationImage(
              //   image: AssetImage(AppImage.kImageTest),
              //   fit: BoxFit.fill,
              // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.r20),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: event.image,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return const Icon(Icons.error, color: Colors.red);
              },
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColor.kPrimaryPink),
              ),
            ),
          ),
        ),
        Positioned(
          top: AppDimensions.r10,
          right: AppDimensions.r10,
          child: InkWell(
            onTap: () {
              if (isFav) {
                context.read<EventFavoriteCubit>().toggleFavorite(event);
              } else {
                context.read<EventCubit>().toggleFavorite(event);
              }
            },
            radius: AppDimensions.r10,
            borderRadius: const BorderRadius.all(Radius.circular(180)),
            child: Container(
              padding: EdgeInsets.all(AppDimensions.r10),
              decoration: BoxDecoration(
                color: AppColor.kWhite,
                borderRadius: BorderRadius.circular(180),
              ),
              child: Icon(
                event.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColor.kPrimaryPink,
              ),
            ),
          ),
        ),
        Positioned(
          top: AppDimensions.r10,
          left: AppDimensions.r10,
          child: Container(
            padding: EdgeInsets.all(AppDimensions.r10),
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '\$${event.price.toString()}.00',
              style: Styling.textStyle16700.copyWith(
                color: AppColor.kPrimaryPink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
