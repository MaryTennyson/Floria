import 'package:firebase_auth/firebase_auth.dart';
import 'package:floria/memory/hive_boxes.dart';
import 'package:floria/service/data/sharedpref.dart';
import 'package:floria/service/data/snackbarcustom.dart';

import 'package:floria/ui/login.dart';

import 'package:floria/ui/textformcustom.dart';
import 'package:floria/service/data/api.dart';
import 'package:floria/service/data/input.dart';
import 'package:flutter/material.dart';

import '../memory/hive_manager.dart';
import 'base_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late int giris;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:
              BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor])),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: dynamicHeight(50), bottom: dynamicHeight(45)),
                  width: 190,
                  height: 95,
                  child: Image.asset('assets/images/floria.png', fit: BoxFit.fill),
                ),
                Container(
                  width: dynamicWidth(335),
                  height: dynamicHeight(500),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white70),
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                            children: List.generate(inputs.length, (index) => TextFormCustom(inputs[index]['label'], inputs[index]['type'], inputs[index]['action'], inputs[index]['controllername']))),
                        Container(
                            margin: EdgeInsets.only(top: dynamicHeight(10), bottom: dynamicHeight(25)),
                            child: InkWell(
                              child: Text('Kaydol', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22)),
                              onTap: () async {
                                if (namecontroller.text == '' || surnamecontroller.text == '' || emailcontroller.text == '' || addresscontroller.text == '' || passwordcontroller.text == '') {
                                  showSnackBar(context, 'Boş alanları doldurmanız gerekmektedir.', '');
                                } else {
                                  var item = {
                                    "name": namecontroller.text,
                                    "surname": surnamecontroller.text,
                                    "email": emailcontroller.text,
                                    "address": addresscontroller.text,
                                  };

                                  HiveManager.instance.addDataToBox(HiveBoxes.USER, item);

                                  

                                  giris = await FirebaseApi().register(context, emailcontroller.text, passwordcontroller.text);
                                  if (giris == 1) showSnackBar(context, 'Kayıt Başarılı', '');
                                  await SharedPrefs().oneTimeEnterance();
                                  print(SharedPrefs().getIntFromSharedPref());
                                }
                              },
                            )),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Üye misiniz?  ', style: TextStyle(color: Theme.of(context).backgroundColor)),
                              InkWell(
                                //  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                },

                                child: Text('GİRİŞ YAPIN', style: TextStyle(color: Theme.of(context).bottomAppBarColor)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
