import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tala_app/core/db/cache_helper/cache_helper.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';

class TutorialStepModel {
  TutorialStepModel({required this.text});
  final String text;
}

class TutorialOverlay extends StatefulWidget {
  const TutorialOverlay({super.key, required this.steps});
  final List<TutorialStepModel> steps;

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= widget.steps.length) {
      return const SizedBox();
    }

    final step = widget.steps[currentIndex];
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex++;
        });
        if (currentIndex >= widget.steps.length) {
          TutorialService.setSeen();
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 3),
              color: AppColor.kBlack.withAlpha(50),
            ),
          ),

          //
          // /// 🔥 Focus (Highlight)
          // Positioned(
          //   left: position.dx,
          //   top: position.dy,
          //   child: AnimatedContainer(
          //     duration: const Duration(milliseconds: 300),
          //     width: size.width,
          //     height: size.height,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16),
          //       border: Border.all(color: Colors.white, width: 3),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.max,

              children: [
                const SizedBox(height: 300),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.kBlack.withAlpha(120),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      step.text,
                      textAlign: TextAlign.center,
                      style: Styling.textStyleB20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _buildLottie(currentIndex),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLottie(int index) {
    switch (index) {
      case 0:
        return Lottie.asset(AppImage.kSwipeUpLottie, key: const ValueKey(0));
      case 1:
        return Lottie.asset(
          AppImage.kDoubleTapLottie,
          key: const ValueKey(1),
          height: 200,
          fit: BoxFit.cover,
        );
      case 2:
        return Lottie.asset(
          AppImage.kSwipeLeftLottie,
          key: const ValueKey(2),
          height: 200,
          fit: BoxFit.cover,
        );
      default:
        return const SizedBox();
    }
  }
}

class TutorialService {
  static const String key = 'tutorial_seen';

  static Future<bool> isSeen() async {
    final prefs = await CacheHelper.getData(key: key);
    return prefs ?? false;
  }

  static Future<void> setSeen() async {
    await CacheHelper.saveData(key: key, value: true);
  }
}
