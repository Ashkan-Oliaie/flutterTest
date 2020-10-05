import 'package:equatable/equatable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Network/Dio.dart';
import 'package:mosharekatha_flutter/UI/List/FixedList.dart';
import 'package:mosharekatha_flutter/UI/Loada.dart';

import 'package:dio/dio.dart';

import 'dart:convert';

class localState {

  int page = 0;
  int pageSize = 10;
  bool loading = true;
  bool error = false;
  bool refreshing = false;
  var localRerender = false;
  var data = [];

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


final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();


class NormalList extends HookWidget {
  NormalList({
    this.url: 'https://jsonplaceholder.typicode.com/posts',
    this.listItem,
  });

  String url;
  var listItem;

  @override
  Widget build(BuildContext context) {
    final controller = useState(ScrollController());

    reducer(state, action) {

      if (action is SetError) {
        return localState(error:true,loading:false);
      }

      // if (action is Rerender) {
      //   return localState(data: [],loading:true,error:false);
      // }

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


          var newList=state.data + action.data ;

          return state.set(data:newList,loading:false);
            localState(data: newList, loading: false,localRerender:state.localRerender,page:state.page);


      }

      if (action is Refresh) {
        return state.set(data:[],localRerender: !state.localRerender,loading:true);

      }

      if (action is NextPage) {
        return state.set(localRerender:!state.localRerender,page:state.page+1);


      }

      return state;
    }



    final store = useReducer(reducer, initialState: localState(data:[]));




    useEffect(() {

      var _controller = ScrollController();

      scrollListener() {
        if (_controller.offset >= _controller.position.maxScrollExtent &&
            !_controller.position.outOfRange) {

          store.dispatch(NextPage());

        }
        if (_controller.offset <= _controller.position.minScrollExtent &&
            !_controller.position.outOfRange) {

        }
      }

      _controller.removeListener(scrollListener);
      _controller.addListener(scrollListener);
      controller.value = _controller;
      return () => {};
    }, []);




    void request() async {

      // if(_refreshIndicatorKey.currentState!=null){
      //   _refreshIndicatorKey.currentState.show();
      // }
      try{
        Response res = await MainDio.get(url,
            queryParameters:{"SkipCount":store.state.page,"MaxResultCount":10}
        );


        var resData = jsonDecode(res.toString());


        store.dispatch(SetData(data:resData['items']));



      }catch(e){

        // store.dispatch(SetError());


      }



    }

    useEffect(() {

      request();
      return () => {};
    }, [store.state.localRerender]);

    // Widget _viewer(data) {
    //   Map l = data;
    //   return Text(l['title']);
    // }





    Renderer() {
      var list = store.state.data;

      if ( store.state.loading) {
        return Loada();
      } else  {
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: ()async{
            store.dispatch(Refresh());
          },
          child: ListView.builder(
            controller: controller.value,
            itemCount: list.length,
            itemBuilder: (context, index) {
                return listItem(store.state.data[index],context);
            },
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Renderer(),
      ),

    );
  }
}
