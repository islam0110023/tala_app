import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';

class EventDetailsScreenBody extends StatelessWidget {
  const EventDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final event = GoRouterState.of(context).extra as EventModel;
    return SingleChildScrollView(
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
              Text('Event Details', style: Styling.textStyle18700Purple),
              const RSizedBox(width: 15),
            ],
          ),
          const RSizedBox(height: 16),
          Container(
            padding: REdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFA771ED), width: 1.r),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12.r),

                  child: CachedNetworkImage(
                    imageUrl: event.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250.h,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kPrimaryPink,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.w,
                  top: 10.h,
                  child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          'person ',
                          style: Styling.textStyle12.copyWith(
                            color: const Color(0xFFFF4F9D),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$${event.price}.00',
                                style: Styling.textStyle161.copyWith(
                                  color: const Color(0xFFFF4F9D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const RSizedBox(height: 24),
          Text(event.name, style: Styling.textStyle24),
          const RSizedBox(height: 16),
          Row(
            spacing: 2.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on_outlined, color: Color(0xFF650F82)),
              Text(event.location, style: Styling.textStyle161),
            ],
          ),
          const RSizedBox(height: 16),
          Container(
            padding: REdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFDB0165), width: 1.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: Styling.textStyle18.copyWith(
                    color: const Color(0xFF530A6A),
                  ),
                ),
                const RSizedBox(height: 10),
                Text(event.description, style: Styling.textStyle12),
              ],
            ),
          ),
          const RSizedBox(height: 24),
          Container(
            padding: REdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFDB0165), width: 1.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 13.h,
                    children: [
                      Text(
                        'Start Date',
                        style: Styling.textStyle14.copyWith(
                          color: const Color(0xFF676067),
                        ),
                      ),
                      Text(
                        'Booking deadline',
                        style: Styling.textStyle14.copyWith(
                          color: const Color(0xFF676067),
                        ),
                      ),
                      Text(
                        'Capacity',
                        style: Styling.textStyle14.copyWith(
                          color: const Color(0xFF676067),
                        ),
                      ),
                      Text(
                        'Event type',
                        style: Styling.textStyle14.copyWith(
                          color: const Color(0xFF676067),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 13.h,
                    children: [
                      Text(
                        event.dateTime,
                        style: Styling.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        event.bookingEndAt,
                        style: Styling.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        event.capacity.toString(),
                        style: Styling.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        event.eventType,
                        style: Styling.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const RSizedBox(height: 16),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'State : ',
                  style: Styling.textStyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '${event.status}',
                  style: Styling.textStyle16.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFDB0165),
                  ),
                ),
              ],
            ),
          ),
          const RSizedBox(height: 24),
          CustomButton(onTap: () {}, name: 'Book Now'),
          const RSizedBox(height: 32),
        ],
      ),
    );
  }
}
