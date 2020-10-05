import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/Screens/Auth/AuthConfirm.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



class SelectScreen extends HookWidget {

  SelectScreen({ this.data,this.fieldName,this.onSelect});


  List data;
  String fieldName;
  var onSelect;




  @override
  Widget build(BuildContext context) {

    useEffect(() {

      return () => {};
    }, []);

    item(index){
      print(index);
      return  InkWell(
        onTap: (){
          onSelect(data[index],context);

        },
        child: Container(
          decoration: BoxDecoration(
            border:Border(bottom:BorderSide(color:Colors.grey.shade400))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Typo(text:data[index].caption,size:18,bold:true)),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title:Text('test'),
        centerTitle: true,
      ),
      body:Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return item(index);
          },
        ),
      )
    );
  }
}