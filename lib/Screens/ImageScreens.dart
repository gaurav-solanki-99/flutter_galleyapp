import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';

import 'BottomNavScreens.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageScreens  extends StatefulWidget {
  @override
  State<ImageScreens> createState() => _ImageScreensState();
}

class _ImageScreensState extends State<ImageScreens> {

  Future<dynamic> getData() async
  {
    var res = await  http.get(Uri.parse("https://gorest.co.in/public-api/users"));

    return jsonDecode(res.body);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,

          body:  Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 25),
              // ignore: deprecated_member_use
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BottomNavBar(),
                        ),
                            (route) => false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 100,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: maingreen,
                      ),
                      child: Text("Next Activity "),
                    ),

                  ),


                  FutureBuilder(
                      future: getData(),
                      builder: (context,AsyncSnapshot  snapshot)
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
                          return Flexible(child:  ListView.builder(
                             itemCount:snapshot.data.length,

                              itemBuilder: (BuildContext contex,int i)
                              {
                                return  Expanded(child:  Padding(padding: EdgeInsets.all(10),
                                    child: Card(
                                    elevation: 10,
                                    child:Container(
                                      color:maincolor,
                                      padding: EdgeInsets.all(10.0),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                               alignment: Alignment.centerLeft,
                                               child: Text(snapshot.data[i]['name'].toString())),
                                           Container(
                                              alignment: Alignment.centerLeft,
                                               child: Text(snapshot.data[i]['email'].toString())),
                                       Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(snapshot.data[i]['gender'].toString())),
                                          Container(
                                           alignment: Alignment.centerLeft,
                                          child: Text(
                                             snapshot.data[i]['status'].toString()),
                                        ),
                                        ],
                                      ),
                                    ),
                               ),
                              ));
                            }));
                        }
                        return  Center(
                          child: CircularProgressIndicator(),
                        );



                      }

                  )

                ],
              ),


            ),
        ),
    );


  }
}