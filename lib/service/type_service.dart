import 'package:cardoc/model/type/type_list.dart';
import 'package:dio/dio.dart';
import 'package:cardoc/main.dart';

class TypeService {
  Future<TypeList> getAllTypes() async {
    try {
      Response response = await getIt<Dio>().post(
        '/api/v1/type/get-all',
        data: {"all": 1},
      );
      return TypeList.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
      return TypeList.fromJson({"any_type_list": []});
    }
  }
}
