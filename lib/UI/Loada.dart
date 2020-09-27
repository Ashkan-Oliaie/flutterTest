import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

class Loada extends StatefulWidget {


  Loada({Key key, this.caption:'لطفا منتظر بمانید', this.col:Colors.deepPurpleAccent})
      : assert(caption != null),
        super(key: key);


  String caption;
  Color col;

  @override
  _LoadaState createState() => _LoadaState();
}

class _LoadaState extends State<Loada> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Container( padding:EdgeInsets.all(10),child: Typo(text:widget.caption,bold: true,size:17,))
        ],
      ),
    );
  }
}
