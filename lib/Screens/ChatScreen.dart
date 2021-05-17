import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/MessageModel.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Model/UsersModel.dart';
import 'package:simplechat/Screens/Widget/MessageList.dart';

class ChatScreen extends StatefulWidget {
  UsersModel friend;
  UserModel currentusermodel;

  ChatScreen({this.friend,this.currentusermodel});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  String _message;
  final TextEditingController controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            CircleAvatar(
              child: Image(
                image: AssetImage("asset/avatar.png"),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              widget.friend.username,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.green,
              ),
              onPressed: (){

              }
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height*0.85,
        child: Stack(
          children: [
            MessageList(friend:widget.friend,currentuser: widget.currentusermodel),
            messageBox()
          ],
        ),
      ),
    );
  }
  Widget messageBox(){
    return Positioned(
        right: 0,
        bottom: 0,
        child: Container(

          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.green
                          )
                      )
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 25,
                  ),
                  onPressed: (){
                    print(controller.value.toString());
                    _message=controller.text;
                    Database(widget.currentusermodel.id,widget.friend.uid).sendMessage(_message);
                    controller.clear();
                  }
              )
            ],
          ) ,
        )
    );
  }
}
