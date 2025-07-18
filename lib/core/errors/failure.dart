import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class Failure {
  const Failure(this.errMessage);

  final String errMessage;
}

class AppFailure extends Failure {
  const AppFailure(super.errMessage);

  factory AppFailure.fromException(dynamic error) {
    debugPrint('AppFailure.fromException: \$error');

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return AppFailure(LocaleKeys.connectionTimeout.tr());
        case DioExceptionType.sendTimeout:
          return AppFailure(LocaleKeys.sendTimeout.tr());
        case DioExceptionType.receiveTimeout:
          return AppFailure(LocaleKeys.receiveTimeout.tr());
        case DioExceptionType.cancel:
          return AppFailure(LocaleKeys.cancel.tr());
        case DioExceptionType.connectionError:
          return AppFailure(LocaleKeys.connectionError.tr());
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final serverMessage = error.response?.data['message'] ?? 'Something went wrong.';
          return AppFailure(LocaleKeys.badResponse.tr(namedArgs: {
            'statusCode': statusCode.toString(),
            'message': serverMessage,
          }));
        default:
          return AppFailure(LocaleKeys.unexpected.tr());
      }
    }

    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return AppFailure(LocaleKeys.invalidEmail.tr());
        case 'user-disabled':
          return AppFailure(LocaleKeys.userDisabled.tr());
        case 'user-not-found':
          return AppFailure(LocaleKeys.userNotFound.tr());
        case 'wrong-password':
          return AppFailure(LocaleKeys.wrongPassword.tr());
        case 'email-already-in-use':
          return AppFailure(LocaleKeys.emailInUse.tr());
        case 'weak-password':
          return AppFailure(LocaleKeys.weakPassword.tr());
        case 'too-many-requests':
          return AppFailure(LocaleKeys.tooManyRequests.tr());
        case 'invalid-verification-code':
          return AppFailure(LocaleKeys.invalidOtp.tr());
        case 'invalid-phone-number':
          return AppFailure(LocaleKeys.invalidPhone.tr());
        case 'session-expired':
          return AppFailure(LocaleKeys.sessionExpired.tr());
        case 'missing-verification-code':
          return AppFailure(LocaleKeys.missingOtp.tr());
        case 'invalid-credential':
          return AppFailure(LocaleKeys.invalidCredential.tr());
        case 'unknown':
          final errorMsg = error.message?.toLowerCase() ?? '';
          if (errorMsg.contains('password must contain')) {
            return AppFailure(LocaleKeys.passwordRule.tr());
          }
          return AppFailure(error.message ?? LocaleKeys.authFailed.tr());
        case 'internal-error':
          final errorMsg = error.message?.toLowerCase() ?? '';
          if (errorMsg.contains('print and inspect the error details')) {
            return AppFailure(LocaleKeys.passwordRule.tr());
          }
          return AppFailure(error.message ?? LocaleKeys.authFailed.tr());
        default:
          return AppFailure(error.message ?? LocaleKeys.authFailed.tr());
      }
    }

    if (error is FirebaseException) {
      return AppFailure(error.message ?? LocaleKeys.firebaseError.tr());
    }

    if (error is PlatformException) {
      if (error.message?.contains('Recaptcha') == true) {
        return AppFailure(LocaleKeys.recaptchaError.tr());
      }
      return AppFailure(error.message ?? LocaleKeys.platformError.tr());
    }

    if (error.toString().contains('RecaptchaAction')) {
      return AppFailure(LocaleKeys.fallbackRecaptcha.tr());
    }
    if (error.toString().contains('invalid-phone-number')) {
      return AppFailure(LocaleKeys.invalidPhone.tr());
    }

    if (error is SocketException) {
      return AppFailure(LocaleKeys.socketError.tr());
    }

    if (error is TimeoutException) {
      return AppFailure(LocaleKeys.timeout.tr());
    }

    return AppFailure(LocaleKeys.unexpected.tr());
  }
}
