import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomTimeWithMarkReadRow extends StatelessWidget {

  const CustomTimeWithMarkReadRow({
    super.key,
    required this.time,
    required this.onMarkAllRead,
  });
  final String time;
  final VoidCallback onMarkAllRead;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(time, style: Styling.textStyle14700White),
        InkWell(
          onTap: onMarkAllRead,
          child: Text(
            LocaleKeys.mark_all_as_read.tr(),
            textAlign: TextAlign.right,
            style: Styling.textStyle14700White,
          ),
        ),
      ],
    );
  }
}

