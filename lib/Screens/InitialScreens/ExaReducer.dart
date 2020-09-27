import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';


class localState {
  int counter = 0;
  localState({this.counter=0});
}

class IncrementCounter {
  IncrementCounter({this.counter});
  final int counter;
}


class ExaReducer extends HookWidget {
  @override
  Widget build(BuildContext context) {

    localState reducer(localState state, IncrementCounter action) {
      if(action is IncrementCounter) {
        return localState(counter:state.counter + 1);
      }
      return state;
    }

    final store = useReducer(
        reducer,
        initialState: localState()
    );

    return Scaffold(
      body: Center(

        child: Text('Button tapped ${store.state.counter.toString()} times'),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () => store.dispatch(IncrementCounter(counter: 1)),
        child: const Icon(Icons.add),
      ),
    );
  }
}