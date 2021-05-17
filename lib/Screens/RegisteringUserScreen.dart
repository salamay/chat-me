import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/BackEnd/AuthService.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Screens/Home.dart';
import 'package:simplechat/Screens/Registeration.dart';
class RegisteringUserScreen extends StatefulWidget {
  String username;
  String email;
  String password;
  String age;
  RegisteringUserScreen({this.username,this.email,this.password,this.age});

  @override
  _RegisteringUserScreenState createState() => _RegisteringUserScreenState();
}

class _RegisteringUserScreenState extends State<RegisteringUserScreen> {
  AuthService _authService=AuthService();

  @override
  void initState(){
    register();
    super.initState();
  }
  register()async{
    UserModel user=await _authService.signUpWithEmailAndPassword(widget.email, widget.password);
    print("Registering: $user");
    if(user!=null){
      await Database(user.id,"").createDocForNewUser(widget.username, widget.email, widget.age);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home(user: user,message: "You have signed in")), (route) => false);
    }else{
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    print(widget.username);
    print(widget.email);
    print(widget.password);
    print(widget.age);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SpinKitFoldingCube(
        color: Colors.red,
        size: 40,
      ),
    );
  }
}
