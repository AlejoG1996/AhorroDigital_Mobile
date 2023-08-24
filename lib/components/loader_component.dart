import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  final String text;
  LoaderComponent({this.text = ''});

  @override
  Widget build(BuildContext context) {
   return Center(
      child: Container(
        width: 290,
        height: 220,
        decoration: BoxDecoration(
          color: Color.fromARGB(188, 0, 0, 0),
          
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator( color: Color(0xff229954),),
            SizedBox(height: 20, width: 80,),
            Text(text, style: TextStyle(fontSize: 20, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
