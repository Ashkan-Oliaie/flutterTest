import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class Item{
  String title;
  String price;

  Item({this.title,this.price});


}

List<Item> topRow =[
  Item(title: 'number1',price:'1200'),
  Item(title: 'number2',price:'12600'),
  Item(title: 'number3',price:'200'),
  Item(title: 'number3',price:'200'),
  Item(title: 'number3',price:'200'),
  Item(title: 'number3',price:'200'),
  Item(title: 'number3',price:'200'),
  Item(title: 'number3',price:'202'),
  Item(title: 'number3',price:'2030'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
  Item(title: 'number3',price:'20230'),
];

class Itema extends HookWidget {


  Item item;
  Itema({this.item});

  @override
  Widget build(BuildContext context) {




    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),

      height:100,
      child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        shadowColor: Colors.deepPurple,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item.title),
        ) ,
      ) ,
    );
  }
}

class TopItem extends HookWidget {


  String text;
  String text2;

  TopItem(this.text,this.text2);



  @override
  Widget build(BuildContext context) {


    return Container(
      // color:Colors.blueGrey,
      // margin: EdgeInsets.symmetric(horizontal:10),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation:5,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(text),
                  Text(text2)
                ],
              )
          ),
        ),
      ),
    );
  }
}


ScrollController controller=ScrollController();

class AnimatedShit extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // useAnimationController(duration: const Duration(seconds: 2));



    final toggle = useState(false);
    final topItemIndex = useState(0.0);

    //
    final Size size = MediaQuery.of(context).size;
    useEffect(() {
      controller.addListener(() {
        // print(controller.offset);

        double itemValue=controller.offset/100;
        // print(itemValue);

        topItemIndex.value=itemValue;

        toggle.value=controller.offset > 100 ;

        return(){
          controller.dispose();
        };
      });
    }, []);
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/t.jpg'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center
                )
            ),
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: toggle.value ? 0 : 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: Colors.white24,
                    width: size.width,
                    height: toggle.value ? 0 : 120 ,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                            TopItem('testa','item2'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: topRow.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx,index){

                        double init=1.0;
                        if(topItemIndex.value > 0.5){
                          init=index +0.5 - topItemIndex.value;
                          if(init < 0){
                            init=0;
                          }else if (init > 1){
                            init=1;
                          }

                        }

                        print(topRow[index].title);

                        return Opacity(
                          opacity: init,
                          child: Transform(
                            transform: Matrix4.identity()..scale(init,init),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                              // heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: Itema(item:topRow[index])
                            ),
                          ),
                        );
                      }),
                ),

              ],
            )
        )
    );
  }
}
