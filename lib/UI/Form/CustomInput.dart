import 'package:flutter/material.dart';


class Texta extends StatelessWidget {

  Icon icon;
  String placeHolder;

  Texta(this.icon,this.placeHolder);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: (Material(
        elevation: 6,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.pinkAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: icon
            ),
            Container(
              decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),topRight:Radius.circular(10))),
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  
                    decoration: InputDecoration(
                        border:InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: placeHolder
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.only(
                      //         bottomRight: Radius.circular(10),
                      //         topRight: Radius.circular(10))
                      // )
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.pink)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
