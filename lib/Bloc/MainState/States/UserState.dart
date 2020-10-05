import 'package:equatable/equatable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/MainState.dart';

class UserInfo  {
  String name='asd';
  String family='asd';
  String phone='asd';
  String code='asd';

  UserInfo({this.name ='asd',  this.family='asd' ,  this.phone='asd' ,this.code = 'asd'});
}

class UserState extends Equatable {
  String token;
  String userStatus;
  String year;
  UserInfo  userInfo;


  UserState(
      {this.token = 'haha',
      this.year = 'dfdf',
      this.userStatus = 'default userstatus',
      this.userInfo });

  UserState copyWith({
    String token,
    String userStatus,
    String year,
    UserInfo userInfo,
  }) {
    return UserState(
      userInfo: userInfo ?? this.userInfo,
        token: token ?? this.token,
        userStatus: userStatus ?? this.userStatus,
        year: year ?? this.year);
  }

  @override
  // TODO: implement props
  List<Object> get props => [token, year, userStatus,userInfo];
}
