import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chats_screen_header.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_search_field.dart';

class CustomUpperChat extends StatelessWidget {
  const CustomUpperChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:AppDimensions.h12,),
        const CustomChatsScreenHeader(),
        SizedBox(height: AppDimensions.h17,),
        const CustomSearchField(),
        SizedBox(height: AppDimensions.h36,),
      ],
    );
  }
}
