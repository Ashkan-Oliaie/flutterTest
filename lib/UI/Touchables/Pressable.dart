import 'dart:ffi';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:mosharekatha_flutter/UI/Typo.dart';


class Pressable extends HookWidget {

  Pressable({this.child,this.width,this.onPress});

  Widget child;
  int width;
  var onPress;


  @override
  Widget build(BuildContext context) {
    final counter = useState(2);

    useEffect(() {
      print('fafa');
      return () => {};
    }, [counter]);



    return Center(
      child: InkWell(
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: onPress,
        child: Container(
          width: width.toDouble(),
          child: child,
        ),
      ),
    );
}}

