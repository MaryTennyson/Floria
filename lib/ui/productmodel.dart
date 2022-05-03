import 'package:floria/ui/purchasingpage.dart';
import 'package:floria/scripts/productlist.dart';
import 'package:flutter/material.dart';

class ProductModelCustom extends StatefulWidget {
  const ProductModelCustom(this.productname,{ Key? key }) : super(key: key);

  final String productname;

  @override
  State<ProductModelCustom> createState() => _ProductModelCustomState();
}

class _ProductModelCustomState extends State<ProductModelCustom> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.productname.toString()),
      trailing: IconButton(onPressed: (() {
        Navigator.push(context,  MaterialPageRoute(builder: (context) => PurchasingPage(widget.productname)),);
      }), icon: Icon(Icons.arrow_forward_ios))
      
    );
  }
}