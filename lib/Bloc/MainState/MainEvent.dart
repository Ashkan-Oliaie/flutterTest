
import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class TokenChange extends MainEvent {


  final String token;

  TokenChange({this.token});

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