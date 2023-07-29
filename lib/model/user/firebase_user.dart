import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
part 'firebase_user.g.dart';

@JsonSerializable()
class FirebaseUser {
  String? uid;
  List<FirebaseUserInfo>? providerData;

  FirebaseUser({this.uid, this.providerData});

  factory FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserFromJson(json);
  Map<String, dynamic> toJson() => _$FirebaseUserToJson(this);

  factory FirebaseUser.fromUser(User user) {
    return FirebaseUser(
        uid: user.uid,
        providerData: user.providerData
            .map((userInfo) => FirebaseUserInfo(
                displayName: userInfo.displayName,
                email: userInfo.email,
                phoneNumber: userInfo.phoneNumber,
                photoURL: userInfo.photoURL,
                providerId: userInfo.providerId))
            .toList());
  }
}

@JsonSerializable()
class FirebaseUserInfo {
  String? displayName;
  String? email;
  String? phoneNumber;
  String? photoURL;
  String? providerId;

  FirebaseUserInfo(
      {this.displayName,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.providerId});

  factory FirebaseUserInfo.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FirebaseUserInfoToJson(this);
}
