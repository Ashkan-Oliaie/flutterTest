part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {}

class AddPost extends StoreEvent {}

class DeletePost extends StoreEvent {}

class EditPost extends StoreEvent {}


