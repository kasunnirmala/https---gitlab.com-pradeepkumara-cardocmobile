// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseUser _$FirebaseUserFromJson(Map<String, dynamic> json) => FirebaseUser(
      uid: json['uid'] as String?,
      providerData: (json['providerData'] as List<dynamic>?)
          ?.map((e) => FirebaseUserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirebaseUserToJson(FirebaseUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'providerData': instance.providerData,
    };

FirebaseUserInfo _$FirebaseUserInfoFromJson(Map<String, dynamic> json) =>
    FirebaseUserInfo(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoURL: json['photoURL'] as String?,
      providerId: json['providerId'] as String?,
    );

Map<String, dynamic> _$FirebaseUserInfoToJson(FirebaseUserInfo instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoURL,
      'providerId': instance.providerId,
    };
