import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/BackEnd/AuthService.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Screens/LogIn.dart';

import 'Home.dart';
import 'Registeration.dart';

class LoginIn extends StatefulWidget{
  String email;
  String password;
  LoginIn({this.email,this.password});

  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  AuthService _authService=AuthService();
  @override
  void initState() {
    setup();
    super.initState();
  }
  setup()async{
  UserModel user = await _authService.signInWithEmailAndPassword(widget.email, widget.password);
  print("Signing in: ${user.id}");
  if(user!=null ){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home(user: user,message: "You have signed in",)), (route) => false);
  }else{
    Navigator.pop(context);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
              body: SpinKitFoldingCube(
                color: Colors.red,
                size: 30,
              ),
            );
          }

}
