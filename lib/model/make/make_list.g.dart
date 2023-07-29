// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeList _$MakeListFromJson(Map<String, dynamic> json) => MakeList(
      anyMakeList: (json['any_make_list'] as List<dynamic>?)
          ?.map((e) => Make.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MakeListToJson(MakeList instance) => <String, dynamic>{
      'any_make_list': instance.anyMakeList,
    };

Make _$MakeFromJson(Map<String, dynamic> json) => Make(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MakeToJson(Make instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
