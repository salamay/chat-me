import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplechat/Model/MessageModel.dart';
import 'package:simplechat/Model/User.dart';
import 'package:simplechat/Model/UsersModel.dart';
class MessageList extends StatefulWidget {
  UserModel currentuser;
  UsersModel friend;
  MessageList({this.friend,this.currentuser});
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  String _compareString(String currentuserid, String friendid){
    int result=currentuserid.compareTo(friendid);
    if(result==-1){
      //currentuserid is ordered before friend id
      return currentuserid+":"+friendid;
    }else{
      return friendid+":"+currentuserid;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_compareString(widget.currentuser.id, widget.friend.uid));
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("messages")
        .doc(_compareString(widget.currentuser.id, widget.friend.uid)).collection("messages").orderBy("timestamp", descending: true).snapshots()
          .map((event) => event.docs.map((e) =>
          MessageModel(
              id: e["id"],
              message: e["message"],
              sender: e["sender"],
              to: e["to"],
              status: e["status"],
              timestamp: e["timestamp"]
          )
      ).toList()),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<MessageModel> messages=snapshot.data;
            print(messages.length);
            return messages.isEmpty?Center(
                child: Container(
                  child: Text(
                    "Say hello",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ):Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height*0.78,
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                  itemBuilder: (context,index){
                    return messages[index].sender==widget.currentuser.id?Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Text(
                                widget.friend.username.substring(0,1),
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow:
                                  [
                                    BoxShadow(
                                          color: Colors.grey[200],
                                      blurRadius: 2,
                                      offset: Offset(4,8),
                                    )

                                  ]



                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  messages[index].message
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                            child: Text(
                              widget.friend.username.substring(0,1),
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 20
                              ),
                            ),
                          ),
                          SizedBox(width: 6,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              borderRadius: 20,
                              curveType: CurveType.convex,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    messages[index].message,
                                  style: TextStyle(
                                    color: Colors.black87
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            );
          }else {
            return SpinKitFoldingCube(
              color: Colors.red,
              size: 25,
            );
          }
        }
    );
  }
}
