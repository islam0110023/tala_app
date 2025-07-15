import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_item_drop_down_profile.dart';

class CustomDropDownSelect extends StatefulWidget {
  const CustomDropDownSelect({
    super.key,
    required this.label,
    required this.options,
    this.selectedValues,
    this.onChanged,
    required this.hint,
    this.multiSelect = true,
  });
  final String label;
  final List<String> options;
  final List<String>? selectedValues;
  final void Function(List<String>)? onChanged;
  final String hint;
  final bool multiSelect;

  @override
  State<CustomDropDownSelect> createState() => _CustomDropDownSelectState();
}

class _CustomDropDownSelectState extends State<CustomDropDownSelect> {
  bool isShow = false;
  late List<String> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.selectedValues ?? [];
  }

  void toggleShow() {
    setState(() {
      isShow = !isShow;
    });
  }

  void toggleSelection(String value) {
    setState(() {
      if (widget.multiSelect) {
        if (selectedItems.contains(value)) {
          selectedItems.remove(value);
        } else {
          selectedItems.add(value);
        }
      } else {
        selectedItems = [value];
        isShow = false;
      }
    });

    if (widget.onChanged != null) {
      widget.onChanged!(selectedItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedText = selectedItems.isEmpty
        ? widget.hint
        : selectedItems.join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Styling.textStyle15.copyWith(
            color: AppColor.kBlack,
            height: 1.13,
          ),
        ),
        SizedBox(height: AppDimensions.h9),
        GestureDetector(
          onTap: toggleShow,
          child: Container(
            padding: EdgeInsets.all(AppDimensions.r3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.kLightPink, AppColor.kDarkPurple],
              ),
            ),
            child: Container(
              height: AppDimensions.h51,
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.r13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.r11),
                color: AppColor.kWhite1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      selectedText,
                      overflow: TextOverflow.ellipsis,
                      style: Styling.textStyle13,
                    ),
                  ),
                  Icon(
                    isShow
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: AppDimensions.r24,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isShow)
          Container(
            padding: EdgeInsets.all(AppDimensions.r3),
            margin: EdgeInsets.only(top: AppDimensions.r8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.kLightPink, AppColor.kDarkPurple],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.r11),
                color: AppColor.kWhite1,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final item = widget.options[index];
                  return CustomItemDropDownProfile(
                    name: item,
                    isSelected: selectedItems.contains(item),
                    onTap: () => toggleSelection(item),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
