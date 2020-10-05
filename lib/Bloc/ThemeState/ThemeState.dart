import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/MainState.dart';



class ThemeState extends Equatable {

  String primary;



  ThemeState({
    this.primary = 'haha',

  });

  ThemeState copyWith({
    String primary,

  }) {
    return ThemeState(
        primary: primary ?? this.primary,

    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [primary];
}
