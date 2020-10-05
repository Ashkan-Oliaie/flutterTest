import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/AppState.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';

class MainState extends Equatable {

  UserState user_state;
  AppState app_state;

  MainState({this.user_state,this.app_state});


  MainState copyWith({
    UserState user_state
  }) {
    return MainState(
        user_state: user_state ?? this.user_state);
  }


  @override
  // TODO: implement props
  List<Object> get props => [user_state];

}


var InitialState = MainState(
    user_state: UserState(
      token:'asdasd',
      userStatus:'loggedOut',
      userInfo:UserInfo(
        name:'Guest',
        family:'',
        phone:'',
        code:''
      )
    ));