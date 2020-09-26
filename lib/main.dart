

import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Loading.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Register.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Verify.dart';
import 'package:mosharekatha_flutter/UI/Form/CustomInput.dart';

import 'package:mosharekatha_flutter/UI/Touchable.dart';

void main() {
  runApp(MaterialApp(
    // title: 'first page',
    // home: FirstPage(),
    initialRoute: '/',
    routes:{
      '/':(context)=>Loading(),
      '/register':(context)=>Register(),
      '/verify':(context)=>Verify(),

    },
  ));
}








class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('App bar', style: TextStyle(color: Colors.white)),
        ),
        body: Full());
  }
}

class Full extends StatefulWidget {
  @override
  _FullState createState() => _FullState();
}

class _FullState extends State<Full> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white10,
        child: Stack(
          children:[
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 0.45,
              heightFactor: 0.45,
              child: Material(
                color:Colors.green,
              borderRadius:BorderRadius.all(Radius.circular(200)),
                child:Container(
                  width:400,
                  height:400
                )
              ),
            ),

            Align(


              child: Material(
                  color:Colors.green,
                  borderRadius:BorderRadius.all(Radius.circular(200)),
                  child:Container(
                      width:400,
                      height:400
                  )
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:5,bottom:10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                              elevation:5,
                              color: Colors.white,borderRadius:BorderRadius.all(Radius.circular(100)),child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset('images/t.jpg',width:100,height:100),
                          )),
                          Texta(
                              Icon(Icons.person,),'Phone Number'),
                        ],
                      ),
                    ),

                    Touchable()
                  ],
                ),
              )),]
        ));
  }
}
