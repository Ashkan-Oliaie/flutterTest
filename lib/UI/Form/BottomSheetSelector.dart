import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mosharekatha_flutter/UI/Form/Forma.dart';
import 'package:mosharekatha_flutter/UI/Touchables/Pressable.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';


var controller = TextEditingController();

class BottomSheetSelector extends HookWidget {


  BottomSheetSelector({this.forma,this.field,this.direction});

  var forma;
  Field field;
  String direction;



  @override
  Widget build(BuildContext context) {

    final counter = useState(2);

    useEffect(() {

      return () => {};
    }, [counter]);


    renderItem(i){
      return Pressable(
        onPress:(){

          controller.text=field.selectiveData[i].caption;
          forma.currentState.setAttributeValue(field.name, field.selectiveData[i].id);
          Navigator.pop(context);

        },
        width:100,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border(left:BorderSide(color:Colors.grey.shade400))
          ),
          child: Center(child: Typo(text:field.selectiveData[i].caption ,))
        ),
      );
    }




    return Container(
      margin: EdgeInsets.only(top:10),
      child: Material(
        elevation:6,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white70,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: (){
            showMaterialModalBottomSheet(
              context: context,
              builder: (context, scrollController) => Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: direction=='horizontal' ? Axis.horizontal : Axis.vertical,
                    itemCount: field.selectiveData.length,
                    itemBuilder: (context, index) {
                      return renderItem(index);
                    },
              ),
            ));
            // Navigator.pushNamed(context, '/selectScreen', arguments: {"data":field.selectiveData,'onSelect':(item,cont){
            //   Navigator.pop(cont);
            //   // value.value=item.caption;
            //   controller.text = item.caption;
            //   forma.currentState.setAttributeValue(field.name, item.id);
            // }
            // });
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