import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Network/Dio.dart';
import 'package:mosharekatha_flutter/UI/Loada.dart';

import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:dio/dio.dart';



class localState {

  int page = 0;
  int pageSize = 10;
  bool loading = true;
  bool error = false;
  bool refreshing = false;
  var localRerender = false;
  var data = {};

  localState({
    this.localRerender = false,
    this.data,
    this.error:false,
    this.loading: true,
    this.page: 0,
    this.refreshing,

  });

  localState set({
    int page,
    int pageSize ,
    bool loading ,
    bool error,
    bool refreshing,
    var localRerender,
    var data }) {



    return localState(
      page: page ?? this.page,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      refreshing: refreshing ?? this.refreshing,
      localRerender: localRerender ?? this.localRerender,
      data: data ?? this.data,
    );
  }









}



class SetData {
  var data;


  SetData({this.data});
}


class SetInitialData {
  var data;


  SetInitialData({this.data});
}


class SetError {

}


class Rerender {
  final localRerender;
  var data;

  Rerender({this.localRerender, this.data});
}

class Refresh {
  final localRerender;
  var data;
  var loading;

  Refresh({this.localRerender, this.data});
}

class NextPage {
  int page;

  NextPage({this.page});
}







class SinglePage extends HookWidget {

  String url;
  var childRenderer;
  SinglePage({ this.url,this.childRenderer});



  @override
  Widget build(BuildContext context) {



    reducer(state, action) {

      if (action is SetError) {
        return localState(error:true,loading:false);
      }

      if (action is Rerender) {
        return state.set(loading:true);
      }

      // if (action is SetInitialData) {
      //
      //
      //   if(state.data==null){
      //
      //     return localState().set(data: action.data, loading: false);
      //
      //   }else{
      //
      //     var newList= action.data + state.data;
      //     return localState().set(data: newList, loading: false);
      //   }
      //
      // }


      if (action is SetData) {

        return state.set(data:action.data,loading:false);



      }

      // if (action is Refresh) {
      //   return state.set(data:[],localRerender: !state.localRerender,loading:true);
      //
      // }

      // if (action is NextPage) {
      //   return state.set(localRerender:!state.localRerender,page:state.page+1);
      //
      //
      // }

      return state;
    }



    final store = useReducer(reducer, initialState: localState(data:{}));


    void rerender(){
      store.state.dispatch(Rerender);
    }

    void request() async {

      // if(_refreshIndicatorKey.currentState!=null){
      //   _refreshIndicatorKey.currentState.show();
      // }
      try{
        Response res = await MainDio.get(url,
            // queryParameters:{"SkipCount":store.state.page,"MaxResultCount":10}
        );

        var resData = jsonDecode(res.toString());

        print(resData);

        // data.value=
        store.dispatch(SetData(data:resData));



      }catch(e){

        // store.dispatch(SetError());

      }



    }

    useEffect(() {
      request();
      return () => {};
    }, [store.state.localRerender]);


    if(store.state.loading){
      return Loada();
    }

    return Container(
        child:childRenderer(store.state.data,rerender)
    );
  }
}