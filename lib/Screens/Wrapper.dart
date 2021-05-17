import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Screens/Home.dart';
import 'package:simplechat/Screens/LogIn.dart';
class Wrapper extends StatelessWidget {
  bool isLoggedIn=false;
  void toggleView(){
    isLoggedIn=false;
  }
  void get view => toggleView();
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserModel>(context);
    print("Wrapper checking user authentication");
    if(user!=null){
      isLoggedIn=true;
    }else{
      isLoggedIn=false;
    }
    return isLoggedIn?Home(user: user,message: "you are Logged in"):Login();
  }
}
