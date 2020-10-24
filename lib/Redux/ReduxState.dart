



import 'package:mosharekatha_flutter/Redux/MainReducer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


var initialState=ReduxAppState(items:['ashkan','hootan'],searchQuery:'search',user_state:User_state(token:'firsttoken',userStatus:'loggedOut',year: '1992'));


final reduxStore = new Store<ReduxAppState>(appStateReducer, initialState: initialState);