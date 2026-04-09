import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class TextImageShader extends StatelessWidget {
  const TextImageShader({
    super.key,
    required this.width,
    required this.name,
    required this.textStyle,
  });
  final double width;
  final String name;
  final TextStyle textStyle;

  Future<ui.Image> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: loadImage(AppImage.kImageTalaOnboarding4),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final image = snapshot.data!;

        final shader = ImageShader(
          image,
          TileMode.repeated,
          TileMode.repeated,
          Matrix4.identity().scaled(0.2.w, 0.18.h).storage,
        );

        return SizedBox(
          width: width,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: textStyle.copyWith(foreground: Paint()..shader = shader),
            ),
          ),
        );
      },
    );
  }
}
