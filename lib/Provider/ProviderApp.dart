


import 'package:flutter/foundation.dart';


class Drink {
  String name;
  String country;

  Drink({this.name,this.country});
}


class Prova extends ChangeNotifier{
  List<Drink> _drinks = [
    Drink(name:'water',country: 'Global'),
    Drink(name:'cola',country:'USA'),
    Drink(name:'fanta',country:'EU'),
  ];

  void addDrink(Drink drink ){
    _drinks.add(drink);
    notifyListeners();
  }

  void editDrink(String drink_name ){
    _drinks.firstWhere((element) => element.name==drink_name)
    .country='IR';
    notifyListeners();
  }

  List<Drink> get drinks=>_drinks;
}