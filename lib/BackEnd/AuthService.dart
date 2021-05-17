

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplechat/Model/User.dart';

class AuthService{

final FirebaseAuth _auth=FirebaseAuth.instance;

UserModel _modelUserFromFirebase(User user){
   return user!=null?UserModel(id: user.uid):null;
}



   Future <UserModel>signUpWithEmailAndPassword(String email,String password) async{
      try{
         UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
         User firebaseUser=result.user;
         return _modelUserFromFirebase(firebaseUser);
      }catch(e){
         print(e);
         return null;
      }
   }
   Future<UserModel> signInWithEmailAndPassword(String email,String password)async{
      try{
         UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
         User firebaseUser=result.user;
         return _modelUserFromFirebase(firebaseUser);
      }catch(e){
         print(e);
         return null;
      }
   }

   Stream <UserModel> get isAuthenticated{
    // _auth.onAuthStateChanged.map((event) => _modelUserFromFirebase(event));
   return _auth.userChanges().map((event) => _modelUserFromFirebase(event));
   }
}