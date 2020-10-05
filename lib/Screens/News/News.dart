import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/List/NormalList.dart';
// import 'package:mosharekatha_flutter/UI/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



newsItem(item,ctx){

  return Container(
    child:Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),


      elevation:5 ,
      child: InkWell(

        borderRadius: BorderRadius.circular(15.0),
          onTap:(){
            Navigator.pushNamed(ctx, '/newsDisplay',arguments: {'newsId':item['id']});
          },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children:[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                        width:100,height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network('https://apione.mosharekatha.ir/api/FileManagement/DownloadFile/imagenews/${item['image']}',fit: BoxFit.cover,)),
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Typo(text:item['title'],)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              new Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Icon(Icons.more_horiz,size:20),
                  )
            ]
          ),
        ),
      ),
    ) ,
  );
}

class News extends HookWidget {

  // Hooks({ this.duration:0,this.header:'Header Title'})
  //
  //
  //
  // final int duration;
  // final String header;

  @override
  Widget build(BuildContext context) {

    final counter = useState(0);



    useEffect(() {

      return () => {};
    }, [counter]);

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 100,
        title:Typo(text:'اخبار',size: 20,),
        centerTitle: true,
      ),
      body:Container(
        child:NormalList(
          url:'/api/NewsManagement/news/Search/User',
          listItem:newsItem ,)
      )
    );
  }
}