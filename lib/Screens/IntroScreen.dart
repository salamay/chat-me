import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:simplechat/Model/IntroModel.dart';
import 'package:simplechat/Screens/LogIn.dart';
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors=[
      Colors.white,
      Colors.blue,
      Colors.green
    ];
    List<IntroModel> introData=[
      IntroModel(text: "Meet new people all over the world",assetimagename: "asset/undraw_Messaging_app_re_aytg-removebg-preview.png",textcolor: Colors.red,backgroundcolor: Colors.white70,raisedButton: null),
      IntroModel(text: "Explore",assetimagename: "asset/undraw_Audio_conversation_re_ptsl-removebg-preview.png",textcolor: Colors.white,backgroundcolor: Colors.green,raisedButton: null),
      IntroModel(text: "Have fun",assetimagename: "asset/undraw_Posting_photo_re_plk8-removebg-preview.png",textcolor: Colors.white,backgroundcolor: Colors.blue,raisedButton: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: Colors.white
          )
        ),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){
            return Login();
          }));
        },
        
        child: Text(
          "Get started",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal
          ),
        ),
      )),
    ];
    return BuildWidget(pageData: introData,colors:colors);
  }
}
class BuildWidget extends StatefulWidget {
  List<IntroModel> pageData;
  List<Color> colors;
  BuildWidget({this.pageData,this.colors});

  @override
  _BuildWidgetState createState() => _BuildWidgetState();
}

class _BuildWidgetState extends State<BuildWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: widget.colors,
        radius: 20,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
        itemCount: widget.pageData.length,
        itemBuilder: (index,value){
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(widget.pageData[index].assetimagename),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                widget.pageData[index].text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  color: widget.pageData[index].textcolor
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              widget.pageData[index].raisedButton==null?Text("Swipe left",style: TextStyle(color: Colors.red),):widget.pageData[index].raisedButton
            ],
          );
        },
      ),
    );
  }
}


