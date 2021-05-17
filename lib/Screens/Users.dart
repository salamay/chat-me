import 'package:animations/animations.dart';
import 'package:flutter/material.dart'
;
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Model/UsersModel.dart';

import 'ChatScreen.dart';
class Users extends StatefulWidget {
  UserModel users;
  Users({this.users});
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Database(widget.users.id,null).getAllUsers,
      builder: (context,snapshot){
        List<UsersModel> users=snapshot.data;
        if(snapshot.connectionState==ConnectionState.done&&snapshot.hasData){
          return Container(
            color: Colors.white,
            child: ListView.separated(
              itemCount: users.length,
              itemBuilder: (context,index){
               return users[index].uid != widget.users.id ?
                 OpenContainer(
                  transitionDuration: Duration(seconds: 1),
                    closedBuilder:(context,openWidget){
                      return ListTile(
                        onTap: openWidget,
                        leading: CircleAvatar(
                          child: Image(
                            image: AssetImage("asset/avatar.png"),
                          ),
                        ),
                        title: Text(
                          users[index].username,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          users[index].age,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                    openBuilder: (context,closeWidget){
                      return ChatScreen(friend: users[index],currentusermodel: widget.users);
                    }
                ): SizedBox();
              },
              separatorBuilder: (context,index){
                return Divider(
                  height: 2,
                  color: Colors.grey,
                );
              },
            ),
          );
        }else{
          return SpinKitFoldingCube(
            color: Colors.red,
            size: 40,
          );
        }
      }
    );
  }
}
