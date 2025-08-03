import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_image_dating_screen.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_switcher_card_dating.dart';

class CustomItemPageDating extends StatefulWidget {
  const CustomItemPageDating({super.key});

  @override
  State<CustomItemPageDating> createState() => _CustomItemPageDatingState();
}

class _CustomItemPageDatingState extends State<CustomItemPageDating>
    with AutomaticKeepAliveClientMixin {
  bool showHeart = false;
  Offset? tapPosition;

  void onDoubleTapDown(TapDownDetails details) {
    setState(() {
      tapPosition = details.localPosition;
      showHeart = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final matchUser = MatchUserProvider.of(context);
    return GestureDetector(
      onDoubleTapDown: onDoubleTapDown,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImageDatingScreen(
            image:
                matchUser?.image ??''
          ),

          const CustomSwitcherCardDating(),
          if (tapPosition != null)
            Positioned(
              left: tapPosition!.dx - 40,
              top: tapPosition!.dy - 40,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: showHeart ? 1 : 0,
                child: SvgPicture.asset(AppImage.kHeartIcon),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
