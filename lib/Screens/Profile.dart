import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/ProfileModel.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Screens/Widget/SlimyCardBottomWidget.dart';
import 'package:simplechat/Screens/Widget/SlimyCardTopWidget.dart';
import 'package:slimy_card/slimy_card.dart';
class Profile extends StatefulWidget {
  UserModel user;
  Profile({this.user});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel>(
      future: Database(widget.user.id,"").retrieveUserInfo,
      builder: (context,snapshot){
        ProfileModel profileModel=snapshot.data;
        if(snapshot.connectionState==ConnectionState.done&&snapshot.hasData){
          return ListView(
            children: [
              Center(
                child: SlimyCard(
                  width: MediaQuery.of(context).size.width*0.9,
                  topCardHeight: 250,
                  bottomCardHeight: 150,
                   color: Colors.green,
                  borderRadius: 20,
                  slimeEnabled: true,
                  topCardWidget: SlimyCardTopWidget(),
                  bottomCardWidget: SlimyCardBottomWidget(email: profileModel.email,username: profileModel.username,age: profileModel.age,),

                ),
              ),
            ],
          );
        }else{
          return SpinKitFoldingCube(
            color: Colors.white,
            size: 60,
          );
        }
      },
    );
  }
}
