part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {}

class SearchResultItem {

   String fullName='name';
   String url='url';
   String avatarUrl='avatar';

  SearchResultItem(this.fullName, this.url, this.avatarUrl);

}

class SearchResult {

  final String kind;
  final List<SearchResultItem> items;

  SearchResult(this.kind, this.items);


}





class myState extends LoadingState {

  final SearchResult result;

  myState(this.result);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}


class Starting extends LoadingState{

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Ending extends LoadingState{


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}



