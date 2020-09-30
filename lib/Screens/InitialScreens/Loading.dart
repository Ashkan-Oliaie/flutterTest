import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Bloc/Bloc/MainBloc.dart';
import 'package:mosharekatha_flutter/Bloc/States/MainState.dart';
import 'package:mosharekatha_flutter/Bloc/States/UserState.dart';
import 'package:mosharekatha_flutter/Loading/loading_bloc.dart';
import 'package:mosharekatha_flutter/UI/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterArguments {
  final int duration;
  final String text;

  RegisterArguments(this.duration, this.text);
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {




    return Scaffold(
        body: SafeArea(
            child: BlocBuilder<MainBloc, MainState>(
                buildWhen: (previousState, state) {
                 return previousState.user_state.token!=state.user_state.token;
                },
              builder:(context,state){
                print('rerender loading');


                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        CircularProgressIndicator(),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, '/register',
                                    arguments: {"duration": 2, "title": "home"})
                              },
                              child: Text('submit')),
                        ),
                        Typo(text:state.user_state.token,size:20,color:Colors.green),
                        Typo(text:state.user_state.userStatus,size:20,color:Colors.green),
                        Typo(text:state.user_state.year,size:20,color:Colors.green),

                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Typo(text: state.user_state.userInfo.name  ,size:20,color:Colors.green),
                              Typo(text: state.user_state.userInfo.family  ,size:20,color:Colors.green),
                            ],
                          ),
                        )
                      ],),
                     Column(
                       children: [
                         Touchable(
                           onPress: () {
                             Navigator.pushNamed(context, '/register',
                                 arguments: {"duration": 2, "title": "home"});
                           },

                           caption: 'GoNext',
                           // col:Colors.pinkAccent,

                         ),
                         Touchable(
                           onPress: () {
                             context.bloc<MainBloc>().Login('Login');
                           },

                           caption: 'Login',
                           // col:Colors.pinkAccent,

                         ),
                         Touchable(
                           onPress: () {
                             context.bloc<MainBloc>().logaa('Logout');
                           },

                           caption: 'Logout',
                           // col:Colors.pinkAccent,

                         ),
                         Touchable(
                           onPress: () {
                             context.bloc<MainBloc>().changeUserStatus('Golakh');
                           },

                           caption: 'Golakh',
                           // col:Colors.pinkAccent,

                         ),
                         Touchable(
                           onPress: () {
                             context.bloc<MainBloc>().changeUserInfo('ashkan','oliaie','222','555');
                           },

                           caption: 'Golakh',
                           // col:Colors.pinkAccent,

                         ),

                       ],
                     )
                    ],
                  ),
                );
              }
            )));
  }
}
