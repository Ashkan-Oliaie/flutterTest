import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';
import 'package:mosharekatha_flutter/Bloc/ThemeState/ThemeEvents.dart';
import 'package:mosharekatha_flutter/Bloc/ThemeState/ThemeState.dart';



class ThemeBloc extends Bloc<ThemeEvents, ThemeState> {
  ThemeBloc(initial) : super(initial);

  void changePrimary(color){
    add(ChangeColor(primary:color));
  }


  @override
  Stream<ThemeState>  mapEventToState(ThemeEvents event) async* {

    if (event is ChangeColor) yield state.copyWith(primary:event.primary);

  }
}