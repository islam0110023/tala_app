import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_outlined_button.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/cancel_reasons_grid.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/reason_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CancelTicketActions extends StatefulWidget {
  const CancelTicketActions({super.key});

  @override
  State<CancelTicketActions> createState() => _CancelTicketActionsState();
}

class _CancelTicketActionsState extends State<CancelTicketActions> {
  final List<String> reasons = AppConstant.kReasons;
  int? selectedIndex;
  late TextEditingController otherController;
  @override
  void initState() {
    otherController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CancelReasonsGrid(reasons: reasons, selectedIndex: selectedIndex, onSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },),
        SizedBox(height: AppDimensions.h20),
        Divider(color: AppColor.kDividerColor.withAlpha(50)),
        SizedBox(height: AppDimensions.h20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(LocaleKeys.other.tr(), style: Styling.textStyle16600Purple),
        ),
        SizedBox(height: AppDimensions.h17),
        ReasonTextField(otherController: otherController),
        SizedBox(height: AppDimensions.h26),
        CustomOutlinedButton(
          otherController: otherController,
          onPressed: () {
            selectedIndex != null
                ? reasons[selectedIndex!]
                : otherController.text.trim();
          }, hintText: LocaleKeys.cancelBooking.tr(),
        ),
      ],
    );
  }
}
