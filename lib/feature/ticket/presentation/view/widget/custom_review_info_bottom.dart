import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomReviewInfoBottom extends StatelessWidget {
  const CustomReviewInfoBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.ticket,),
        const Icon(Icons.paypal,),
        const Spacer(),
        Text(
          LocaleKeys.change.tr(),
          style: Styling.textStyle13600Pink
        )

      ],
    );
  }
}