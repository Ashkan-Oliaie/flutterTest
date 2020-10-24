import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class HooksGalleryApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // useAnimationController(duration: const Duration(seconds: 2));
    final Size size = MediaQuery.of(context).size;
    return Stack(children: [

      TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 1.0),
          duration: Duration(seconds: 4),
          builder: (context,value,child){
            return ShaderMask(
              shaderCallback: (bounds){
                return RadialGradient(
                  center: Alignment.bottomLeft,
                  // stops: [value,value],
                  radius: 6.0,
                  colors: <Color>[Colors.teal, Colors.deepOrange.shade900],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child:const  Text('Shadering Shadera',style:TextStyle(color: Colors.white,fontSize: 35),),

            );
          }
      ),
    ]);
  }
}



class BottomTab extends HookWidget {


  @override
  Widget build(BuildContext context) {

    useAnimationController(duration: const Duration(seconds: 2));

    final Size size = MediaQuery.of(context).size;

    return Stack(children: [
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              width: size.width,
              height: 80,
              child: Container(
                child: CustomPaint(
                  size: Size(size.width,80),
                  painter:Paintera() ,
                ),
              )))
    ]);
  }
}


class Paintera extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()..color=Colors.teal..style=PaintingStyle.fill;
    Path path = Path()..moveTo(0, 30)..moveTo(20, 10)..close();


    canvas.drawPath(path, paint);

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}