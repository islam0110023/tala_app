import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/chat/presentation/manager/chats/chats_cubit.dart';
import 'package:tala_app/feature/chat/presentation/manager/chats_provider.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_person_chat_skeleton.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_upper_chat.dart';

class ChatsScreenBody extends StatefulWidget {
  const ChatsScreenBody({super.key});

  @override
  State<ChatsScreenBody> createState() => _ChatsScreenBodyState();
}

class _ChatsScreenBodyState extends State<ChatsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().loadChats(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomUpperChat()),
            BlocBuilder<ChatsCubit, ChatsState>(
              builder: (context, state) {
                if (state is ChatsLoading) {
                  return SliverList.separated(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const CustomPersonChatSkeleton();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: AppDimensions.h6,
                          thickness: AppDimensions.sp1,
                          indent: AppDimensions.w68,
                          color: AppColor.kDividerColor,
                        ),
                  );
                }
                if (state is ChatsSuccess) {
                  return SliverList.separated(
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      return ChatDataProvider(
                        chat: state.chats[index],
                        child: CustomPersonChat(
                          key: PageStorageKey(state.chats[index].chatId),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: AppDimensions.h6,
                          thickness: AppDimensions.sp1,
                          indent: AppDimensions.w68,
                          color: AppColor.kDividerColor,
                        ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Something went wrong,Try again later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColor.kPrimaryPink,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
