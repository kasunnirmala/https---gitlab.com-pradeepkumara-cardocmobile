// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCompany _$CreateCompanyFromJson(Map<String, dynamic> json) =>
    CreateCompany(
      description: json['description'] as String?,
      address: json['address'] as String?,
      anyMakes:
          (json['any_makes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      anyTypes:
          (json['any_types'] as List<dynamic>?)?.map((e) => e as int).toList(),
      categoryId: json['category_id'] as int?,
      contactNumber: json['contact_number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      publish: json['publish'] as bool?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$CreateCompanyToJson(CreateCompany instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'user_id': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'contact_number': instance.contactNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'publish': instance.publish,
      'any_types': instance.anyTypes,
      'any_makes': instance.anyMakes,
    };
