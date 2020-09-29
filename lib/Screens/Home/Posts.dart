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
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal, Colors.deepPurpleAccent])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.person,size:50),
                      ),
                      color: Colors.blueGrey,
                      elevation: 5,
                      borderRadius:BorderRadius.all(Radius.circular(100))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:10),
                          child: Typo(size:17,text:'اولیایی',bold:true),
                        ),
                        Typo(size:17,text:'اشکان',bold:true),
                      ],
                    ),
                  )

                ],
              )),
          DrawerItem(
            icon: Icon(Icons.person),
            label:'New Posts',
            onPress: () {
              Navigator.pushNamed(context,'/postsBloc');
            },
          ),
          DrawerItem(
            icon: Icon(Icons.adjust),
            label:'posts Redux',
            onPress: () {
              Navigator.pushNamed(context,'/reduxPosts');
            },
          ),
          DrawerItem(
            icon: Icon(Icons.aspect_ratio),
            label:'Radio',
            onPress: () {},
          ),
        ],
      )),
      body: NormalList(
        url: 'https://jsonplaceholder.typicode.com/posts',
        listItem: (data) {
          Map l = data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Typo(
                            text: l['title'],
                            bold: true,
                            color: Colors.deepPurpleAccent,
                            size: 15),
                      ),
                      Typo(text: l['body']),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}


class DrawerItem extends StatefulWidget {

  DrawerItem({
    Key key,
    this.icon,
    this.label,
    this.onPress,
  })  : assert(label != null),
        super(key: key);

  var icon;
  String label;
  var onPress;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(color:Colors.grey.shade400))
      ),
      child: InkWell(
        splashColor:Colors.lightGreen,
        onTap: widget.onPress,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,15,10,15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right:8),
                      child: widget.icon,
                  ),
                  Typo(text:widget.label,size:16),

                ],
              ),
              Icon(Icons.arrow_right,size:25,)

            ],
          ),
        ),
      ),
    );
  }
}
