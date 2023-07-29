import 'package:json_annotation/json_annotation.dart';
part 'make_list.g.dart';

@JsonSerializable()
class MakeList {
  @JsonKey(name: "any_make_list")
  List<Make>? anyMakeList;

  MakeList({this.anyMakeList});

  factory MakeList.fromJson(Map<String, dynamic> json) =>
      _$MakeListFromJson(json);
  Map<String, dynamic> toJson() => _$MakeListToJson(this);
}

@JsonSerializable()
class Make {
  int? id;
  String? name;

  Make({
    this.id,
    this.name,
  });

  factory Make.fromJson(Map<String, dynamic> json) =>
      _$MakeFromJson(json);
  Map<String, dynamic> toJson() => _$MakeToJson(this);
}
