import 'package:flutter/material.dart';
import 'cardAndContainerTemplates.dart';

class ResultPage extends StatelessWidget {
  
  final double bmiResult;
  final String resultText;
  final String longDescript;

  ResultPage({required this.bmiResult, required this.resultText, required this.longDescript});

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
                            Center(child: Text(resultText, style: TextStyle(color: Colors.lightGreen, fontSize: 22),)),
                            Center(child: Text(bmiResult.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 100))),
                            Center(child: Text(longDescript))
                          ],
            ),),
          ),
        BottomSubmitButton(submitButtonText: "Re-CALCULATE", onPress: () {Navigator.pop(context);})
        ],
      )
      
    );
  }
}