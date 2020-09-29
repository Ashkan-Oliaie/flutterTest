part of 'store_bloc.dart';

// @immutable
// abstract class StoreState {}
//
// class StoreInitial extends StoreState {}


class PostState{
  var posts=5;

  PostState._();

  factory PostState.initial(){
    return PostState._()..posts=5;
  }

}