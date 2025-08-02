import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatingRemoteDataSource {
  Future<List<num>> getUserVector(String uid);
}

class DatingRemoteDataSourceImpl extends DatingRemoteDataSource {
  @override
  Future<List<num>> getUserVector(String uid) async {
    final vector = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => List<num>.from(value.data()!['vector']));
    return vector;
  }
}
