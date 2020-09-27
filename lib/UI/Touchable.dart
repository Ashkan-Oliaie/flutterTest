import 'package:flutter/material.dart';

class Touchable extends StatefulWidget {
  Touchable({Key key, this.onPress:null, this.caption:'Caption', this.col:Colors.deepPurpleAccent})
      : assert(caption != null),
        super(key: key);

  var onPress;
  String caption;
  Color col;

  @override
  _TouchableState createState() => _TouchableState();
}

class _TouchableState extends State<Touchable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: RaisedButton(
          color: widget.col,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: widget.onPress,
          child: Text(widget.caption)),
    );
  }
}
