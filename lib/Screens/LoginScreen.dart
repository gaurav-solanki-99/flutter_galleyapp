
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';
import 'package:flutter_galleyapp/Screens/HomePageScreens.dart';

import 'dart:developer';
import 'RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



late SharedPreferences prefs;
class loginScreen extends StatefulWidget {



  static Future init() async {
     prefs = await SharedPreferences.getInstance();
  }

  @override
  State<loginScreen> createState() => _loginScreenState();


}

class _loginScreenState extends State<loginScreen> {

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('not connected'); // show dialog
      }
    });

  }

  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Internet needed!"),
        content: Text("You may want to exit the app here"),
        actions: <Widget>[FlatButton(child: Text("EXIT"), onPressed: () {})],
      ),
    );
  }



  String? username;

   String?  password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(150))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 45),
                        child: Icon(
                          Icons.person,
                          color: mainblue,
                          size: 90,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: maingreen,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ), // header
                Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter username',
                              contentPadding: EdgeInsets.all(10.0),
                              prefixIcon: Icon(
                                Icons.person,
                                color: mainblue,
                              ),

                            ),
                            onChanged: (username){
                                print("User name is $username");
                                this.username=username;
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                        height: 50,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: TextField(

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter password',
                              contentPadding: EdgeInsets.all(10.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: mainblue,
                              ),
                            ),
                            obscureText: true,
                            onChanged: (password){
                              print("This is password");
                               this.password=password;
                            },

                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30, top: 10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password ?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 25, right: 25, top: 60),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [maingreen, maincolor]),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),

                        child: FlatButton(
                          onPressed: () {
                            save(username!,password!);
                            //prefs!.setString('username', this.username);
                          //  prefs!.setString('password', this.username);
                            //String  myusername = prefs!.getString('username');
                            //String  mypassword  = prefs!.getString('password');
                              print("username => $username password $password");
                            //print("myusername => $myusername mypassword $mypassword");
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreens()));
                          },
                          child:  Text(
                             "Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ),

                      )
                    ],
                  ),
                ), // Form
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account,"),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registerScreen()));
                        },
                        child:  Text(
                          "Sign Up",
                          style: TextStyle(
                              color: mainblue, fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}




save(String username,String password) async {
  await loginScreen.init();



  prefs.setString('username', username);
  prefs.setString('password', password);



  String  myusername = prefs.getString('username');
  String  mypassword = prefs.getString('password');
  
  print("myusername  $myusername mypassword $mypassword");


}
