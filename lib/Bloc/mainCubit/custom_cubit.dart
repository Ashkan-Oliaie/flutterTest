import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_state.dart';

class CustomCubit extends Cubit<CustomState> {
  CustomCubit() : super(CustomInitial());
}
