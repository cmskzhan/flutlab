import 'package:flutter/material.dart';
import 'coinData.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({ Key? key }) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedValue = currenciesList[5];

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var i in currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(child: Text(i), value: i);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<Widget> getCupertinoPickerItems() {
    List<Widget> pickerItems = [];
    for (String i in currenciesList) {
      Widget newItem = Text(i);
      pickerItems.add(newItem);
    }
    return pickerItems;
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
            child: CupertinoPicker(
              itemExtent: 32, 
              onSelectedItemChanged: (selectedValue) {
                print(selectedValue);
            },
              children: getCupertinoPickerItems(),
            ),
          )
        ],
      ),
    );
  }
}