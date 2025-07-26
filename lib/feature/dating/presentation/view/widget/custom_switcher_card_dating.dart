import 'package:flutter/material.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_first_card_dating.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_second_card_dating.dart';

class CustomSwitcherCardDating extends StatefulWidget {
  const CustomSwitcherCardDating({super.key});

  @override
  State<CustomSwitcherCardDating> createState() =>
      _CustomSwitcherCardDatingState();
}

class _CustomSwitcherCardDatingState extends State<CustomSwitcherCardDating> {
  int currentIndex = 0;
  final List<Widget> userCards = const [
    CustomFirstCardDating(),
    CustomSecondCardDating(),
  ];

  void handleSwipe(bool isRightSwipe) {
    setState(() {
      if (isRightSwipe && currentIndex < 1) {
        currentIndex++;
      } else if (!isRightSwipe && currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < -50) {
          handleSwipe(true);
        } else if (details.primaryVelocity! > 50) {
          handleSwipe(false);
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          final offsetTransition = Tween<Offset>(
            begin: const Offset(0, .2),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: offsetTransition,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: userCards[currentIndex],
      ),
    );
  }
}
