import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/List/NormalList.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

class Posts extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NormalList(

        url: 'https://jsonplaceholder.typicode.com/posts',
        listItem: (data) {
          Map l = data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius:BorderRadius.all(Radius.circular(15)),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin:EdgeInsets.only(bottom:5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:5),
                        child: Typo(text: l['title'],bold:true,color:Colors.deepPurpleAccent,size:15),
                      ),
                      Typo(text:l['body']),

                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
