import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, SearchResult> {
  LoadingBloc(initial) : super(initial);


  void login(){
    add(StartLoading());
  }


  void logout(){
    add(StopLoading());
  }

  @override
  Stream<SearchResult>  mapEventToState(LoadingEvent event) async* {
    if (event is StartLoading) yield SearchResult('kind',[]);
    if (event is StopLoading) yield SearchResult('kind 2',[SearchResultItem('ashkan','ashakn_url','ashkan_avatar')]);
  }
}