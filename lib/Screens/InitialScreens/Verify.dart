import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/ExaReducer.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Hooks.dart';
import 'package:mosharekatha_flutter/UI/Touchable.dart';


class Verify extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('تایید هویت'),
        centerTitle: true,

      ),
      body:Column(
        children: [
          // ExaReducer(),
          Touchable(onPress:(){Navigator.pushNamed(context,'/posts');} ,)
        ],
      )
    );
  }
}
