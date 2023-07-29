// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeList _$TypeListFromJson(Map<String, dynamic> json) => TypeList(
      anyTypeList: (json['any_type_list'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeListToJson(TypeList instance) => <String, dynamic>{
      'any_type_list': instance.anyTypeList,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
