import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/network/dio_end_piont.dart';
import 'package:tala_app/core/network/dio_helper.dart';
import 'package:tala_app/core/utils/constants.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> saveUserInFireStore(UserModel user);
  Future<List<double>> createVectorWithAI(String prompt);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  @override
  Future<Unit> saveUserInFireStore(UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(user.toMap(), SetOptions(merge: true));
    return unit;
  }

  @override
  Future<List<double>> createVectorWithAI(String prompt) async {
    final data = {'model': 'text-embedding-3-small', 'input': prompt};
    final response = await DioHelper.postData(
      url: Endpoints.openAiUrl,
      data: data,
      token: AppConstant.apiKeyOpenAi,
    );
    return List<double>.from(response.data['data'][0]['embedding']);
  }
}
