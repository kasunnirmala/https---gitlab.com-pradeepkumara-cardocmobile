// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      companyList: (json['company_list'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'company_list': instance.companyList,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int?,
      categoryName: json['category_name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      anyMakes: (json['any_makes'] as List<dynamic>?)
          ?.map((e) => Make.fromJson(e as Map<String, dynamic>))
          .toList(),
      anyTypes: (json['any_types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['category_id'] as String?,
      companyLogos: (json['company_logos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contactNumber: json['contact_number'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      publish: json['publish'] as int?,
      userId: json['user_id'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'user_id': instance.userId,
      'user': instance.user,
      'category_name': instance.categoryName,
      'company_logos': instance.companyLogos,
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
