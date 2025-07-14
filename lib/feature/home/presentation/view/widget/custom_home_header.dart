import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_rounded_icon.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_search_tab_bar.dart';

class CustomHomeHeader extends StatelessWidget {
  const CustomHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomHomeSearch(),
        SizedBox(width: AppDimensions.w5,),
        const CustomRoundedIcon(icon: Icons.filter_alt_outlined,),
        const CustomRoundedIcon(icon: Icons.notifications,),
      ],
    );
  }
}