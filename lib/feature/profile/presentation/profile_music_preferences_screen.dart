import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_music_preferences_body.dart';

class ProfileMusicPreferencesScreen extends StatelessWidget {
  const ProfileMusicPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileMusicPreferencesBody(),
    );
  }
}
