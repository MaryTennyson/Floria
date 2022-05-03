import 'package:floria/service/data/snackbarcustom.dart';
import 'package:floria/service/fuctions/purchase.dart';
import 'package:flutter/material.dart';

class GridViewCustom extends StatefulWidget {
  const GridViewCustom({Key? key, required this.productname, required this.img, required this.pressed}) : super(key: key);

  final String productname;
  final String img;
  final VoidCallback pressed;

  @override
  State<GridViewCustom> createState() => _GridViewCustomState();
}

class _GridViewCustomState extends State<GridViewCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.pressed();
        showSnackBar(context, 'Seçtiğiniz ürün:', widget.productname);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(0, 4), color: Color(0xff8D8DAA).withOpacity(0.4))],
          border: Border.all(width: 0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: FadeInImage.assetNetwork(placeholder: 'assets/images/floria.png', image: widget.img.toString())),
          ],
        ),
      ),
    );
  }
}
