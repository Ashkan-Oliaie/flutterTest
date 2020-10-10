import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:mosharekatha_flutter/UI/Touchables/Touchable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosharekatha_flutter/UI/Typo.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeMenuButton extends StatelessWidget {

  String title;
  var icon;
  var onPress;

  HomeMenuButton(this.title,this.icon,this.onPress);



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left:5,right:5),
        child: Card(
          elevation: 5,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            onTap: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Container(margin:EdgeInsets.only(top:20),child: Typo(text:title))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List imgList=[1,2,3,4,5];


class HomeScreen extends HookWidget {


  @override
  Widget build(BuildContext context) {

    final carouselIndex = useState(2);

    useEffect((){
      //todo do something here later
      return ()=>{};
    });

    useEffect(() {
      print('fafa');
      return () => {};
    }, []);




    return Scaffold(
      // appBar: AppBar(
      //   title:Text('خانه'),
      //   centerTitle: true,
      // ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
             flex:2,
             child: ColumnSuper(
               innerDistance: -40,
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height*2/7,
                   width:MediaQuery.of(context).size.width,
                   color: Colors.blueGrey,
                   child: Center(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Typo(text: 'برای جستجوی مدرسه مورد نظر خود کلیک کنید',size:17,bold:true),
                           IconButton(icon: Icon(Icons.archive,color:Colors.black,),)
                         ],
                       )
                   ),
                 ),
                 Container(
                   // margin: EdgeInsets.symmetric(vertical:10),
                   child: ColumnSuper(
                     innerDistance: -40,
                     children: [
                       CarouselSlider(
                         options: CarouselOptions(
                             height:180,
                             autoPlay: true,
                             onPageChanged: (index, reason) {
                               carouselIndex.value=index;
                             }
                         ),
                         items: imgList.map((i) {
                           return Builder(
                             builder: (BuildContext context) {
                               return Container(
                                   width: MediaQuery.of(context).size.width,
                                   margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                                   decoration: BoxDecoration(
                                       color: Colors.amber,
                                       borderRadius:BorderRadius.all(Radius.circular(20))
                                   ),
                                   child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                               );
                             },
                           );
                         }).toList(),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: imgList.map((r) {
                           int index = imgList.indexOf(r);
                           return Container(
                             width: 8.0,
                             height: 8.0,
                             margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: carouselIndex.value == index
                                   ? Color.fromRGBO(0, 0, 0, 0.9)
                                   : Color.fromRGBO(0, 200, 122, 0.8),
                             ),
                           );
                         }).toList(),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
            Expanded(
              flex:2,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex:1,
                        // height: 100,
                        // margin:EdgeInsets.only(left:5,right:5),
                        // decoration: BoxDecoration(
                        //   color: Colors.blueGrey
                        // ),
                        child:Row(
                          children: [
                            HomeMenuButton('اخبار',SvgPicture.asset('images/Artboard – 1.svg',width:35,height:35,),(){}),
                            HomeMenuButton('اطلاعیه ها',SvgPicture.asset('images/Artboard – 2.svg',width:35,height:35,),(){}),
                            HomeMenuButton('شکایات',SvgPicture.asset('images/Artboard – 3.svg',width:35,height:35,),(){}),
                          ],
                        )
                    ),
                    Expanded(
                      flex:1,
                        // height: 100,
                        // margin:EdgeInsets.only(left:5,right:5),
                        // decoration: BoxDecoration(
                        //   color: Colors.blueGrey
                        // ),

                        child:Row(
                          children: [
                            HomeMenuButton('دانش آموز من',SvgPicture.asset('images/Artboard – 4.svg',width:35,height:35,),(){}),
                            HomeMenuButton('اخبار',SvgPicture.asset('images/Artboard – 5.svg',width:35,height:35,),(){}),
                            HomeMenuButton('استعلام شهریه',SvgPicture.asset('images/Artboard – 6.svg',width:35,height:35,),(){}),
                          ],
                        )
                    ),
                    Expanded(
                      flex:1,
                        // height: 100,
                        // margin:EdgeInsets.only(left:5,right:5),
                        // decoration: BoxDecoration(
                        //   color: Colors.blueGrey
                        // ),
                        child:Row(
                          children: [
                            HomeMenuButton('درباره ما',SvgPicture.asset('images/Artboard – 7.svg',width:35,height:35,),(){}),
                            HomeMenuButton('نظرسنجی',SvgPicture.asset('images/Artboard – 8.svg',width:35,height:35,),(){}),
                            HomeMenuButton('تنظیمات',SvgPicture.asset('images/Artboard – 9.svg',width:35,height:35,),(){}),
                          ],
                        )
                    ),

                  ],
                ),
              ),
            )

            // Typo(duration.toString(),true),

            // Typo(text: counter.value.toString(),bold:true,color:Colors.teal),

          ],
        )
      )
    );
  }
}