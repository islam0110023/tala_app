import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart';

abstract class ProfileHomeRemoteDataSource {
  Future<PrivacyPolicyModel> getPrivacyPolicy();
  Future<PrivacyPolicyModel> getTermsConditions();
  Future<Unit> updateProfile(Map<String, dynamic> data);
}

class ProfileHomeRemoteDataSourceImpl extends ProfileHomeRemoteDataSource {
  @override
  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    final doc = await FirebaseFirestore.instance
        .collection('app_content')
        .doc('privacy_policy')
        .get();
    final data = doc.data();
    return PrivacyPolicyModel.fromJson(data!);
  }

  @override
  Future<PrivacyPolicyModel> getTermsConditions() async {
    final doc = await FirebaseFirestore.instance
        .collection('app_content')
        .doc('terms_conditions')
        .get();
    final data = doc.data();
    return PrivacyPolicyModel.fromJson(data!);
  }

  @override
  Future<Unit> updateProfile(Map<String, dynamic> data) async {
    final user = FirebaseAuth.instance.currentUser;
    if (data['image'] != null && !data['image'].startsWith('http')) {
      final imageUrl = await ChatsRemoteDataSourceImpl().uploadImage(
        folder: 'profiles/images',
        file: File(data['image']),
      );
      data['image'] = imageUrl;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .update(data);
    return unit;
  }
}
