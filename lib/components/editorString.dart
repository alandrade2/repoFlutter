import 'package:flutter/material.dart';

class EditorString extends StatelessWidget {
  final TextEditingController? ctlControler;
  final String? ctlRotulo;
  final String? ctlDica;
  final IconData? ctlIcon;

  EditorString({
    this.ctlControler,
    this.ctlRotulo,
    this.ctlDica,
    this.ctlIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
       child: TextField(
        controller: ctlControler,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: ctlIcon != null ? Icon(ctlIcon) : null,
          labelText: ctlRotulo,
          hintText: ctlDica,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}