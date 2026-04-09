import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/core/network/dio_end_piont.dart';
import 'package:tala_app/core/network/dio_helper.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/dating/data/model/match_user_model.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/domain/params/request_params.dart';

abstract class DatingRemoteDataSource {
  Future<UserDataEntity> getUserVector(String uid);
  Future<List<MatchUserEntity>> getMatchesUser(MatchUserParams params);
  Future<Unit> requestConnection(RequestParams params);
  Future<void> checkAndConsumeScroll();
}

class DatingRemoteDataSourceImpl extends DatingRemoteDataSource {
  @override
  Future<UserDataEntity> getUserVector(String uid) async {
    final data = {
      'ids': [uid],
      'includeValues': true,
      'includeMetadata': true,
      'namespace': AppConstant.kPineconeNameSpaceMatchUser,
    };
    final response = await DioHelper.getData(
      url: Endpoints.pineconeFetchUrl,
      data: data,
      apiKey: AppConstant.pineconeApiKey,
    );
    final vector = UserDataEntity(
      vector: List<num>.from(response.data['vectors'][uid]['values']),
      gender: response.data['vectors'][uid]['metadata']['profile_gender'],
    );

    return vector;
  }

  @override
  Future<List<MatchUserEntity>> getMatchesUser(MatchUserParams params) async {
    final noisyVector = AppConstant.addNoise(params.vector, 0.001);
    final filter = <String, dynamic>{};
    if (params.interestFilter != null) {
      filter['passions'] = {'\$eq': params.interestFilter};
    }
    if (params.excludeIds != null && params.excludeIds!.isNotEmpty) {
      filter['uid'] = {'\$nin': params.excludeIds};
    }
    if (params.gender.isNotEmpty) {
      filter['profile_gender'] = {'\$ne': params.gender};
    }
    final data = {
      'vector': noisyVector,
      'topK': 15,
      'includeMetadata': true,
      'filter': filter,
      'namespace': AppConstant.kPineconeNameSpaceMatchUser,
    };
    final response = await DioHelper.postData(
      url: Endpoints.pineconeQueryUrl,
      data: data,
      apiKey: AppConstant.pineconeApiKey,
    );
    final matches = response.data['matches'] as List;
    matches.shuffle();
    final List<MatchUserModel> matchUsers = [];
    for (final match in matches) {
      final matchUser = MatchUserModel.fromJson(match['metadata']);
      matchUsers.add(matchUser);
    }
    return matchUsers.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Unit> requestConnection(RequestParams params) async {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    final String chatId = AppConstant.createMexIds(currentUid, params.uid);
    final currentUserDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUid)
        .get();
    final otherUserData = currentUserDoc.data() as Map<String, dynamic>;

    final chatRef = FirebaseFirestore.instance.collection('chats').doc(chatId);
    final docSnapshot = await chatRef.get();
    if (docSnapshot.exists) {
      return unit;
    }

    final data = {
      'fromUserId': currentUid,
      'toUserId': params.uid,
      'names': [otherUserData['profile']['name'], params.name],
      'photos': [otherUserData['profile']['photoUrl'] ?? '', params.photoUrl],
      'members': [currentUid, params.uid],
      'status': 'Pending',
      'lastMessage': 'Pending Connection',
      'updatedAt': FieldValue.serverTimestamp(),
      'isConnection': false,
      'createdAt': FieldValue.serverTimestamp(),
      'unreadCounts': {currentUid: 0, params.uid: 0},
    };
    await chatRef.set(data);
    return unit;
  }

  Future<void> checkAndConsumeScroll() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseFunctionsException(
        code: 'unauthenticated',
        message: 'Login required',
      );
    }

    await user.getIdToken(true);

    final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
    final callable = functions.httpsCallable('checkAndConsumeScroll');

    await callable.call();
  }
}
