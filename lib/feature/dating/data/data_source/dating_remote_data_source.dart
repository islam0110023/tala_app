import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';

abstract class DatingRemoteDataSource {
  Future<UserDataEntity> getUserVector(String uid);
}

class DatingRemoteDataSourceImpl extends DatingRemoteDataSource {
  @override
  Future<UserDataEntity> getUserVector(String uid) async {
    final vector = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then(
          (value) => UserDataEntity(
            vector: List<num>.from(value.data()!['vector']),
            gender: value.data()!['profile']['gender'],
          ),
        );
    return vector;
  }
}
