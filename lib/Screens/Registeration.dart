import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:simplechat/BackEnd/AuthService.dart';
import 'package:simplechat/Screens/RegisteringUserScreen.dart';


class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  AuthService _authService=AuthService();
  final _key=GlobalKey<FormState>();
  String _email=null;
  String _username=null;
  String _age=null;
  String _password=null;
  String _password2=null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ListTile(
                    leading: Icon(
                      Icons.info_outline_rounded,size: 18,color:Colors.red,
                    ),
                    title: Text(
                      "Please provide the below information",
                      style: TextStyle(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Form(
                  key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey,
                              size: 18,
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.red
                              )
                            )
                          ),
                          validator: (val)=>val.isNotEmpty&&val.contains("@")?null:"invalid email",
                          onChanged: (val){
                            setState(() {
                              _email=val;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.people_alt_outlined,
                                color: Colors.grey,
                                size: 18,
                              ),
                              hintText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.red
                                  )
                              )
                          ),
                          validator: (val)=>val.isNotEmpty?null:"invalid username",
                          onChanged: (val){
                            setState(() {
                              _username=val;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.people_alt_outlined,
                                color: Colors.grey,
                                size: 18,
                              ),
                              hintText: "age",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.red
                                  )
                              )
                          ),

                          validator: (val)=>val.isNotEmpty?null:"invalid email",
                          onChanged: (val){
                            setState(() {
                              _age=val;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                                size: 18,
                              ),
                              hintText: "password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.red
                                  )
                              )
                          ),
                          obscureText: true,
                          onChanged: (val){
                            setState(() {
                              _password=val;
                            });
                          },
                          validator: (val)=>val.isNotEmpty&&val.length>5?null:"password length must not be less than 6",
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                                size: 18,
                              ),
                              hintText: "confirm password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.red
                                  )
                              )
                          ),
                          obscureText: true,
                          onChanged: (val){
                            setState(() {
                              _password2=val;
                            });
                          },
                          validator: (val)=>val.isNotEmpty&&val.length>5&&val==_password?null:"password do not match",
                        ),
                        SizedBox(height: 15,),
                        FlatButton(
                          hoverColor: Colors.white12,
                          color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                color: Colors.red
                              )
                            ),
                            onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisteringUserScreen(username:_username,email: _email,password: _password2,age: _age )
                            ));

                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.red
                              ),
                            )
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
