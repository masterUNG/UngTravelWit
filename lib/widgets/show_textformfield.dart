import 'package:flutter/material.dart';

class ShowTextFormField extends StatelessWidget {
  final String label;
  final Function(String?) mySave;
  final String? Function(String?)? myValidate;
  const ShowTextFormField(
      {Key? key,required this.label, required this.mySave, required this.myValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: mySave,
      validator: myValidate,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        label:  Text(label),
      ),
    );
  }
}
