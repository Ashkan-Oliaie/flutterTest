
import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class TokenChange extends MainEvent {


   String token;

  TokenChange({this.token});

  String generateToken(i){
    return i+'2'+'feri';
  }

   void gg(){
     List<int> nums=[2,3,4,5,3];
     for (var i in nums){
       print(i.toString());
       if(i==2){
         token='adasdas';
       }
       generateToken(i);
     }
   }

  @override
  List<Object> get props => [token];
}

class StatusChange extends MainEvent {

  final String userStatus;

  StatusChange({this.userStatus});

  @override
  List<Object> get props => [userStatus];
}

class YearChange extends MainEvent {


  final String year;

  YearChange({this.year});

  @override
  List<Object> get props => [year];
}

class InfoChange extends MainEvent {


  final UserInfo userInfo;

  InfoChange({this.userInfo});

  @override
  List<Object> get props => [userInfo];
}