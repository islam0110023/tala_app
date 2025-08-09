import 'package:flutter/material.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/cancel_reason_button.dart';

class CancelReasonsGrid extends StatelessWidget {

  const CancelReasonsGrid({
    super.key,
    required this.reasons,
    required this.selectedIndex,
    required this.onSelected,
  });
  final List<String> reasons;
  final int? selectedIndex;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 8,
        childAspectRatio: 150/60,
      ),
      itemCount: reasons.length,
      itemBuilder: (context, index) {
        return CancelReasonButton(
          text: reasons[index],
          isSelected: selectedIndex == index,
          onTap: () {
            onSelected(index);
          },
          width: double.infinity,
        );
      },
    );
  }
}

