import 'package:tala_app/core/model/user_model.dart';

class PineconeParam {
  PineconeParam({required this.vector, required this.user});

  final List<double> vector;
  final UserModel user;
}
