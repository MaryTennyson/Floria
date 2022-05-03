import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floria/service/data/snackbarcustom.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class FirebaseApi {
  Future<int> register(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'email-already-in-use') {
        print(e);
        showSnackBar(context, 'Email adresiniz kulanımdadır.', '');
        return 0;
      } else if (e.code == 'invalid-email') {
        showSnackBar(context, 'Email adresiniz mail formatına uymamaktadır', '');
        return 0;
      } else if (e.code == 'weak-password') {
        showSnackBar(context, 'Şifreniz zayıftır.', '');
        return 0;
      }
     
    }
    return 1;
  }

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        // HiveManager.instance.addDataToBox(HiveBoxes.USER, userCredential.user);
        // HiveManager.instance.addDataToBox(HiveBoxes.USER, item);
        //TODO:User bilgilerini lokale kaydedecek fonksiyon yazılabilir (hive)
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      //TODO: Snackbar gösterilecek kod
      print(e);
      return false;
    }
  }

  Future orderCreator(String name, String surname, String email, String address, String product) async {
    final docUser = FirebaseFirestore.instance.collection('orders').doc();

    final user = User(
      name: name,
      address: address,
      product: product,
      id: docUser.id,
      surname: surname,
      email: email,
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String surname;
  final String email;
  final String address;

  final String product;

  User({required this.id, required this.name, required this.surname, required this.email, required this.address, required this.product});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'email': email,
        'address': address,
        'product': product,
      };
}
