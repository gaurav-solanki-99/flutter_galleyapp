import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';
import 'package:flutter_galleyapp/Screens/HomePageScreens.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class registerScreen  extends StatefulWidget {
  @override
  State<registerScreen> createState() => _registerScreenState();


}

class _registerScreenState extends State<registerScreen> {

  String? username;
  String?  password;


  Future<dynamic> sendData(String? username, String? password) async
  {
       var res = await http.post(Uri.parse("https://reqres.in/api/users?name"+"username"+"&job="+"password"));

       print(res.statusCode);


       if(res.statusCode==201)
         {

           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreens()));

         }

       print(res.body);
        return res;




  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                          "Sign Up",
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
                            onChanged: (password)
                            {
                              this.password=password;
                            },
                          ),
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

                            FutureBuilder(
                              future: sendData(username,password),
                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                              {
                                print(snapshot.error.toString());

                                if(snapshot.hasError)
                                {

                                  return Center(
                                    child: Text("Error in snapshot"),

                                  );
                                }
                                else if(snapshot.hasData)
                                {
                                  print(snapshot.data);
                                  return Center(
                                    child: Text("Data Save Success fully"),
                                  );
                                }
                                return  Center(
                                  child: CircularProgressIndicator(),
                                );

                              },
                             );

                          },
                          child:  Text(
                            "Sign Up", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                      Text("Already  have an account,"),
                      Text(
                        "Log in",
                        style: TextStyle(
                            color: mainblue, fontWeight: FontWeight.bold),
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
