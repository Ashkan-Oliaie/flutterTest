import 'package:flutter/material.dart';

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
      body: Column(
          children:[
            Text('Verify'),
            RaisedButton(
                onPressed:()=>{
                  Navigator.pushNamed(context,'/')
                },
                child:Text('submit')
            )
          ]
      ),
    );
  }
}
