import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mosharekatha_flutter/Bloc/Events/MainEvent.dart';
import 'package:mosharekatha_flutter/Bloc/States/MainState.dart';
import 'package:mosharekatha_flutter/Bloc/States/UserState.dart';



class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(initial) : super(initial);

  void Login(token){
    add(TokenChange(token:token));
  }
  void logaa(userStatus){
    add(StatusChange(userStatus: userStatus));
  }
  void changeUserStatus(year){
    add(YearChange(year:year));
  }

  void changeUserInfo(n,f,p,c){
    add(InfoChange(userInfo:UserInfo(name:n,family:f,phone:p,code:c)));
  }


  @override
  Stream<MainState>  mapEventToState(MainEvent event) async* {

    if (event is TokenChange) yield state.copyWith(user_state:state.user_state.copyWith(token:event.token));

    if (event is StatusChange) yield state.copyWith( user_state:state.user_state.copyWith(userStatus:event.userStatus,token:'para'));
    //
    if (event is YearChange) yield  state.copyWith(user_state:state.user_state.copyWith(year:event.year,userStatus:'USERSTATUS'));
    //
    if (event is InfoChange) yield state.copyWith(user_state:state.user_state.copyWith(userInfo:event.userInfo));
  }
}