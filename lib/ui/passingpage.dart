import 'package:floria/ui/productmodel.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

class PassingPage extends StatefulWidget {
  const PassingPage({Key? key}) : super(key: key);

  @override
  State<PassingPage> createState() => _PassingPageState();
}

class _PassingPageState extends BaseState<PassingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor])),
        ),
        title: Container(
            width: dynamicWidth(90),
            height: dynamicHeight(45),
            child: Image.asset(
              "assets/images/floria.png",
              fit: BoxFit.fill,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ProductModelCustom('Gül'),
            ProductModelCustom('Papatya'),
            ProductModelCustom('Şakayık'),
            ProductModelCustom('Zambak'),
          
          ],
        ),
      ),
    );
  }
}


