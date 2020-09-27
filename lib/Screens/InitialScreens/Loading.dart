import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterArguments {
  final int duration;
  final String text;

  RegisterArguments(this.duration, this.text);
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
         Column(children: [
           CircularProgressIndicator(),
           Container(
             width: double.infinity,
             margin: EdgeInsets.only(left: 20, right: 20),
             child: RaisedButton(
                 onPressed: () => {
                   Navigator.pushNamed(context, '/register',
                       arguments: {"duration": 2, "title": "home"})
                 },
                 child: Text('submit')),
           ),
         ],),
          Touchable(
            onPress: () {
              Navigator.pushReplacementNamed(context, '/register',
                  arguments: {"duration": 2, "title": "home"});
            },

            caption: 'GoNext',
            // col:Colors.pinkAccent,

          )
        ],
      ),
    )));
  }
}
