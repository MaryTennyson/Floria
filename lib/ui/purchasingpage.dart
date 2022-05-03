import 'package:floria/memory/hive_manager.dart';
import 'package:floria/scripts/gridviewcustom.dart';
import 'package:floria/scripts/productlist.dart';
import 'package:floria/service/data/api.dart';
import 'package:floria/service/fuctions/purchase.dart';
import 'package:floria/ui/base_state.dart';
import 'package:flutter/material.dart';

import '../memory/hive_boxes.dart';
import '../service/data/snackbarcustom.dart';

class PurchasingPage extends StatefulWidget {
  final String lastproduct;
  const PurchasingPage(this.lastproduct, {Key? key}) : super(key: key);

  @override
  State<PurchasingPage> createState() => _PurchasingPageState();
}

class _PurchasingPageState extends BaseState<PurchasingPage> {
  int optionSelected = 0;
  List lastname = [];
  String selectedproduct = '';
  String name = '';
  String surname = '';
  String address = '';
  String email = '';

  setList(String lastproduct) {
    List temp = PurchaseFunctions().setList(lastproduct);
    setState(() => lastname = temp);
  }

  @override
  void initState() {
    super.initState();
    setList(widget.lastproduct);
  }

  @override
  String selected = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor]),
          ),
        ),
        title: Image.asset("assets/images/floria.png", fit: BoxFit.fill, width:dynamicWidth( 90), height: dynamicHeight(45)),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(
          height: dynamicHeight(550),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(lastname.length, (index) {
              return GridViewCustom(
                productname: lastname[index]['Productname'],
                img: lastname[index]['img'],
                pressed: () {
                  setState(() {
                    selectedproduct = lastname[index]['Productname'];
                  });
                },
              );
            }),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: dynamicWidth(120),
          height: dynamicHeight(50),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(25)),
          child: TextButton(
            onPressed: () async {
              var item = HiveManager.instance.getDataFromBox(HiveBoxes.USER);
              print(item);
              await FirebaseApi().orderCreator(item['name'], item['surname'], item['email'], item['address'], selectedproduct);
              showSnackBar(context, 'Satın Alım Gerçekleşti', '');
            },
            child: Text(
              "Satın Al",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
