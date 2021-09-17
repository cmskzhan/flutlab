import 'package:flutter/material.dart';
import 'cardAndContainerTemplates.dart';

// might move below const to templates?
const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Colors.pink;
int initialTall = 180;
int initialHeavy = 50;
enum gender {male, female}

const labelTextStyle =  TextStyle(fontSize: 18, color: Colors.white30);

const boldNumberStyle = TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.w900);


class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

gender? tappedGender;

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
              children: [
                Expanded(child: MyContainer(
                  onPress: () {setState(() {
                    tappedGender=gender.female;
                    print("female pressed");
                  });},
                  c: tappedGender == gender.female ? activeCardColor : inactiveCardColor,
                  cardChild: GenderCard("Female", Icons.female),
                )),
                Expanded(child: MyContainer(
                  onPress: () {setState(() {
                    tappedGender=gender.male;
                    print("pressed male");
                  });},
                  c: tappedGender == gender.male ? activeCardColor : inactiveCardColor,
                  cardChild: GenderCard("Male", Icons.male_rounded),
                )),
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
                    textBaseline: TextBaseline.alphabetic, //bring unit down as subscriber
                    children: [
                      Text(initialTall.toString(), style: boldNumberStyle),
                      Text('cm', style: labelTextStyle,)
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
                      Text(initialHeavy.toString(), style: boldNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {print("weight plus pressed");},
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add, color: Colors.white10,),
                            ),
                          SizedBox(width: 10,),
                          FloatingActionButton(
                            onPressed: () {print("weight minus pressed");},
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add, color: Colors.white10,),
                            ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: MyContainer(c: Colors.blue)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            color: bottomContainerColor,
            height: bottomContainerHeight,
            width: double.infinity, //expand to the sides
          )
        ],
      ),
      
    );
  }
}
