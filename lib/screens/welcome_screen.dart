import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(child: Image.asset('images/logo.png'),
                                 height: 60,),
                Text('Flash Chat', style: TextStyle(color: Colors.amber, fontSize: 45, fontWeight: FontWeight.w900,),)
              ],
            ),
            SizedBox(height: 48,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 5,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  child: Text("Login"),
                  onPressed: () {
                  //TODO go to login page
                },),),
              ),            
              Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 5,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  child: Text("Registrate"),
                  onPressed: () {
                  //TODO go to registrtion page
                },),),
              ),
          ],
        ),
        
        ),
      
    );
  }
}