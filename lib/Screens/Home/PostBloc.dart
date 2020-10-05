import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosharekatha_flutter/Bloc/store_bloc.dart';
import 'package:mosharekatha_flutter/UI/List/FixedList.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

class PostBloc extends StatefulWidget {

  final bloc= PostBloca(0);

  @override
  _State createState() => _State();
}

class _State extends State<PostBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Typo(text:'New Posts'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder(
            cubit: widget.bloc,
            builder: (context ,state){
              print(state);
              return Container(
                child:Typo(text:'${state}')
              );
            },
          ),
          Touchable(caption:'Add',onPress: (){
            widget.bloc.Add();
          },)
        ],
      ),
    );
  }


  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }
}
