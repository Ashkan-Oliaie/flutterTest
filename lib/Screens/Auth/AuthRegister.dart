import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:mosharekatha_flutter/Network/Dio.dart';
import 'package:mosharekatha_flutter/Network/Posta.dart';
import 'file:///C:/Users/Ashlix/IdeaProjects/mosharekatha_flutter/lib/UI/Touchables/Touchable.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';
import 'package:flutter_appauth/flutter_appauth.dart';


class AuthRegister extends HookWidget {

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  // AuthRegister({Key key});


  final FlutterAppAuth appAuth = FlutterAppAuth();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: Typo(text:'ثبت نام'),
        ),
        body:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Column(
                 children: [
                   Typo(text:'با وارد کردن شماره تلفن وارد شوید',bold: true,),
                   FormBuilder(

                     key: _fbKey,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:[

                         Material(
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
                                     labelText: "کدملی",
                                     border:InputBorder.none,
                                     // hintText: '0913xxxxxxx'
                                 ),
                                 onChanged:(val){
                                   _fbKey.currentState.setAttributeValue('username', val);
                                 },
                                 attribute: 'username',
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
              Column(
                children: [
                  Touchable(
                    caption:'ثبت نام',
                    onPress:(){
                      var form=_fbKey.currentState.value;
                      print(form['username']);
                      if (_fbKey.currentState.validate()) {
                        posta(data:{} ,
                            url:'/api/account/CheckUsername?username=${form['username']}',
                            onSuccess: (res){

                              Navigator.pushNamed(context, '/register',arguments: {'username':form['username']});
                            });

                      }
                    },
                  ),
                  Touchable(
                    caption:'ورود',
                    onPress:() async {
                      final  result = await appAuth.authorizeAndExchangeCode(
                        AuthorizationTokenRequest(
                          'arc',
                          'com.mosharekatha://oauthredirect',
                          issuer: 'https://account.mosharekatha.ir',
                          allowInsecureConnections: true,
                          clientSecret: '1q2w3e*',
                          scopes:[
                            'profile',
                            'FullName',
                            'phone',
                            'NewsManagementService',
                            'BackendAdminAppGateway',
                            'openid',
                            'offline_access',
                          ],
                        ),
                      );
                    },
                  ),
                  Touchable(
                    caption:'loading',
                    onPress:() async {

                     showLoadingDialog();
                      
                      Future.delayed(Duration(seconds: 2),(){
                        hideLoadingDialog();
                      });



                    },
                  ),
                  Touchable(
                    caption:'News',
                    onPress:() async {

                      Navigator.pushNamed(context, '/news');



                    },
                  )
                ],
              )
              ],
            ))
    );

  }
}