import 'package:cardoc/model/category/category_list.dart';
import 'package:dio/dio.dart';
import 'package:cardoc/main.dart';

class CategoryService {
  Future<CategoryList> getAllCategories() async {
    try {
      Response response = await getIt<Dio>().post(
        '/api/v1/category/get-all',
        data: {"all": 1},
      );
      return CategoryList.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
      return CategoryList.fromJson({"category_list": []});
    }
  }
}
