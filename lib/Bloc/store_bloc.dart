import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'store_event.dart';
part 'store_state.dart';


class PostBloca extends Bloc{

  @override
  PostState get initialState => PostState.initial();

  PostBloca(initialState) : super(initialState);


  void Add(){
    add(AddPost());
  }


  // PostState get initialState => PostState.initial();

  @override
  Stream mapEventToState(event) async*{
    if(event is AddPost){
      yield state+1;
    }
  }

  void dispose() {

  }

}


// class Bloca extends Bloc<StoreEvent, StoreState> {
//   Bloca() : super(StoreInitial());
//   var _posts = [];
//
//   final state_controller = StreamController();
//
//   StreamSink get _inCounter=> state_controller.sink;
//   Stream get posts=>state_controller.stream;
//
//   final event_controller = StreamController();
//   Sink get eventSink=>event_controller.sink;
//
//
//
//
//   @override
//   Stream<StoreState> mapEventToState(
//     StoreEvent event,
//   ) async* {
//     if(event is AddPost){
//       _posts.add(6);
//     }
//
//     // TODO: implement mapEventToState
//   }
//
//
//   void dispose(){
//     state_controller.close();
//     event_controller.close();
//   }
// }
