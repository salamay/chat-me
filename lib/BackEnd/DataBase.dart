import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simplechat/Model/MessageModel.dart';
import 'package:simplechat/Model/ProfileModel.dart';
import 'package:simplechat/Model/UsersModel.dart';

class Database{
  String uid;
  String friendId;

  Database(this.uid,this.friendId);





  Future createDocForNewUser(String username,String email,String age) async{
    CollectionReference userCollection=FirebaseFirestore.instance.collection("users");
    CollectionReference profileRefCollection=FirebaseFirestore.instance.collection("profile");
    await profileRefCollection.doc(uid).set({
      'username': username,
      'email': email,
      'age': age
    });
    await userCollection.add({
      "username":username,
      "uid":uid,
      "age":age,
      "photurl":"hgd"
    });
  }


  parseUserProfile(DocumentSnapshot documentSnapshot) {
    return ProfileModel(username:documentSnapshot.get("username"),
        email: documentSnapshot.get("email"),age: documentSnapshot.get("age"));
  }
  List<UsersModel> _parseUsers(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((element) {
      print(element);
      print(element["username"]);
      return UsersModel(username: element["username"],uid: element["uid"],age: element["age"],photourl: element["photurl"]);
    }).toList();
  }
  Future <ProfileModel> get retrieveUserInfo {
    CollectionReference profileRefCollection=FirebaseFirestore.instance.collection("profile");
    return profileRefCollection.doc(uid).get().then((DocumentSnapshot documentSnapshot) => parseUserProfile(documentSnapshot));
  }

  Future <List<UsersModel>> get getAllUsers{
    CollectionReference userCollection=FirebaseFirestore.instance.collection("users");
    return userCollection.get().then((event) => _parseUsers(event));
  }
  Future <bool> sendMessage(String message) async{
    CollectionReference messageCollection=FirebaseFirestore.instance.collection("messages");
    await messageCollection.doc(_compareString(uid, friendId)).collection("messages").add({
      "id":DateTime.now().microsecondsSinceEpoch,
      "message":message,
      "sender":uid,
      "to":friendId,
      "status":"unseen",
      "timestamp":DateTime.now()
    }).then((value) => true);
  }

  String _compareString(String currentuserid, String friendid){
    int result=currentuserid.compareTo(friendid);
    if(result==-1){
      //currentuserid is oredereb before friend id
      return currentuserid+":"+friendid;
    }else{
      return friendid+":"+currentuserid;
    }
  }

}