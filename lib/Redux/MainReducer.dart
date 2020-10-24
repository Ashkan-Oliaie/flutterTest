





import 'package:mosharekatha_flutter/Redux/ItemsState/ItemsReducer.dart';
import 'package:mosharekatha_flutter/Redux/QueryState/QueryReducer.dart';
import 'package:mosharekatha_flutter/Redux/UserState/UserReducer.dart';




class User_state{
  String token;
  String userStatus;
  String year;

  User_state({this.token,this.userStatus,this.year});

  User_state copyWith({
    String token,
    String userStatus,
    String year
}){
    return User_state(
        token: token ?? this.token,
        userStatus: userStatus ?? this.userStatus,
        year: year ?? this.year,

    );

}
}

class ReduxAppState {
  final List<String> items;
  final String searchQuery;
  final User_state user_state;

  ReduxAppState({this.items, this.searchQuery, this.user_state});
}




ReduxAppState appStateReducer(ReduxAppState state, action) =>  ReduxAppState(
    items:itemsReducer(state.items, action),
    searchQuery:searchQueryReducer(state.searchQuery, action),
    user_state:userReducer(state.user_state, action),
);
