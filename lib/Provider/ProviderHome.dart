import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Provider/ProviderApp.dart';
import 'package:mosharekatha_flutter/Provider/UserProvider.dart';
import 'package:provider/provider.dart';

class ProviderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<Prova>(
      builder: (ctx, state, child) {
        return Container(
          child: Column(children: [
            ...state.drinks
                .map((e) => FlatButton(
                      child: Row(
                        children: [
                          Text(e.name),
                          Text(' - '),
                          Text(e.country),
                        ],
                      ),
                      onPressed: () {
                        state.editDrink(e.name);
                      },
                    ))
                .toList(),
            RaisedButton(
              child: Text('btn'),
              onPressed: () {
                state.addDrink(Drink(name: 'poison', country: 'shadowland'));
              },
            ),
            SizedBox(height: 100),

          ]),
        );
      },
    ));
  }
}

class ProviderUserHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<UserProvider>(
      builder: (ctx, state, child) {
        return Container(
          child: Center(
            child: Column(children: [
              Text(state.user_state.location.country,),
              Text(state.user_state.location.city),
              Text(state.user_state.location.address),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Add Location'),
                onPressed: (){
                  state.addLocation(city:'updated city',country:'updatedCountry');
                },
              )

            ]),
          ),
        );
      },
    ));
  }
}
