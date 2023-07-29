import 'package:cardoc/model/make/make_list.dart';
import 'package:cardoc/model/type/type_list.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company_list.g.dart';

@JsonSerializable()
class CompanyList {
  @JsonKey(name: "company_list")
  List<Company>? companyList;

  CompanyList({this.companyList});

  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}

@JsonSerializable()
class Company {
  int? id;
  @JsonKey(name: "category_id")
  String? categoryId;
  @JsonKey(name: "user_id")
  String? userId;
  String? user;
  @JsonKey(name: "category_name")
  String? categoryName;
  @JsonKey(name: "company_logos")
  List<String>? companyLogos;
  String? name;
  String? description;
  @JsonKey(name: "contact_number")
  String? contactNumber;
  String? address;
  double? latitude;
  double? longitude;
  int? publish;
  @JsonKey(name: "any_types")
  List<Type>? anyTypes;
  @JsonKey(name: "any_makes")
  List<Make>? anyMakes;

  Company({
    this.id,
    this.categoryName,
    this.description,
    this.address,
    this.anyMakes,
    this.anyTypes,
    this.categoryId,
    this.companyLogos,
    this.contactNumber,
    this.latitude,
    this.longitude,
    this.name,
    this.publish,
    this.userId,
    this.user,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
