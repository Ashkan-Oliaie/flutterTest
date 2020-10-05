import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Form/Forma.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';





class localState {
  List<Field> fields = [];

  localState(
      {this.fields,
      });

  localState set(
      {
        List<Field> fields,
       }) {

    return localState(
      fields: fields ?? this.fields,

    );
  }
}

class AddField{
  Field field;

  AddField({this.field});
}

class RemoveField{
  String fieldName;

  RemoveField({this.fieldName});
}

class EditField{
  Field field;

  EditField({this.field});
}

class SetFields{
  List <Field> fields;

  SetFields({this.fields});
}


reducer(state, action) {

  if (action is SetFields) {
    return localState(fields:action.fields);
  }else if(action is AddField){
    var newFields=state.fields;
    newFields.add(action.field);
    return localState(fields:newFields);
  }else if (action is RemoveField){
    var newFields=state.fields;
    newFields.removeWhere((item)=>item.name==action.fieldName);
    return localState(fields:newFields);
  }


  return state;
}




class Gender{
  int id;
  String caption;

  Gender(this.id,this.caption);
}

class Category{
  int id;
  String caption;

  Category(this.id,this.caption);
}


class CustomColor{
  int id;
  String caption;

  CustomColor(this.id,this.caption);
}





class AuthReg extends HookWidget {

  final GlobalKey<FormBuilderState> formaKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {

    final store = useReducer(reducer, initialState: localState(fields:[]));




    useEffect(() {
      store.dispatch(SetFields(fields:[
        Field(name:'mobile',value:'',type:'text',label:'موبایل'),
        Field(name:'category',value:'',type:'selectScreen',label:'دسته بندی',selectiveData:[Category(0,'کتاب'),Category(1,'دفتر'),Category(2,'قلم')]),
        Field(name:'gender',value:'',type:'dropdown',label:'جنسیت',selectiveData:[Gender(0,'پسرانه'),Gender(1,'دخترانه'),Gender(2,'مختلط')],
            onSelect:(gender){
          print(gender.id);
          if(gender.id==1){
            store.dispatch(AddField(field:Field(name:'shoe number',type:'text',label:'شماره کفش'),));
          }else{
            store.dispatch(RemoveField(fieldName:'shoe number'));
          }
            }
        ),
        Field(name:'bottom',type:'bottomSheet',label:'رنگ',selectiveData: [CustomColor(0,'کتاب'),CustomColor(1,'دفتر'),CustomColor(2,'قلم'),CustomColor(3,'کتاب'),CustomColor(4,'دفتر'),CustomColor(5,'قلم')])
      ]));
      return () => {};
    }, []);


    return Scaffold(
      appBar: AppBar(
        title:Text('reducer content'),
        centerTitle: true,
      ),
      body:Container(
        child:Forma(fields:store.state.fields,keya:formaKey)
      )
    );
  }
}