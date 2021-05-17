import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/ProfileModel.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Screens/Profile.dart';
import 'package:simplechat/Screens/RecentChat.dart';
import 'package:simplechat/Screens/Users.dart';
import 'package:simplechat/Screens/Wrapper.dart';

class Home extends StatefulWidget {
  UserModel user;
  String message;
  Home({this.user, this.message});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Wrapper wrapper=Wrapper();
  PageController pageController =
  PageController(initialPage: 0, keepPage: true);
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Database database=Database(widget.user.id,"");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Text(""),
        elevation: 0.0,
        backgroundColor: Colors.white70,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("asset/topItem.png"),
          ),
          title: Text(
              "Vim",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                setState(() {
                  wrapper.view;
                });
              },
              color: Colors.grey,
              child: Text(
                "Log out",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ))
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            _index=index;
          });
        },
        children: [
          Users(users: widget.user),
          RecentChat(),
          Profile(user: widget.user)
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        color: Colors.white,
        height: 60.0,
        backgroundColor: Colors.white54,
        buttonBackgroundColor: Colors.white12,
        animationCurve: Curves.bounceInOut,
        items: [
          Icon(Icons.people_alt_outlined,color: Colors.red,),
          Icon(Icons.recent_actors_outlined,color: Colors.red,),
          Icon(Icons.people,color: Colors.red,)
        ],
        onTap: (index){
          setState(() {
            _index=index;
            pageController.jumpToPage(_index);
          });
        },
      ),
    );
  }

  Widget buildDialog(String text) {
    Animation<double> primaryAnimation;
    Animation<double> secondaryAnimation;
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        text,
        style: TextStyle(
            color: text == "Registeration failed" ? Colors.red : Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.normal),
      ),
      actions: [
        FlatButton(
            hoverColor: Colors.white12,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.red)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
    return FadeThroughTransition(
      animation: primaryAnimation,
      secondaryAnimation: secondaryAnimation,
      child: alertDialog,
    );
  }
}
