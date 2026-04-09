import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/services/notification_service/push_notification_service.dart';
import 'package:tala_app/core/services/presence_service.dart';
import 'package:tala_app/feature/auth/domain/usecases/get_user_complete_use_case.dart';

part 'get_user_complete_state.dart';

class GetUserCompleteCubit extends Cubit<GetUserCompleteState> {
  GetUserCompleteCubit(this.getUserCompleteUseCase)
    : super(GetUserCompleteInitial());
  final GetUserCompleteUseCase getUserCompleteUseCase;
  Future<void> getUserComplete(String uid) async {
    emit(GetUserCompleteLoading());
    final result = await getUserCompleteUseCase.call(uid);
    result.fold(
      (l) {
        emit(GetUserCompleteFailure(l.errMessage));
      },
      (r) async {
        if (r == false) {
          emit(GetUserCompleteNotComplete());
        } else {
          await PresenceService.instance.start();
          await saveFcmToken();

          emit(GetUserCompleteIsComplete());
        }
      },
    );
  }

  Future<void> saveFcmToken() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final token = await PushNotificationsServices.getToken();

    if (token == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'fcmTokens': FieldValue.arrayUnion([token]),
    });
  }
}
