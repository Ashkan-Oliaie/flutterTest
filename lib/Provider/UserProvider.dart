import 'package:flutter/foundation.dart';


class Location{
  String city;
  String country;
  String address;

  Location({this.city,this.country,this.address});

  Location copyWith({
    String city,
    String country,
    String address
  }) {
    return Location(
      city: city ?? this.city,
      country: country ?? this.country,
      address: address ?? this.address,

    );
  }
}


class UserState {
  String phone;
  String status;
  Location location;


  UserState({this.phone,this.status,this.location});

  UserState copyWith({
    Location location,
    String phone,
    String status
  }) {
    return UserState(
        location: location ?? this.location,
        phone: phone ?? this.phone,
        status: status ?? this.status,

    );
  }
}



class UserProvider extends ChangeNotifier{
  UserState _user_state = UserState(phone:'00',status:'loggedIn',location:Location(city:'malayer',country:'Iran',address: 'asd'));

  void addLocation({String city , String country, String address }){
    _user_state.location=_user_state.location.copyWith(country:country,city:city,address:address);
    notifyListeners();
  }

  UserState get user_state=>_user_state;
}