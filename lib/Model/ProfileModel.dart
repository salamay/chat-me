import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel{
  static const USERNAME = "username";
  String username;
  String email;
  String age;
  ProfileModel({this.username,this.email,this.age});
}