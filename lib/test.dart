import 'package:flutter/material.dart';


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed:null,
          child:Text('Submit',)
      ),
    );
  }
}
