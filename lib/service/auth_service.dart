import 'package:cardoc/model/user/firebase_user.dart';
import 'package:dio/dio.dart';
import 'package:cardoc/main.dart';

class AuthService {
  Future<bool> createUser(FirebaseUser user) async {
    try {
      await getIt<Dio>()
          .post('/api/v1/user/create', data: user.toJson(), options: Options(
        validateStatus: (statusCode) {
          if (statusCode == 422) {
            return true;
          }
          if (statusCode == 200) {
            return true;
          }
          return false;
        },
      ));
      return true;
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
  }
}
