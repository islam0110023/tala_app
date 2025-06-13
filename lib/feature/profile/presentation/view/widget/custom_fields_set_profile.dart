import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_dropdown.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';

class CustomFieldsSetProfile extends StatefulWidget {
  const CustomFieldsSetProfile({super.key});

  @override
  State<CustomFieldsSetProfile> createState() => _CustomFieldsSetProfileState();
}

class _CustomFieldsSetProfileState extends State<CustomFieldsSetProfile> {
  late TextEditingController date;
  final List<String> genderOptions = ['Male', 'Female'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hint: 'Name',
          suffixIcon: Icon(CupertinoIcons.person_crop_circle),
        ),
        SizedBox(height: AppDimensions.h14),
        CustomDropdown(options: genderOptions),
        SizedBox(height: AppDimensions.h14),
        CustomTextField(
          controller: date,
          readOnly: true,
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(1900),

              lastDate: DateTime.now(),
            ).then((value) {
              date.text =
                  "${value!.day.toString().padLeft(2, "0")}/${value.month.toString().padLeft(2, "0")}/${value.year.toString()}";
            });
          },
          hint: 'Date',
          suffixIcon: Icon(CupertinoIcons.calendar),
          textInputType: TextInputType.datetime,
        ),
        SizedBox(height: AppDimensions.h14),
        const CustomTextField(
          hint: 'Location',
          suffixIcon: Icon(CupertinoIcons.location_solid),
        ),
      ],
    );
  }
}
