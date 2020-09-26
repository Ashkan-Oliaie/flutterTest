import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:SafeArea(
        child:Center(
          child: Column(
            children:[
              CircularProgressIndicator(),
              RaisedButton(
                  onPressed:()=>{
                    Navigator.pushNamed(context,'/register')
                  },
                  child:Text('submit')
              )
            ],
          ),
        )
      )
    );
  }
}
