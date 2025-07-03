import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chats_screen_header.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_search_field.dart';

class ChatsScreenBody extends StatefulWidget {
  const ChatsScreenBody({super.key});

  @override
  State<ChatsScreenBody> createState() => _ChatsScreenBodyState();
}

class _ChatsScreenBodyState extends State<ChatsScreenBody> {
  final List<Widget> _buildList = [
    const CustomPersonChat(img: AssetImage(AppImage.kImageIslam),name: 'Islam Ramadan', message: 'Can you buy me dinner?', time: '12:35', number: 100,),
    const CustomPersonChat(img: AssetImage(AppImage.kImageIslam),name: 'Sara Sanders', message: 'Can you buy me dinner?', time: '12:35', number: 100,),
    const CustomPersonChat(img: AssetImage(AppImage.kImageIslam),name: 'Sara Sanders', message: 'Can you buy me dinner?', time: '12:35', number: 100,),
    const CustomPersonChat(img: AssetImage(AppImage.kImageIslam),name: 'Sara Sanders', message: 'Can you buy me dinner?', time: '12:35', number: 100,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 12.h,),
                  const CustomChatsScreenHeader(),
                  SizedBox(height: AppDimensions.h17,),
                  const CustomSearchField(),
                  SizedBox(height: AppDimensions.h36,),
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: _buildList.length,
                  itemBuilder:(context, index) {
                    return _buildList[index];
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppDimensions.h12,),

              ),

            ],
          ),
        ),
      ),
    );
  }
}





