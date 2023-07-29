import 'package:json_annotation/json_annotation.dart';
part 'type_list.g.dart';

@JsonSerializable()
class TypeList {
  @JsonKey(name: "any_type_list")
  List<Type>? anyTypeList;

  TypeList({this.anyTypeList});

  factory TypeList.fromJson(Map<String, dynamic> json) =>
      _$TypeListFromJson(json);
  Map<String, dynamic> toJson() => _$TypeListToJson(this);
}

@JsonSerializable()
class Type {
  int? id;
  String? name;

  Type({
    this.id,
    this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) =>
      _$TypeFromJson(json);
  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
