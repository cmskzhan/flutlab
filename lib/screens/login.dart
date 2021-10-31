import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Hero(tag: "logo",child: Container(height: 200, child: Image.asset('images/logo.png'),)),
          SizedBox(height: 22,),
          TextField(decoration: InputDecoration(hintText: "Email Addr"),),
          SizedBox(height: 8,),
          TextField(decoration: InputDecoration(hintText: " Password "),),
          SizedBox(height: 22,),
          ElevatedButton(onPressed: (){
            //TODO login function
          }, child: Text("Log in"))
        ],
      ),
      
      ),
      
    );
  }
}