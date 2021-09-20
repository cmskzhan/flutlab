import 'package:flutter/material.dart';
import 'cardAndContainerTemplates.dart';

class ResultPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculation Result"),),
      body: Column(
        children: [
          Text("your result", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),),
          Expanded(
            child: MyContainer(c: activeCardColor, 
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(child: Text("Normal", style: TextStyle(color: Colors.lightGreen, fontSize: 22),)),
                            Center(child: Text('18.3', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 100))),
                            Center(child: Text("Your BMI result is low, eat more"))
                          ],
            ),),
          )

        ],
      )
      
    );
  }
}