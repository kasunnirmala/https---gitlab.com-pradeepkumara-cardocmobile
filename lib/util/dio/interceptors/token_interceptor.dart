import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String token = await user?.getIdToken() ?? "";
    options.headers["Authorization"] = 'Bearer $token';
    options.headers[Headers.contentTypeHeader] = Headers.jsonContentType;
    options.headers[Headers.acceptHeader] = Headers.jsonContentType;

    super.onRequest(options, handler);
  }
}
