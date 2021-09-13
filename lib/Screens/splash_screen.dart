import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';
import 'package:flutter_galleyapp/Screens/HomePageScreens.dart';
import 'package:flutter_galleyapp/Screens/LoginScreen.dart';





class SplashScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {



  @override
  Future<void> didChangeDependencies()  async {
    super.didChangeDependencies();
    await loginScreen.init();
    String  myString = prefs.getString('username') ?? '';
    bool a = myString.isNotEmpty;
   print("Current username $myString  $a");
    if(myString==null)
    {
      print("User not login");

    }
    else
    {
      print("User  login  $myString");

    }



    if(myString.isEmpty)
    {
      Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  loginScreen(),
              )
          )
      );
    }
    if(myString.isNotEmpty)
    {
      Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  HomePageScreens(),
              )
          )
      );
    }

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: maincolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Image.asset(
                'assets/images/appicons.png',
                height: 200,
                width: 200,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Version : 0.1",
                    style: TextStyle(fontSize: 10.0, color: Colors.black),

                  )),

            ],
          ),
        ),
      ),
    );
  }
}


