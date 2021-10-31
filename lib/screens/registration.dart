import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(tag: "logo", child: Container(child: Image.asset('images/logo.png'), height: 200,)),
            SizedBox(height: 22,),
            TextField(decoration: InputDecoration(hintText: "Email Addr"),),
            SizedBox(height: 8,),
            TextField(decoration: InputDecoration(hintText: " Password "),),
            SizedBox(height: 22,),
            ElevatedButton(onPressed: () {
              //TODO implement registration function
            }, child: Text("Register"))


          ],
        ),
      ),
      
    );
  }
}