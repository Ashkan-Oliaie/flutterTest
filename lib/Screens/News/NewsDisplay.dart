import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mosharekatha_flutter/UI/SinglePage.dart';
import 'package:mosharekatha_flutter/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

childRenderer(data, rerenderer, context) {
  print(data);
  return Center(
    child: SingleChildScrollView(
      child: Stack(

        children:[
          Container(
            child: ColumnSuper(
              innerDistance: -30.0,
              children: [
                Container(
                  height:280,
                  child: Image.network(
                      'https://apione.mosharekatha.ir/api/FileManagement/DownloadFile/imagenews/${data['image']}',fit: BoxFit.cover,),
                ),
                Container(
                  padding: EdgeInsets.only(top:20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(bottom:20,left:10,right:10,top:20),
                        child: Typo(text: data['title'],size:16,bold:true,color:Colors.blueGrey),
                      ),
                      Html(
                        data: data['body'],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          new Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.deepPurpleAccent,
                        Colors.white.withOpacity(0.0),
                      ])),
              child: Padding(
                padding: const EdgeInsets.only(top:30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,size:25,color:Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    ),
  );
}

class NewsDisplay extends HookWidget {
  String news_id;

  NewsDisplay({this.news_id});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    useEffect(() {
      return () => {};
    }, [counter]);

    return Scaffold(
        body: Container(
            child: SinglePage(
      url: '/api/NewsManagement/news/${news_id}',
      childRenderer: (data, rerenderer) =>
          childRenderer(data, rerenderer, context),
    )));
  }
}
