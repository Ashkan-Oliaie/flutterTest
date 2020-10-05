
import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';

abstract class ThemeEvents extends Equatable {
  const ThemeEvents();
}


class ChangeColor extends ThemeEvents {

  final String primary;

  ChangeColor({this.primary});

  @override
  List<Object> get props => [primary];
}
