import 'package:flutter/material.dart';

class loginDataModel {
  String? id;
  String? userLogin;
  String? userNicename;
  String? userEmail;
  String? userRegistered;
  String? userStatus;
  String? displayName;

  loginDataModel(
      {this.id,
      this.userLogin,
      this.userNicename,
      this.userEmail,
      this.userRegistered,
      this.userStatus,
      this.displayName});

  factory loginDataModel.fromJson(Map<String, dynamic> json) {
    return loginDataModel(
      id: json['ID'] ?? "NA",
      userLogin: json['user_login'] ?? "NA",
      userNicename: json['user_nicename'] ?? "NA",
      userEmail: json['user_email'] ?? "NA",
      userRegistered: json['user_registered'] ?? "NA",
      userStatus: json['user_status'] ?? "NA",
      displayName: json['display_name'] ?? "NA",
    );
  }

  // void setUserData(Map<String, dynamic> userData) {
  //   id = userData['data']['ID'].toString();
  //   userLogin = userData['data']['user_login'].toString();
  //   userNicename = userData['data']['user_nicename'].toString();
  //   userEmail = userData['data']['user_email'].toString();
  //   userRegistered = userData['data']['user_registered'].toString();
  //   userStatus = userData['data']['user_status'].toString();
  //   displayName = userData['data']['display_name'].toString();
  // }
}
