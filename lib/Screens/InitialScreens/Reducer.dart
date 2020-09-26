import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

Store useReducer(
    Reducer<State, Action> reducer, {
      State initialState,
      Action initialAction,
    }) {
  return use(
    _ReducerdHook(
      reducer,
      initialAction: initialAction,
      initialState: initialState,
    ),
  );
}