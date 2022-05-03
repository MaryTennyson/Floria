import 'package:floria/service/data/snackbarcustom.dart';
import 'package:floria/ui/home.dart';
import 'package:floria/ui/passingpage.dart';
import 'package:floria/ui/textformcustom.dart';
import 'package:floria/memory/hive_boxes.dart';
import 'package:floria/memory/hive_manager.dart';
import 'package:floria/service/data/api.dart';
import 'package:flutter/material.dart';

import '../service/data/input.dart';
import 'base_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
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
                SizedBox(
                  height: dynamicHeight(50),
                ),
                Container(
                  width: dynamicWidth(190),
                  height: dynamicHeight(95),
                  child: Image.asset(
                    'assets/images/floria.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(40),
                ),
                Container(
                  width: dynamicWidth(335),
                  height: dynamicHeight(500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: dynamicHeight(30),
                        ),
                        Text(
                          "Floria'ya HOŞGELDİNİZ!",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        TextFormCustom(inputs[2]['label'], inputs[2]['type'], inputs[2]['action'], inputs[2]['controllername']),
                        TextFormCustom(inputs[3]['label'], inputs[3]['type'], inputs[3]['action'], inputs[3]['controllername']),
                        SizedBox(
                          height: dynamicHeight(20),
                        ),
                        Container(
                          child: InkWell(
                            onTap: (() async {
                              bool res = await FirebaseApi().login(emailcontroller.text, passwordcontroller.text);
                              print(res);
                              if (res == true) {
                                showSnackBar(context, 'Başarılı giriş sağlandı', '');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PassingPage()));
                              } else {
                                showSnackBar(context, 'Email adresiniz ya da şifreniz hatalı', '');
                                //TODO: Error snack
                              }
                            }),
                            child: Text(
                              'Giriş Yap',
                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dynamicHeight (120),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Henüz üye değil misiniz?',
                                style: TextStyle(color: Theme.of(context).backgroundColor),
                              ),
                              InkWell(
                                // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                                child: Text(
                                  'HEMEN ÜYE OLUN',
                                  style: TextStyle(color: Theme.of(context).bottomAppBarColor),
                                ),
                                onTap: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
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
