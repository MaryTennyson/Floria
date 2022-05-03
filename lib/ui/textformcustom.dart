import 'package:flutter/material.dart';

import 'base_state.dart';

class TextFormCustom extends StatefulWidget {
  const TextFormCustom(this.labeltext, this.textinputtype, this.textinputtaction, this.formcontroller, {Key? key}) : super(key: key);
  final String labeltext;
  final TextInputType textinputtype;
  final TextInputAction textinputtaction;
  final TextEditingController formcontroller;
  @override
  State<TextFormCustom> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends BaseState<TextFormCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(280),
      margin: EdgeInsets.all(dynamicHeight(10)),
      child: TextFormField(
        controller: widget.formcontroller,
        textInputAction: widget.textinputtaction,
        keyboardType: widget.textinputtype,
        maxLines: null,
        decoration: InputDecoration(
          label: Text(widget.labeltext),
        ),
      ),
    );
  }
}
