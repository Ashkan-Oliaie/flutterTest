import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Form/Forma.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';



var controller = TextEditingController();

class SelectScreenItem extends HookWidget {

  SelectScreenItem({this.forma,this.field});

  var forma;
  Field field;




  @override
  Widget build(BuildContext context) {

    final value = useState('');

    // useEffect(() {
    //
    //   print(field.name);
    //   print(forma.currentState.value[field.name]);
    //   // controller.text = forma.currentState.value[field.name];
    //
    //   return () => {};
    // }, [forma.currentState]);

    return Container(
      margin: EdgeInsets.only(top:10),
      child: Material(
        elevation:6,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white70,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: (){
            Navigator.pushNamed(context, '/selectScreen', arguments: {"data":field.selectiveData,'onSelect':(item,cont){
              Navigator.pop(cont);
              // value.value=item.caption;
              controller.text = item.caption;
              forma.currentState.setAttributeValue(field.name, item.id);
            }
            });
          },
          child: Container(
            height: 60,

            child: Container(
              width: 350,
              child: Padding(
                  padding: const EdgeInsets.only(right:15,left:15),
                  child: TextField(
                    enabled: false,
                    controller: controller,

                    style: TextStyle(
                        fontSize: 18,
                        height: 1,
                        color: Colors.black
                    ),


                    decoration: InputDecoration(
                      labelText: field.label ?? 'عنوان',
                      border:InputBorder.none,
                      // hintText: '0913xxxxxxx'
                    ),
                    // onChanged:(val){
                    //   forma.currentState.setAttributeValue(name, val);
                    // },

                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}