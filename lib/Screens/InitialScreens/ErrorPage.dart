import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Text('body'),
    );
  }
}
