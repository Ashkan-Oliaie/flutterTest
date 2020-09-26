import 'package:flutter/material.dart';

class Typo extends StatefulWidget {

  String text;
  bool bold=false;


  Typo(this.text,this.bold);

  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Typo> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Text(widget.text,style: TextStyle(fontSize: 20,fontWeight:widget.bold ? FontWeight.bold : null),)
    );
  }
}
