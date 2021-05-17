import 'package:flutter/material.dart';
import 'package:simplechat/Screens/LogingIn.dart';
import 'package:simplechat/Screens/Registeration.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  Text(
                      "Please sign in",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      letterSpacing: 3
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.attach_email_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                          ),
                          onChanged: (val){
                            setState(() {
                              _email=val;
                            });
                          },
                          validator: (val)=> val.isEmpty && val.contains("@")?"please provide a valid email":null,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              size: 18,
                              color: Colors.grey,
                            ),
                            hintText: "password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.red
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          ),
                          obscureText: true,
                          onChanged: (val){
                            setState(() {
                              _password=val;
                            });
                          },
                          validator: (val)=> val.length<6?"please provide a valid passwoed":null,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.09,),
                        FlatButton(
                          hoverColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                  color: Colors.red
                              )
                          ),
                            color: Colors.white,
                            onPressed: (){
                              if(_key.currentState.validate()){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return LoginIn(email: _email,password: _password);
                                }));
                              }
                            },

                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Not a member "),
                            SizedBox(width: 3,),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(
                                  color: Colors.red
                                )
                              ),
                                color: Colors.white,
                                onPressed:(){
                                 Navigator.push(context, MaterialPageRoute(builder: (context){
                                   return Registeration();
                                 }));
                                },
                              child: Text(
                                  "Register",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      );
  }
}
