import 'package:cardoc/model/company/company_list.dart';
import 'package:cardoc/model/company/create_company.dart';
import 'package:dio/dio.dart';
import 'package:cardoc/main.dart';

class CompanyService {
  Future<CompanyList> getAllCompanies() async {
    try {
      Response response = await getIt<Dio>().post(
        '/api/v1/company/get-all',
        data: {"all": 1},
      );
      return CompanyList.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
      return CompanyList.fromJson({"company_list": []});
    }
  }

  Future createCompany(CreateCompany createCompany) async {
    try {
       await getIt<Dio>().post(
        '/api/v1/company/create',
        data: createCompany.toJson(),
      );
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
