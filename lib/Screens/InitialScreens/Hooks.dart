import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



class Hooks extends HookWidget {

  const Hooks({Key key, this.duration:0,this.header:'Header Title'})
      : assert(header != null),
        super(key: key);


  final int duration;
  final String header;

  @override
  Widget build(BuildContext context) {

    final counter = useState(duration);


    useEffect(() {
      print('fafa');
      return () => {};
    }, [counter]);

    return Scaffold(
      appBar: AppBar(
        title:Text(header),
        centerTitle: true,
      ),
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
             children: [
               // Typo(duration.toString(),true),
               Typo(text: 'This is your counter',bold:true,color:Colors.red),
               Typo(text: counter.value.toString(),bold:true,color:Colors.teal),

             ],
           ),

           Column(
             children: [
               Touchable(
                 onPress: ()=>{
                   Navigator.pushNamed(context,'/verify')
                 },
                 caption: 'GoNext',
                 // col:Colors.pinkAccent,

               ),
               Touchable(
                 onPress: ()=>{
                   counter.value=counter.value+1
                 },
                 caption: 'Increase',
                 // col:Colors.pinkAccent,

               )
             ],
           )

          ],
        )
      )
    );
  }
}