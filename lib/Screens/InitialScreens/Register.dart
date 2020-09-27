import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Hooks.dart';

class Register extends StatefulWidget {


  Register({Key key, @required this.duration,this.text})
      : assert(duration != null),
        super(key: key);

  final int duration;
  final String text;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.text),
        centerTitle: true,
      ),
        body:Hooks(duration:widget.duration,)
    );
  }
}
