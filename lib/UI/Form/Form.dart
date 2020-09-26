import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Form/CustomInput.dart';
import 'package:mosharekatha_flutter/UI/Touchable.dart';

class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Texta( Icon(Icons.person,),'Phone Number'),
          Touchable()
        ],
      )
    );
  }
}
