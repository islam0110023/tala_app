import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_form_profile_set_info.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ProfileSetInfoScreenBody extends StatelessWidget {
  const ProfileSetInfoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h47),
              CustomArrowBack(
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              SizedBox(height: AppDimensions.h18),
              CustomTitle(title: LocaleKeys.shareYourWorld.tr(), textFont: 28),
              SizedBox(height: AppDimensions.h36),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.kPrimaryPink,
                      shape: BoxShape.circle,
                    ),
                    height: AppDimensions.h176,
                    width: AppDimensions.w180,
                    //padding: EdgeInsets.only(top: AppDimensions.h38),
                    child: ClipOval(
                      child: BlocBuilder<UserFormCubit, UserModelBuilder>(
                        builder: (context, state) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: state.image != null
                                ? state.image!.startsWith('http')
                                      ? Image.network(
                                          state.image!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                      : Image.file(
                                          File(state.image!),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: AppDimensions.h38,
                                    ),
                                    child: SvgPicture.asset(
                                      AppImage.kPersonPicture,
                                    ),
                                  ),
                          );
                          // if (state.image != null) {
                          //   return Image.file(
                          //     File(state.image!),
                          //     fit: BoxFit.cover,
                          //     width: double.infinity,
                          //     height: double.infinity,
                          //   );
                          // } else {
                          //   return Padding(
                          //     padding: EdgeInsets.only(top: AppDimensions.h38),
                          //     child: SvgPicture.asset(
                          //       AppImage.kPersonPicture,
                          //       fit: BoxFit.contain,
                          //     ),
                          //   );
                          // }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: PopupMenuButton(
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'camera', child: Text('Camera')),
                        PopupMenuItem(value: 'gallery', child: Text('Gallery')),
                      ],
                      color: Colors.white,
                      menuPadding: REdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.r16),
                      ),
                      onSelected: (value) async {
                        final picker = ImagePicker();
                        final cubit = context.read<UserFormCubit>();

                        if (value == 'camera') {
                          final image = await picker.pickImage(
                            source: ImageSource.camera,
                          );
                          cubit.setImage(image?.path);
                        } else if (value == 'gallery') {
                          final image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          cubit.setImage(image?.path);
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.kPrimaryPink,
                          shape: BoxShape.circle,
                        ),
                        height: AppDimensions.r30,
                        width: AppDimensions.r30,
                        padding: EdgeInsets.all(AppDimensions.r5),
                        child: const Icon(
                          CupertinoIcons.pen,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.h23),
              const CustomFormProfileSetInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
