import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mosharekatha_flutter/Redux/MainReducer.dart';
import 'package:mosharekatha_flutter/Redux/QueryState/QueryActions.dart';
import 'package:mosharekatha_flutter/Redux/UserState/UserActions.dart';


import 'package:mosharekatha_flutter/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



class Texio extends HookWidget {



  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final query = useState('');

    useEffect((){
      return (){
        print('disposing');
        myController.dispose();
      };
    },[]);

    print('redux field');

    return Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextField(
              controller: myController,

            ),
            Column(
              children: [
                StoreConnector<ReduxAppState,VoidCallback>(
                    converter: (store) {
                      return () => store.dispatch(ChangeQuerySearch(query:myController.text));
                    },
                    builder: (ctx,clb){
                      return Touchable(
                        onPress: ()=>{
                          clb()
                        },
                        caption: 'Set',
                        // col:Colors.pinkAccent,
                      );
                    }
                ),
                StoreConnector<ReduxAppState,VoidCallback>(
                    converter: (store) {

                      return () => store.dispatch(Login(token:'fafa'));
                    },
                    builder: (ctx,clb){
                      return Touchable(
                        onPress: ()=>{
                          clb()
                        },
                        caption: 'Login',
                        // col:Colors.pinkAccent,
                      );
                    }
                ),

              ],
            )

          ],
        )
    );
  }
}
