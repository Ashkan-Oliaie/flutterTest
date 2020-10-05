import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/MainState.dart';



class AppState extends Equatable {
  String color;
  String version;


  AppState({
        this.color = 'haha',
        this.version = 'dfdf',
  });

  AppState copyWith({
    String color,
    String version,
  }) {
    return AppState(
        color: color ?? this.color,
        version: version ?? this.version
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [color,version];
}
