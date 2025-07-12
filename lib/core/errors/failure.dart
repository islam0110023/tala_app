import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Failure {
  const Failure(this.errMessage);

  final String errMessage;
}

class AppFailure extends Failure {
  const AppFailure(super.errMessage);

  factory AppFailure.fromException(dynamic error) {
    // Dio errors
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const AppFailure('Connection timed out. Please try again.');
        case DioExceptionType.sendTimeout:
          return const AppFailure('Send request timed out. Please check your internet connection.');
        case DioExceptionType.receiveTimeout:
          return const AppFailure('Server took too long to respond.');
        case DioExceptionType.cancel:
          return const AppFailure('Request was cancelled.');
        case DioExceptionType.connectionError:
          return const AppFailure('No internet connection.');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final serverMessage = error.response?.data['message'] ?? 'Something went wrong.';
          return AppFailure('Server error ($statusCode): $serverMessage');
        default:
          return const AppFailure('Unexpected error occurred. Please try again.');
      }
    }

    // Firebase Auth errors
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return const AppFailure('The email address is invalid.');
        case 'user-disabled':
          return const AppFailure('This account has been disabled.');
        case 'user-not-found':
          return const AppFailure('No user found with this email.');
        case 'wrong-password':
          return const AppFailure('Incorrect password.');
        case 'email-already-in-use':
          return const AppFailure('This email is already registered.');
        case 'weak-password':
          return const AppFailure('Password is too weak.');
        case 'too-many-requests':
          return const AppFailure('Too many requests. Try again later.');
        case 'invalid-verification-code':
          return const AppFailure('Invalid OTP code.');
        case 'invalid-phone-number':
          return const AppFailure('Invalid phone number format.');
        case 'session-expired':
          return const AppFailure('Verification session expired. Please try again.');
        case 'missing-verification-code':
          return const AppFailure('Verification code is missing.');
        default:
          return AppFailure(error.message ?? 'Authentication failed.');
      }
    }

    // Firebase generic errors
    if (error is FirebaseException) {
      return AppFailure(error.message ?? 'Firebase error occurred.');
    }

    // Platform errors (e.g., reCAPTCHA failures)
    if (error is PlatformException) {
      if (error.message?.contains('Recaptcha') == true) {
        return const AppFailure('reCAPTCHA verification failed. Try again.');
      }
      return AppFailure(error.message ?? 'Platform error occurred.');
    }

    // Fallback reCAPTCHA or OTP errors from logs
    if (error.toString().contains('RecaptchaAction')) {
      return const AppFailure('reCAPTCHA verification failed. Make sure your Firebase settings are correct.');
    }
    if (error.toString().contains('invalid-phone-number')) {
      return const AppFailure('Invalid or unsupported phone number.');
    }

    // Socket / Network
    if (error is SocketException) {
      return const AppFailure('No internet connection.');
    }

    // Timeout
    if (error is TimeoutException) {
      return const AppFailure('Request timed out. Please try again.');
    }

    return const AppFailure('An unexpected error occurred. Please try again.');
  }
}
