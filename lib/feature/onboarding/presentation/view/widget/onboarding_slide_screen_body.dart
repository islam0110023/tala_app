import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/model/onboarding_model.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_down_onboarding.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class OnboardingSlideScreenBody extends StatefulWidget {
  const OnboardingSlideScreenBody({super.key});

  @override
  State<OnboardingSlideScreenBody> createState() =>
      _OnboardingSlideScreenBodyState();
}

class _OnboardingSlideScreenBodyState extends State<OnboardingSlideScreenBody> {
  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImage.kOnboarding1,
      text: LocaleKeys.redefiningSocial.tr(),
    ),
    OnboardingModel(
      image: AppImage.kOnboarding2,
      text: LocaleKeys.concertExperiences.tr(),
    ),
  ];
  PageController pageController = PageController();

  int index = 0;
  @override
  void initState() {
    super.initState();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),

          controller: pageController,
          itemCount: 2,
          itemBuilder: (context, i) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardingList[i].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
                child: Column(
                  children: [
                    SizedBox(height: AppDimensions.h47),
                    CustomArrowBack(
                      onTap: () {
                        if (index == 1) {
                          {
                            pageController
                                .previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                )
                                .then((value) {
                                  index--;
                                  setState(() {

                                  });
                                });
                          }
                        } else {
                          GoRouter.of(context).pop();
                        }
                      },
                      arrowColor: AppColor.kWhite,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: AppDimensions.w299,
                      height: AppDimensions.h86,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          onboardingList[i].text,
                          textAlign: TextAlign.center,
                          style: Styling.textStyle36,
                        ),
                      ),
                    ),
                    //SizedBox(height: AppDimensions.h28),
                    SizedBox(height: AppDimensions.h106),
                  ],
                ),
              ),
            );
          },
        ),
        CustomDownOnboarding(
          pageController: pageController,
          index: index,
          onTap: () {
            if (index < 1) {
              pageController
                  .nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  )
                  .then((value) {
                    setState(() {
                      index++;
                    });
                  });
            } else {
              GoRouter.of(context).go(AppRoutes.onBoardingTagsScreen);
            }
          },
        ),
      ],
    );
  }
}
