
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{
  int id;
  String message;
  String sender;
  String to;
  String status;
  Timestamp timestamp;
  MessageModel({this.id,this.message,this.sender,this.to,this.status,this.timestamp});
}