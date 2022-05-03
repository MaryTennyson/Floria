import 'package:flutter/material.dart';

TextEditingController namecontroller = TextEditingController();
TextEditingController surnamecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();

List inputs = [
  {'label': 'Adınız', 'type': TextInputType.text, 'action': TextInputAction.next, 'controllername': namecontroller},
  {'label': 'Soyadınız', 'type': TextInputType.text, 'action': TextInputAction.next, 'controllername': surnamecontroller},
  {'label': 'Email Adresiniz', 'type': TextInputType.emailAddress, 'action': TextInputAction.next, 'controllername': emailcontroller},
  {'label': 'Şifreniz', 'type': TextInputType.number, 'action': TextInputAction.next, 'controllername': passwordcontroller},
  {'label': 'Adresiniz', 'type': TextInputType.multiline, 'action': TextInputAction.done, 'controllername': addresscontroller},
];
