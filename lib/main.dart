import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/MainBloc.dart';
import 'package:mosharekatha_flutter/Bloc/MainStore.dart';
import 'package:mosharekatha_flutter/Bloc/Observer.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/MainState.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/Bloc/MainState/States/UserState.dart';
import 'package:mosharekatha_flutter/Bloc/ThemeState/ThemeBloc.dart';
import 'package:mosharekatha_flutter/Loading/loading_bloc.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/ExaReducer.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Loading.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Register.dart';
import 'package:mosharekatha_flutter/Screens/InitialScreens/Verify.dart';
import 'package:mosharekatha_flutter/Screens/RouteGenerator.dart';
import 'package:mosharekatha_flutter/UI/Form/CustomInput.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:redux/redux.dart';
import 'package:load/load.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(LoadingProvider(
      themeData: LoadingThemeData(),
      loadingWidgetBuilder: (ctx, data) {
        return Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(child: CircularProgressIndicator()),
          ),
        );
      },
      child: MyApp()));
}

// enum Actions { Increment }
//
//
// int counterReducer(int state, dynamic action) {
//   if (action == Actions.Increment) {
//     return state + 1;
//   }
//
//   return state;
// }
//
// void main() {
//   final store = Store<int>(counterReducer, initialState: 0);
//
//   runApp(FlutterReduxApp(
//     title: 'Flutter Redux Demo',
//     store: store,
//   ));
// }
//
//
// class FlutterReduxApp extends StatelessWidget {
//   final Store<int> store;
//   final String title;
//
//   FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
//     // ensure all routes have access to the store.
//     return StoreProvider<int>(
//       // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
//       // Widgets will find and use this value as the `Store`.
//       store: store,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/',
//         onGenerateRoute: Router.generateRoute,
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(InitialState),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(InitialState),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: PersianFonts.vazirTextTheme,
        ),
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("fa", "IR"),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoadingBloc(0),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/',
//         onGenerateRoute: Router.generateRoute,
//       ),
//     );
//   }
// }
//

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('App bar', style: TextStyle(color: Colors.white)),
        ),
        body: Full());
  }
}

class Full extends StatefulWidget {
  @override
  _FullState createState() => _FullState();
}

class _FullState extends State<Full> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white10,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            widthFactor: 0.45,
            heightFactor: 0.45,
            child: Material(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Container(width: 400, height: 400)),
          ),
          Align(
            child: Material(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(200)),
                child: Container(width: 400, height: 400)),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                          elevation: 5,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset('images/t.jpg',
                                width: 100, height: 100),
                          )),
                      Texta(
                          Icon(
                            Icons.person,
                          ),
                          'Phone Number'),
                    ],
                  ),
                ),
                Touchable()
              ],
            ),
          )),
        ]));
  }
}
