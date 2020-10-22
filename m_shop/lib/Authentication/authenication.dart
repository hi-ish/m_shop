import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'M-Commerce App',
            style: TextStyle(
              fontSize: 55.0,
              color: Colors.white,
              fontFamily: 'Signatra',
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.white),
                text: 'Login',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white),
                text: 'Register',
              ),
            ],
            indicatorColor: Colors.orange,
          ),
        ),
        body: Container(
          child: TabBarView(children: [Login(), Register()]),
        ),
      ),
    );
  }
}
