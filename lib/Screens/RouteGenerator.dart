import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/Auth/AuthConfirm.dart';
import 'package:mosharekatha_flutter/Screens/Auth/AuthRegister.dart';
import 'package:mosharekatha_flutter/Screens/Home/HomeScreen.dart';
import 'package:mosharekatha_flutter/Screens/Home/PostBloc.dart';
import 'package:mosharekatha_flutter/Screens/Home/Posts.dart';
import 'package:mosharekatha_flutter/Screens/Home/ReduxPosts.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Hooks.dart';

import 'package:mosharekatha_flutter/Screens/InitialScreens/Loading.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Register.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Verify.dart';
import 'package:mosharekatha_flutter/Screens/News/News.dart';
import 'package:mosharekatha_flutter/Screens/News/NewsDisplay.dart';
import 'package:mosharekatha_flutter/UI/Form/SelectScreen.dart';



class Router{
  static Route generateRoute(RouteSettings settings){
    final params = settings.arguments;

    Map args=params;

    switch(settings.name){
      // case '/authRegister':
      //   return MaterialPageRoute(builder:(_)=>AuthRegister());

      case '/':
        return MaterialPageRoute(builder:(_)=>HomeScreen());

      case '/register':
        return MaterialPageRoute(builder:(_)=>AuthReg());

      case '/news':
        return MaterialPageRoute(builder:(_)=>News());

      case '/newsDisplay':
        return MaterialPageRoute(builder:(_)=>NewsDisplay(news_id:args['newsId'],));

      // case '/register':
      //   Map args=params;
      //   print(args);
      //   return MaterialPageRoute(builder:(_)=>Hooks(header: args['title']));
      //
      // case '/verify':
      //   return MaterialPageRoute(builder:(_)=>Verify());

      case '/posts':
        return MaterialPageRoute(builder:(_)=>Posts());
      case '/selectScreen':
        return MaterialPageRoute(builder:(_)=>SelectScreen(data:args['data'],onSelect:args['onSelect']));
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