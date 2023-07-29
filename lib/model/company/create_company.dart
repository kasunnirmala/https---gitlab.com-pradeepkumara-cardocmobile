import 'package:json_annotation/json_annotation.dart';
part 'create_company.g.dart';

@JsonSerializable()
class CreateCompany {
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "user_id")
  String? userId;
  String? name;
  String? description;
  @JsonKey(name: "contact_number")
  String? contactNumber;
  String? address;
  double? latitude;
  double? longitude;
  bool? publish;
  @JsonKey(name: "any_types")
  List<int>? anyTypes;
  @JsonKey(name: "any_makes")
  List<int>? anyMakes;

  CreateCompany({
    this.description,
    this.address,
    this.anyMakes,
    this.anyTypes,
    this.categoryId,
    this.contactNumber,
    this.latitude,
    this.longitude,
    this.name,
    this.publish,
    this.userId,
  });

  factory CreateCompany.fromJson(Map<String, dynamic> json) =>
      _$CreateCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCompanyToJson(this);
}
