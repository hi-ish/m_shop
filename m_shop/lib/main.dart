import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MShop());
}  

class MShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'm-Shop',
        debugShowCheckedModeBanner: false, //remove the debug banner
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Container(
            height: 150.0,
            width: 150.0,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/splash.png'),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.rectangle,
            ),  
          ), 
        ),
      ),
    );
  }
}