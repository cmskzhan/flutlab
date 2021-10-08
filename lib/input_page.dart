import 'package:flutter/material.dart';
import 'cardAndContainerTemplates.dart';
import 'customWidget.dart';
import 'result_page.dart';
import 'calculateResult.dart';

// might move below const to templates?

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
int initialTall = 180;
int initialHeavy = 50;
int initialAge = 21;
enum gender {male, female}

const labelTextStyle =  TextStyle(fontSize: 18, color: Colors.white30);

const boldNumberStyle = TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.w900);


class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool isMale = true;
  bool isFemale = false;
  List<bool> gender = [true, false]; // won't allow me to assign gender=[isMale, isFemale]
                                     // alternatively use initState to initialize gender list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Male",   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Female", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),),
                ],
                isSelected: gender,
                onPressed: (value) {
                  if (value == 0) { isMale = true; isFemale = false; print("male selected");}
                  else { isMale = false; isFemale = true;  print("female selected");}
                  setState(() {
                    gender = [isMale, isFemale];
                  });
                },)
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              c: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height", style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic, //bring unit down as subscriber, don't seem working
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(initialTall.toString(), style: boldNumberStyle),
                      Text('  cm', style: labelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      activeTrackColor: Colors.pink, // replace activeColor: Colors.pink down in slider attribute
                      inactiveTrackColor: Colors.grey // replace inactiveColor: Colors.grey down in slider attribute
                    ),
                    child: Slider(value: initialTall.toDouble(), min: 80, max: 240, // activeColor: Colors.pink, inactiveColor: Colors.grey,
                           onChanged: (double newTall) { setState(() { initialTall = newTall.floor(); print(newTall); });
                      } ),
                  ) ],
              ),),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: MyContainer(
                  c: activeCardColor,
                  cardChild: Column(
                    children: [
                      Text("WEIGHT", style: labelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(initialHeavy.toString(), style: boldNumberStyle,),
                          Text("  kg", style: labelTextStyle,),
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onTouch: () {print("custom button pressed plus");
                                          setState(() {
                                            initialHeavy++;
                                          });},
                            onLongTouch: () {setState(() {
                              initialHeavy=50;
                            });},
                            icon: Icons.add,
                            ),
                          SizedBox(width: 10,),
                            RoundIconButton(
                            onTouch: () {print("custom button pressed minus");
                                          setState(() {
                                            initialHeavy--;
                                          });
                                          },
                            icon: Icons.remove,
                            )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: MyContainer(
                  c: activeCardColor,
                  cardChild: Column(
                    children: [
                      Text("AGE", style: labelTextStyle,),
                      Text(initialAge.toString(), style: boldNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onTouch: (){ setState(() {
                              initialAge++;
                            });},
                            icon: Icons.add,),
                          SizedBox(width: 10,),
                          RoundIconButton(
                        onTouch: (){ setState(() {
                              initialAge--;
                            });},
                            icon: Icons.remove,)  
                        ],
                      ), 
                    ],
                  ),)),
              ],
            ),
          ),
          BottomSubmitButton(submitButtonText: "CALCULATE", 
                             onPress: () {
                               CalculateBMIresult calc = CalculateBMIresult(age: initialAge, tall: initialTall, weight: initialHeavy);
                               Navigator.push(context, MaterialPageRoute(builder: (context) {return ResultPage(
                                 bmiResult: calc.Calculate_BMI_score(),
                                 resultText: calc.Assessed_result(),
                                 longDescript: calc.FullText_result(),
                               );}));},)
        ],
      ),
      
    );
  }
}


