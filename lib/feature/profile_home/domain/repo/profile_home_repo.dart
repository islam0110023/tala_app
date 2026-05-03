import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart'
    show PrivacyPolicyModel;

abstract class ProfileHomeRepo {
  Future<Either<Failure, PrivacyPolicyModel>> getPrivacyPolicy();
  Future<Either<Failure, PrivacyPolicyModel>> getTermsConditions();
  Future<Either<Failure, Unit>> updateProfile(Map<String, dynamic> data);
}
