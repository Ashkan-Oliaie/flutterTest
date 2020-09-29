import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Loada.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class localState {
  int counter = 0;
  int page=1;
  int pageSize=10;
  bool loading = true;
  bool refreshing = false;
  var localRerender = false;
  var data = [];


  localState({this.counter = 0, this.localRerender = false, this.data,this.loading:true,this.page:1,this.refreshing});
}

// localState (counter,localRerender,data) {
//   return(
//     {counter,localRerender,data}
//   );
// }

class IncrementCounter {
  final int counter;

  IncrementCounter({this.counter});
}

class SetData {
  var data;
  var loading;
  SetData({this.data,this.loading});
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

class NextPage{
  int page;
  NextPage({this.page});
}



class FixedList extends HookWidget {
  FixedList({
    Key key,
    this.initialData:List,
    this.listItem,
  })  : assert(initialData != null),
        super(key: key);

  var initialData;
  var listItem;

  @override
  Widget build(BuildContext context) {

    final controller = useState(ScrollController());


    reducer(state, action) {
      if (action is IncrementCounter) {
        return localState(
            counter: state.counter + action.counter,
            data: state.data,
            localRerender: state.localRerender);
      }

      // if (action is Rerender) {
      //   return localState(data: );
      // }

      if (action is SetData) {
        // print(action.data);
        return localState(data: action.data,loading:false);
      }





      return state;
    }

    final store = useReducer(reducer, initialState: localState(data:initialData));



    // void request() async {
    //   var res = await http.get(url);
    //   // print(res.body);
    //   if (res.statusCode == 200) {
    //     // print(jsonDecode(res.body));
    //     var resData = jsonDecode(res.body);
    //     //
    //     // print(resData);
    //
    //     // print(res.body);
    //     // print(l[0]);
    //     // List posts = List.from(l).map((model)=> model);
    //
    //     // List data = map;
    //     // print(l);
    //     // print(l[0]);
    //     store.dispatch(SetData(data: resData));
    //   }
    // }




    useEffect(() {


      var _controller = ScrollController();


      scrollListener() {
        if (_controller.offset >= _controller.position.maxScrollExtent &&
            !_controller.position.outOfRange) {

          print('bottom');
        }
        if (_controller.offset <= _controller.position.minScrollExtent &&
            !_controller.position.outOfRange) {
          print('top');
        }
      }

      _controller.addListener(scrollListener);

      controller.value=_controller;





      return () => {};
    }, []);


    useEffect(() {

      return () => {};
    }, [store.state.localRerender]);






    // Widget _viewer(data) {
    //   Map l = data;
    //   return Text(l['title']);
    // }

    Renderer() {
      var list = store.state.data;

      if (list == null || list.length==0) {
        return Loada();
      } else if (store.state.data != null) {
        return ListView.builder(
          controller: controller.value,
          itemCount: 10,
          itemBuilder: (context, index) {
            if (store.state.data != null) {
              return listItem(store.state.data[index]);
            }
          },
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Renderer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(IncrementCounter(counter: 1)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
