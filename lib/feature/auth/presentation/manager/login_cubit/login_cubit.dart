import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:tala_app/feature/auth/domain/usecases/login_with_google_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase, this.loginWithGoogleUseCase)
    : super(LoginInitial());
  final LoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  LoginEntity? loginEntity;

  Future<void> login(LoginParam param) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(param);
    result.fold(
      (l) {
        emit(LoginFailure(l.errMessage));
      },
      (r) async {
        loginEntity = r;
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(r.credential.user!.uid)
            .get();
        if (!userDoc.exists) {
          await FirebaseAuth.instance.signOut();
          emit(LoginFailure('user not found'));
        } else if (!loginEntity!.credential.user!.emailVerified) {
          emit(LoginEmailVerified());
        } else {
          emit(LoginSuccess());
        }
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoading());
    final result = await loginWithGoogleUseCase.call();
    result.fold(
      (l) {
        emit(LoginWithGoogleFailure(l.errMessage));
      },
      (r) async {
        loginEntity = r;

        emit(LoginWithGoogleSuccess());
      },
    );
  }
}
