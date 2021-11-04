import 'package:flutter/material.dart';
import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/registration.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);
  static const String id = 'welcome_screen'; 
  //static makes this property accessible at class level and can be called by classname.property directly without creating object

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{ //one Ticker only
  late AnimationController controller; 
  Animation? _animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5)); //vsync this particular object
    super.initState(); //Now we have ticker and controller, we need to know the start value of the animation
    controller.forward();

    _animation = ColorTween(begin: Colors.white, end: Colors.black).animate(controller);
    
    controller.addListener(() { setState(() {});  print(_animation!.value);});
  }

@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


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
                Hero(
                  tag: "logo",
                  child: Container(child: Image.asset('images/logo.png'),
                                   height: 60,),
                ),
                Text('Chats', style: TextStyle(color: _animation!.value, fontSize: 40, fontWeight: FontWeight.w900,),)
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
                  Navigator.pushNamed(context, LoginScreen.id);
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
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },),),
              ),
          ],
        ),
        
        ),
      
    );
  }
}