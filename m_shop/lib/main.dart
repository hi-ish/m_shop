import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:m_shop/Counters/cartitemcounter.dart';
import 'package:m_shop/Counters/changeAddresss.dart';
import 'package:m_shop/Counters/itemQuantity.dart';
import 'package:m_shop/Counters/totalMoney.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/authenication.dart';
import 'package:m_shop/Config/config.dart';
import 'Store/storehome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EcommerceApp.auth = FirebaseAuth.instance;
  EcommerceApp.sharedPreferences = await SharedPreferences.getInstance();
  EcommerceApp.firestore = Firestore.instance;

  runApp(MShop());
}

class MShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => CartItemCounter()),
        ChangeNotifierProvider(create: (c) => ItemQuantity()),
        ChangeNotifierProvider(create: (c) => AddressChanger()),
        ChangeNotifierProvider(create: (c) => TotalAmount()),
      ],
      child: MaterialApp(
        title: 'm-Shop',
        debugShowCheckedModeBanner: false, //remove the debug banner
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  //state before running the widgets
  void initState() {
    super.initState();
    displaySplash();
  }

  //Splash screen
  displaySplash() {
    //Display Splash screen if user is not already logged in
    Timer(Duration(seconds: 3), () async {
      if (await EcommerceApp.auth.currentUser() != null) {
        Route route = MaterialPageRoute(builder: (_) => StoreHome());
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (_) => AuthenticScreen());
        Navigator.pushReplacement(context, route);
      }
    });
  }

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
