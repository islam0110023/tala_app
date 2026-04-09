import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/model/build_user_profile_text.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/profile/domain/params/pinecone_param.dart';
import 'package:tala_app/feature/profile/presentation/manager/open_ai_cubit/open_ai_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/save_user_cubit/save_user_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/store_vector_cubit/store_vector_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_2.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDownProfileLike2 extends StatelessWidget {
  const CustomDownProfileLike2({super.key, required this.profileFormKey});

  final GlobalKey<CustomFieldsProfileLike2State> profileFormKey;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OpenAiCubit, OpenAiState>(
          listener: (context, state) async {
            if (state is OpenAiFailure) {
              if (context.canPop()) {
                context.pop();
              }
              AppConstant.buildShowSnackBar(context, state.errMessage);
            }
            if (state is OpenAiSuccess) {
              final vector = context.read<OpenAiCubit>().vector;
              final cubit = BlocProvider.of<UserFormCubit>(context);

              final imageUrl = await ChatsRemoteDataSourceImpl().getUrl(
                'profiles/images/${cubit.state.uid}.jpg',
                File(cubit.state.image!),
              );
              cubit.setImage(imageUrl);
              final user = cubit.build();
              context.read<StoreVectorCubit>().storeVector(
                PineconeParam(vector: vector!, user: user),
              );
            }
          },
        ),
        BlocListener<StoreVectorCubit, StoreVectorState>(
          listener: (context, state) {
            if (state is StoreVectorFailure) {
              if (context.canPop()) {
                context.pop();
              }
              AppConstant.buildShowSnackBar(context, state.errMessage);
            }
            if (state is StoreVectorSuccess) {
              saveUser(context);
            }
          },
        ),
        BlocListener<SaveUserCubit, SaveUserState>(
          listener: (context, state) {
            if (state is SaveUserSuccess) {
              if (context.canPop()) {
                context.pop();
              }

              AppConstant.buildShowSnackBar(
                context,
                LocaleKeys.profile_completed.tr(),
                ContentType.success,
                LocaleKeys.welcome.tr(),
              );
              GoRouter.of(context).go(AppRoutes.homeScreen);
            }
            if (state is SaveUserFailure) {
              if (context.canPop()) {
                context.pop();
              }
              AppConstant.buildShowSnackBar(context, state.errMessage);
            }
          },
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onTap: () async {
                final isConnected = getIt<InternetService>().isConnected;
                if (!isConnected) {
                  AppConstant.buildShowSnackBar(
                    context,
                    LocaleKeys.noInternetConnection.tr(),
                  );
                  return;
                }
                sendUserToOpenAi(context);
              },
              name: LocaleKeys.next.tr(),
            ),
            SizedBox(height: AppDimensions.h20),
          ],
        ),
      ),
    );
  }

  void saveUser(BuildContext context) {
    final cubit = BlocProvider.of<UserFormCubit>(context);
    final userModel = cubit.build();
    BlocProvider.of<SaveUserCubit>(context).saveUser(userModel);
  }

  void sendUserToOpenAi(BuildContext context) {
    if (profileFormKey.currentState!.validate()) {
      final personality = profileFormKey.currentState!.setAllValues();
      AppConstant.showLoadingDialog(context);
      final cubit = BlocProvider.of<UserFormCubit>(context);
      cubit.setPersonality(personality);
      final uid = FirebaseAuth.instance.currentUser!.uid;
      cubit.setUid(uid);
      cubit.setComplete();
      final userModel = cubit.build();
      final createPrompt = buildUserProfileText(userModel);
      cubit.setBio(createPrompt);
      context.read<OpenAiCubit>().createVectorWithAI(createPrompt);
      FocusScope.of(context).unfocus();
    }
  }
}
