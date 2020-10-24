



import 'package:mosharekatha_flutter/Redux/QueryState/QueryActions.dart';

class AddItemAction {
  String item;
}

class RemoveItemAction {
  String item;
}



List<String> itemsReducer(List<String> items, action) {


  if(action is ChangeQuerySearch){
    return ['new','sds'];
  }else {
    return items;
  }
}