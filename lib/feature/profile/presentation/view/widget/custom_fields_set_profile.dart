import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';

class CustomFieldsSetProfile extends StatelessWidget {
  const CustomFieldsSetProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hint: 'Name',suffixIcon: Icon(CupertinoIcons.person_crop_circle),),
        SizedBox(height: AppDimensions.h14,),
        const CustomTextField(hint: 'Gender',suffixIcon: Icon(CupertinoIcons.chevron_down),),
        SizedBox(height: AppDimensions.h14,),
        const CustomTextField(hint: 'Date',suffixIcon: Icon(CupertinoIcons.calendar),textInputType: TextInputType.datetime),
        SizedBox(height: AppDimensions.h14,),
        const CustomTextField(hint: 'Location',suffixIcon: Icon(CupertinoIcons.location_solid),),
      ],
    );
  }
}
