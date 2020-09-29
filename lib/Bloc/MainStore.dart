





import 'package:flutter_bloc/flutter_bloc.dart';


class MainStore extends Cubit<int> {
  /// {@macro brightness_cubit}
  MainStore() : super(0);

  // static final _lightTheme = ThemeData(
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     foregroundColor: Colors.white,
  //   ),
  //   brightness: Brightness.light,
  // );
  //
  // static final _darkTheme = ThemeData(
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     foregroundColor: Colors.black,
  //   ),
  //   brightness: Brightness.dark,
  // );

  /// Toggles the current brightness between light and dark.
  void add_number() {
    emit(state+1);
  }
}

enum CounterEvent {
  /// Notifies bloc to increment state.
  increment,

  /// Notifies bloc to decrement state.
  decrement
}

class CounterBloc extends Bloc<CounterEvent, int> {

  CounterBloc(i) : super(i);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}