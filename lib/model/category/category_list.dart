import 'package:json_annotation/json_annotation.dart';
part 'category_list.g.dart';

@JsonSerializable()
class CategoryList {
  @JsonKey(name: "category_list")
  List<Category>? categoryList;

  CategoryList({this.categoryList});

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}

@JsonSerializable()
class Category {
  int? id;
  @JsonKey(name: "category_name")
  String? categoryName;
  String? description;
  @JsonKey(name: "category_logo")
  String? categoryLogo;
  List? company;

  Category({
    this.id,
    this.categoryName,
    this.description,
    this.categoryLogo,
    this.company,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
