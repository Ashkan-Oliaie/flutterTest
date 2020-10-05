import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Form/BottomSheetSelector.dart';
import 'package:mosharekatha_flutter/UI/Form/SelectScreenItem.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:persian_fonts/persian_fonts.dart';



class Field{
  String name;
  String type;
  String label;
  List selectiveData;
  Function onSelect;
  String value;

  Field({this.name,this.type,this.label,this.selectiveData,this.onSelect,this.value});
}



class localState {
  int counter = 0;


  localState(
      {this.counter = 0,
      });

  localState set(
      {int counter = 0,
       }) {

    return localState(
      counter: counter ?? this.counter,

    );
  }
}

class Increment{
  final int counter;

  Increment({this.counter});
}

reducer(state, action) {
  if (action is Increment) {
    return localState(
        counter: state.counter + action.counter);
  }

  return state;
}


class Forma extends HookWidget {

  // final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  List<Field> fields;
  GlobalKey<FormBuilderState> keya;

  Forma({this.fields,this.keya});



  @override
  Widget build(BuildContext context) {

    final store = useReducer(reducer, initialState: localState());


    useEffect(() {

      fields.forEach((element) {

      });

      return () => {};
    }, [fields]);




    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Typo(text:'با وارد کردن شماره تلفن وارد شوید',bold: true,),
                FormBuilder(
                  initialValue: {'category':'ff'},
                  key: keya,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: fields.map((f){
                      switch (f.type){

                        case 'text':
                          return  Container(
                            margin: EdgeInsets.only(top:10),
                            child: Material(
                              elevation:6,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white70,
                              child: Container(

                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.only(right:15,left:15),
                                  child: FormBuilderTextField(
                                    style: TextStyle(
                                        fontSize: 18,
                                        height: 1,
                                        color: Colors.black
                                    ),
                                    validators: [
                                      // FormBuilderValidators.maxLength(11,errorText:'شماره تلفن اشتباه است'),
                                      // FormBuilderValidators.minLength(11,errorText:'شماره تلفن اشتباه است'),
                                    ],
                                    decoration: InputDecoration(
                                      labelText: f.label ?? 'عنوان',
                                      border:InputBorder.none,
                                      // hintText: '0913xxxxxxx'
                                    ),
                                    onChanged:(val){
                                      keya.currentState.setAttributeValue(f.name, val);
                                    },
                                    attribute: 'username',
                                  ),
                                ),
                              ),
                            ),
                          );

                        case 'dropdown':
                          return  Container(
                            margin: EdgeInsets.only(top:10),
                            child: Material(
                              elevation:6,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white70,
                              child: Container(
                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.only(right:15,left:15),
                                  child: FormBuilderDropdown(
                                    style: TextStyle(
                                        fontSize: 20,
                                        height: 1,
                                        color: Colors.black,

                                      fontFamily: PersianFonts.Vazir.fontFamily

                                    ),
                                    attribute: "gender",
                                    decoration: InputDecoration(labelText: f.label, border:InputBorder.none,),
                                    // initialValue: 'Male',
                                    hint: Typo(text:'جنسیت را انتخاب کنید'),
                                    validators: [FormBuilderValidators.required()],
                                    items:f.selectiveData
                                        .map((gender) =>
                                        DropdownMenuItem(
                                            onTap:(){
                                              keya.currentState.setAttributeValue(f.name, gender.id);
                                              f.onSelect(gender);
                                            } ,
                                            value: gender.id,
                                            child:Typo(text:gender.caption)
                                        )
                                    ).toList(),
                                  ),

                                ),
                              ),
                            ),
                          );

                        case 'selectScreen':
                          return  SelectScreenItem(field:f,forma:keya,);

                        case 'bottomSheet':
                          return  BottomSheetSelector(field:f,forma:keya,direction:'horizontal');

                      }}).toList(),

                  ),
                ),
              ],
            ),
            Touchable(
              caption:'ثبت نام',
              onPress:(){
                var form=keya.currentState.value;

                if (keya.currentState.validate()) {
                  print(form);
                 // onSubmit();

                }
              },
            )
          ],
        ));


  }
}