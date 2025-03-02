// To parse this JSON data, do
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? userId;
  String? userName;
  String? loginStatus;
  String? profilePicture;

  UserModel({
    this.userId,
    this.userName,
    this.loginStatus,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        userName: json["userName"],
        loginStatus: json["loginStatus"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "loginStatus": loginStatus,
        "profilePicture": profilePicture,
      };
}
