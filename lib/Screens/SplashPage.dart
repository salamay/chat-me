import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:simplechat/Screens/IntroScreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    animation=Tween<double>(begin: 1.0,end: 0.5).animate(controller);
    controller.forward();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement( context, MaterialPageRoute(
          builder: (context)=>IntroScreen()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Text(
            "Vimo",
            style: TextStyle(
                color: Colors.red,
                fontSize: 70,
                fontWeight: FontWeight.normal,
                letterSpacing: 4
            ),
          ),
        ),
      ),
    );
  }
}
