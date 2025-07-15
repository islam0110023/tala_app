import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomItemDropDownProfile extends StatelessWidget {
  const CustomItemDropDownProfile({
    super.key,
    required this.name,
    required this.onTap,
    this.isSelected = false,
  });
  final String name;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: Icon(
        isSelected ? Icons.check_box_outlined : Icons.check_box_outline_blank,
        color: isSelected?AppColor.kPrimaryPink: AppColor.kBlack25,
      ),
      title: Text(name, style: Styling.textStyle13),
    );
  }
}
