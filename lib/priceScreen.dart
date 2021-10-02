import 'package:flutter/material.dart';
import 'coinData.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({ Key? key }) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedValue = currenciesList[5];

  void getCurrenciesList () {
    for ( var i in currenciesList ){
      print(i);
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var i in currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(child: Text(i), value: i);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    getCurrenciesList();
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
            child: DropdownButton<String>(
              value: selectedValue, // has to be the value below
              items: getDropdownItems(),
              onChanged: (dropDownSelected) {
                setState(() {
                  selectedValue = dropDownSelected.toString();
                  print(selectedValue);
                });

              },
            ),
          )
        ],
      ),
    );
  }
}