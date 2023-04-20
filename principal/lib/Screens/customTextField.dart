import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  final int line;
  String initialValue;
  String err;
  String _value = "";
  CustomTextField(
      {this.title = "",
      this.placeholder = "",
      this.ispass = false,
      this.err = "please complete",
      this.line = 1,
      required this.initialValue});
  TextEditingController controller = new TextEditingController();
  int i = 0;
  TextFormField textfrofield() {
    i++;
    if (i == 1) {
      controller.text = initialValue;
      _value = initialValue;
    }
    ;
    return TextFormField(
      controller: controller,
      maxLines: line,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) => e!.isEmpty ? err : null,
      obscureText: ispass,
      decoration: InputDecoration(
          hintText: placeholder,
          labelText: title,
          labelStyle: TextStyle(color: Color.fromARGB(255, 74, 71, 71)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 74, 71, 71)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }

  String get value {
    return _value;
  }
}
