import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';
import 'package:tala_app/feature/dating/presentation/manager/request_connection/request_connection_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final MatchUserEntity? matchUser = MatchUserProvider.of(context);
    return GestureDetector(
      onDoubleTapDown: (details) {
        onDoubleTabPosition(details, context, matchUser);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImageDatingScreen(image: matchUser?.image ?? ''),

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

  void onDoubleTabPosition(
    TapDownDetails details,
    BuildContext context,
    MatchUserEntity? matchUser,
  ) {
    setState(() {
      tapPosition = details.localPosition;
      showHeart = true;
    });
    BlocProvider.of<RequestConnectionCubit>(
      context,
    ).requestConnection(matchUser!.uid);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showHeart = false;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
