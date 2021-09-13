import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';
import 'package:flutter_galleyapp/Screens/AudioScreens.dart';
import 'package:flutter_galleyapp/Screens/ImageScreens.dart';
import 'package:flutter_galleyapp/Screens/VideoScreens.dart';

import 'LoginScreen.dart';

class HomePageScreens extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
         home: SafeArea(
             child: DefaultTabController(
                 length: 3,
               child: Scaffold(

                   appBar: AppBar(
                     title: Text("My Gallery ",style: TextStyle(color: mainblue),),
                     actions: <Widget>[
                       Container(
                         margin: EdgeInsets.only(right: 10),
                         child: GestureDetector(

                         onTap: () {
                           remove();
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));
                         },
                             child: Icon(
                                  CupertinoIcons.power,color: mainblue,
                          ),
                         ),
                       )
                     ],
                     backgroundColor: maincolor,
                       bottom: TabBar(
                         indicatorColor: mainblue,
                         labelColor: Colors.black,
                         unselectedLabelColor: Colors.grey,
                           tabs: [
                               Tab(icon: Icon(Icons.audiotrack,color: maingreen,),text:"Image",),
                               Tab(icon: Icon(Icons.audiotrack,color: maingreen,),text: "Video",),
                               Tab(icon: Icon(Icons.audiotrack,color: maingreen,),text: "Audio",)
                           ],
                       ),
                   ),
                 body:


                 TabBarView(
                     children: [
                         ImageScreens(),
                         VideoScreens(),
                         AudioScreens(),
                     ],

                 ),
               ),

             ),
         ),
    );
  }
}
remove() async {
  await loginScreen.init();
  prefs.remove('username');
}

