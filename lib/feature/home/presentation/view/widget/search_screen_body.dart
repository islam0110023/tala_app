import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_search_tab_bar.dart';
import 'package:tala_app/feature/home/presentation/view/widget/event_card.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  late bool searched = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppDimensions.r16;
    final verticalPadding = AppDimensions.r8;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            elevation: 0,
            toolbarHeight: AppDimensions.h130,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomArrowBack(onTap: () => context.pop()),
                        SizedBox(width: AppDimensions.h12),
                        Expanded(
                          child: CustomHomeSearch(
                            focusNode: _focusNode,
                            controller: _controller,
                            onSubmitted: (value) {
                              setState(() {
                                searched = true;
                              });
                            }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.h12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        searched ? 'Search Results' : LocaleKeys.recent_view.tr(),
                        style: Styling.textStyle18800Purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => const EventCard(),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}



