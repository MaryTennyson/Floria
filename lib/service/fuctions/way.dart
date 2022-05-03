import 'package:floria/ui/home.dart';
import 'package:floria/ui/login.dart';
import 'package:flutter/material.dart';

class Way{

   checkPage(context,dynamic timed) {
    if (timed == null || timed == 0) {
      print('bir');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
    } else if (timed == 1) {
      print('iki');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}