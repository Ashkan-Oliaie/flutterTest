import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/Home/PostBloc.dart';
import 'package:mosharekatha_flutter/Screens/Home/Posts.dart';
import 'package:mosharekatha_flutter/Screens/Home/ReduxPosts.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Hooks.dart';

import 'package:mosharekatha_flutter/Screens/InitialScreens/Loading.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Register.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Verify.dart';



class Router{
  static Route generateRoute(RouteSettings settings){
    final params = settings.arguments;

    switch(settings.name){
      case '/':
        print(params);
        return MaterialPageRoute(builder:(_)=>Loading());
      case '/register':
        Map args=params;
        print(args);
        return MaterialPageRoute(builder:(_)=>Hooks(header: args['title']));

      case '/verify':
        return MaterialPageRoute(builder:(_)=>Verify());

      case '/posts':
        return MaterialPageRoute(builder:(_)=>Posts());
      case '/postsBloc':
        return MaterialPageRoute(builder:(_)=>PostBloc());
      case '/reduxPosts':
        return MaterialPageRoute(builder:(_)=>ReduxPosts());
      default:
        return ErrorPage();
    }
  }

 static Route ErrorPage(){
   return MaterialPageRoute(builder: (_)=>Scaffold(
     appBar: AppBar(
         title:Text('appbar'),
     ),
       body:Text('Error')
   ));
 }

}