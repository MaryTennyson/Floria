import 'package:floria/service/data/sharedpref.dart';
import 'package:floria/service/fuctions/loading.dart';
import 'package:floria/service/fuctions/way.dart';
import 'package:floria/ui/home.dart';
import 'package:floria/ui/login.dart';

import 'package:flutter/material.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  dynamic timed = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    SharedPrefs().getIntFromSharedPref().then((timed) {
      print('initstate içi');
      print(timed);
      Way().checkPage(context, timed);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 190,
              height: 95,
              child: Image.asset('assets/images/floria.png', fit: BoxFit.fill),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
