import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/profile_home/presentation/manager/privacy_policy/privacy_policy_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class PrivacyPolicyScreenBody extends StatelessWidget {
  const PrivacyPolicyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<PrivacyPolicyCubit>().getPrivacyPolicy();
      },
      color: Platform.isIOS ? null : AppColor.kPrimaryPink,
      displacement: 100,

      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const RSizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomArrowBack(
                  onTap: () {
                    context.pop();
                  },
                ),
                Text(
                  LocaleKeys.privacy_policy.tr(),
                  style: Styling.textStyle18700Purple,
                ),
                const RSizedBox(width: 15),
              ],
            ),
            // const RSizedBox(height: 30),
            BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
              builder: (context, state) {
                if (state is PrivacyPolicySuccess) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const RSizedBox(height: 16),
                      itemCount: state.model.sections.length,
                      itemBuilder: (context, index) {
                        final section = state.model.sections[index];

                        return Container(
                          padding: REdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                section.title,
                                style: Styling.textStyle18.copyWith(
                                  color: AppColor.kBlack,
                                ),
                              ),

                              const RSizedBox(height: 8),
                              ...section.points.map(
                                (point) => Padding(
                                  padding: REdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('• '),
                                      Expanded(
                                        child: Text(
                                          point,
                                          style: Styling.textStyleChat14.copyWith(
                                            color: AppColor.kBlack,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      cacheExtent: 500,
                    ),
                  );
                }
                if (state is PrivacyPolicyLoading) {
                  return const Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kPrimaryPink,
                      ),
                    ),
                  );
                }
                if (state is PrivacyPolicyFailure) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message, style: Styling.textStyle18),
                    ),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
