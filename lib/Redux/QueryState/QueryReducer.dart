

import 'package:mosharekatha_flutter/Redux/QueryState/QueryActions.dart';

String searchQueryReducer(String searchQuery, action) {

  if(action is ChangeQuerySearch){
    return action.query;
  }
  return searchQuery;
}