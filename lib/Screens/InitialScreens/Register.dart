import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Hooks.dart';

class Register extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('ثبت نام'),
        centerTitle: true,
      ),
        body:Hooks(duration: 2,)
    );
  }
}
