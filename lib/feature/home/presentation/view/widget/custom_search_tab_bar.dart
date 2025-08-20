import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomHomeSearch extends StatelessWidget {
  const CustomHomeSearch({super.key, this.isHome=false, this.focusNode, this.controller, this.onSubmitted});
  final bool isHome;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isHome) {
            GoRouter.of(context).push(AppRoutes.searchScreen);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.r25),
            boxShadow: const [
              BoxShadow(
                color: AppColor.kBoxShadowColor,
                blurRadius: 15,
                offset: Offset(8, 8),
              ),
            ],
          ),
          child: TextField(
            onSubmitted: onSubmitted,
            focusNode: focusNode,
            controller: controller,
            ignorePointers: isHome,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.r25),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.r25),
                borderSide: BorderSide(
                  color: AppColor.kPrimaryPink,
                  width: AppDimensions.r2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.r25),
                borderSide: BorderSide(
                  color: AppColor.kPrimaryPink,
                  width: AppDimensions.r2,
                ),
              ),
              prefixIcon:  Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppDimensions.r11),
                child: Icon(Icons.search, color: AppColor.kGray,size: AppDimensions.r24,),
              ),
              hintText: '${LocaleKeys.search}...',
              hintStyle: Styling.searchHomeHintStyle,
            ),
          ),
        ),
      ),
    );
  }
}
