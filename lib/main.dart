import 'package:firebase_core/firebase_core.dart';
import 'package:floria/service/data/sharedpref.dart';
import 'package:floria/service/fuctions/starterpage.dart';

import 'package:floria/ui/home.dart';
import 'package:floria/ui/login.dart';

import 'package:floria/memory/hive_manager.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveManager.instance.hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xffE9B7CE),
            secondaryHeaderColor: Color(0xffD3F3F1),
            backgroundColor: Color(0xff9d9d9d),
            bottomAppBarColor: Color(0xffE998BD),
            colorScheme: ColorScheme.fromSwatch().copyWith()),
        home: StarterPage());
  }
}

