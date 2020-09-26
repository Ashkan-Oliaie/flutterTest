import 'package:flutter/material.dart';

class Touchable extends StatefulWidget {
  @override
  _TouchableState createState() => _TouchableState();
}

class _TouchableState extends State<Touchable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed:null,
          child:Text('Submit',)
      ),
    );
  }
}
