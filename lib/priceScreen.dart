import 'package:flutter/material.dart';
import 'coinData.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; //only use Platform, as oppose to hide

class PriceScreen extends StatefulWidget {
  const PriceScreen({ Key? key }) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedValue = currenciesList[5];

  DropdownButton<String> androidDropDown(List<String>  itemz) {
    List<DropdownMenuItem<String>> dropdownItems  = [];
    for (var i in itemz) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(child: Text(i), value: i);
      dropdownItems.add(newItem);
    }
    return DropdownButton<String> (
      value: selectedValue,
      items: dropdownItems,
      onChanged: (dropdownSelected){
        setState(() {
          selectedValue = dropdownSelected.toString();
        });
        print(selectedValue);
      }
      );
  }


  CupertinoPicker iOSPicker(List<String> itemz) {
    List<Widget> pickerItems = [];
    for (String i in itemz) {
      Widget newItem = Text(i);
      pickerItems.add(newItem);
    }
    return CupertinoPicker(
              itemExtent: 32, 
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
            },
              children: pickerItems,
              scrollController: FixedExtentScrollController(initialItem: 5), //initialItem
            );
  }

  Widget getPicker(){ //Platform.isIOS?true:false
    if (Platform.isIOS)
    {return iOSPicker(currenciesList);}
    else if (Platform.isAndroid)
    {return androidDropDown(currenciesList);}
    return androidDropDown(currenciesList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Coins Ticker'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Card(
            color: Colors.lightBlueAccent, elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(padding: EdgeInsets.symmetric(
              vertical: 15, horizontal: 28),
              child: Text('1BTC = ? USD', style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center,),),
            ),),
          
          Container(
            height: 150,
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: Platform.isIOS?iOSPicker(currenciesList):androidDropDown(currenciesList)
          )
        ],
      ),
    );
  }
}