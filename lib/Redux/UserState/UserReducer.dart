import 'package:mosharekatha_flutter/Redux/MainReducer.dart';
import 'package:mosharekatha_flutter/Redux/UserState/UserActions.dart';




User_state userReducer(User_state state,action) {

  if (action is Login) {

    return state.copyWith(token:action.token);
  }

  return state;
}
