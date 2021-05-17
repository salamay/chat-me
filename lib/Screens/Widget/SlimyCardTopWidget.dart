import 'package:flutter/material.dart';
class SlimyCardTopWidget extends StatefulWidget {
  @override
  _SlimyCardTopWidgetState createState() => _SlimyCardTopWidgetState();
}

class _SlimyCardTopWidgetState extends State<SlimyCardTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50,
        child: CircleAvatar(
          backgroundImage:AssetImage(
            "asset/topItem.png"
          ),
          radius: 48,
        )
      ),
    );
  }
}
