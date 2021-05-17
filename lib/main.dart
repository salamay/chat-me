import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplechat/BackEnd/AuthService.dart';
import 'package:simplechat/BackEnd/DataBase.dart';
import 'package:simplechat/Model/ProfileModel.dart';
import 'package:simplechat/Screens/SplashPage.dart';

import 'Screens/IntroScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      StreamProvider.value(
        value: AuthService().isAuthenticated,
      ),
    ],
      child: SplashPage(),
    );
  }
}
