import 'package:flutter/material.dart';
import 'package:tala_app/feature/home/presentation/view/widget/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchScreenBody(),
    );
  }
}
