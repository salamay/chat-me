import 'package:flutter/material.dart';

class SlimyCardBottomWidget extends StatefulWidget {
  String email;
  String username;
  String age;

  SlimyCardBottomWidget({this.email, this.username, this.age});

  @override
  _SlimyCardBottomWidgetState createState() => _SlimyCardBottomWidgetState();
}

class _SlimyCardBottomWidgetState extends State<SlimyCardBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Username: ${widget.email}",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(height: 10,),
          Text(
              "Email: ${widget.email}",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal
              )
          ),
          SizedBox(height: 10,),
          Text(
              "Age: ${widget.age}",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.normal
              )
          ),
        ],
      ),
    );
  }
}