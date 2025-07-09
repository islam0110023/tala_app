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

  /// Factory constructor to handle all known errors
  factory AppFailure.fromException(dynamic error) {
    // Dio Errors
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const AppFailure('Connection timeout. Try again.');
        case DioExceptionType.sendTimeout:
          return const AppFailure('Send timeout. Check your network.');
        case DioExceptionType.receiveTimeout:
          return const AppFailure('Receive timeout. Try again later.');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final serverMessage = error.response?.data['message'];
          return AppFailure(
            "Server Error $statusCode: ${serverMessage ?? 'Something went wrong'}",
          );
        case DioExceptionType.cancel:
          return const AppFailure('Request was cancelled.');
        case DioExceptionType.connectionError:
          return const AppFailure('No internet connection.');
        case DioExceptionType.unknown:
        default:
          return const AppFailure('Unexpected error occurred. Try again.');
      }
    }

    // Firebase Auth Errors
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return const AppFailure('Invalid email address.');
        case 'user-disabled':
          return const AppFailure('This account is disabled.');
        case 'user-not-found':
          return const AppFailure('No user found for that email.');
        case 'wrong-password':
          return const AppFailure('Incorrect password.');
        case 'email-already-in-use':
          return const AppFailure('Email already in use.');
        case 'weak-password':
          return const AppFailure('Password is too weak.');
        case 'too-many-requests':
          return const AppFailure('Too many requests. Try again later.');
        default:
          return AppFailure(error.message ?? 'Auth error occurred.');
      }
    }

    // Firebase generic (e.g. Firestore)
    if (error is FirebaseException) {
      return AppFailure(error.message ?? 'Firebase error occurred.');
    }

    // SocketException
    if (error is SocketException) {
      return const AppFailure('No internet connection.');
    }

    // TimeoutException
    if (error is TimeoutException) {
      return const AppFailure('The request timed out.');
    }

    // PlatformException (plugins)
    if (error is PlatformException) {
      return AppFailure(error.message ?? 'Platform error occurred.');
    }

    // Unknown
    return const AppFailure('An unexpected error occurred.');
  }
}
