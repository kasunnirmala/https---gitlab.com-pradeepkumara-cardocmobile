import 'package:cardoc/model/make/make_list.dart';
import 'package:dio/dio.dart';
import 'package:cardoc/main.dart';

class MakeService {
  Future<MakeList> getAllMakes() async {
    try {
      Response response = await getIt<Dio>().post(
        '/api/v1/make/get-all',
        data: {"all": 1},
      );
      return MakeList.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
      return MakeList.fromJson({"any_make_list": []});
    }
  }
}
