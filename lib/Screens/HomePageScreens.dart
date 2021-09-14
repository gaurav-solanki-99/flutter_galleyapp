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
                     iconTheme: IconThemeData(color: Colors.green),
                     title: Text("My Gallery ",style: TextStyle(color: mainblue),),
                     actions: <Widget>[
                       Container(
                         margin: EdgeInsets.only(right: 10),
                         // ignore: deprecated_member_use
                         child: FlatButton(onPressed: () {
                           return showAlertDialog(context);

                         },
                           child: Icon( CupertinoIcons.power,color: mainblue,),

                         ),
                         // child: GestureDetector(
                         //
                         // onTap: ()
                         //   {
                         //   remove();
                         //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));
                         //   },
                         //     child: Icon(
                         //          CupertinoIcons.power,color: mainblue,
                         //  ),
                         // ),
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
                 body: TabBarView(
                     children: [
                         ImageScreens(),
                         VideoScreens(),
                         AudioScreens(),
                     ],

                 ),

                 drawer: Drawer(
                   child: ListView(
                     // Important: Remove any padding from the ListView.
                     padding: EdgeInsets.zero,
                     children: <Widget>[
                       UserAccountsDrawerHeader(
                         accountName: Text("Gaurav Solanki"),
                         accountEmail: Text("gaurav@gmail.com"),
                         currentAccountPicture: CircleAvatar(
                           backgroundColor: Colors.orange,
                           child: Text(
                             "G",
                             style: TextStyle(fontSize: 40.0),
                           ),
                         ),
                       ),
                       ListTile(
                         leading: Icon(Icons.home), title: Text("Home"),
                         onTap: () {
                           Navigator.pop(context);
                         },
                       ),
                       ListTile(
                         leading: Icon(Icons.settings), title: Text("Settings"),
                         onTap: () {
                           Navigator.pop(context);
                         },
                       ),
                       ListTile(
                         leading: Icon(Icons.contacts), title: Text("Contact Us"),
                         onTap: () {
                           Navigator.pop(context);
                         },
                       ),
                     ],
                   ),
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

showAlertDialog(BuildContext context) {
  // set up the button

  Widget cancelButton = FlatButton(
    child: Text("yes"),
    onPressed:  () {
        remove();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => loginScreen(),
          ),
              (route) => false,
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));
    },

  );
  Widget continueButton = FlatButton(
    child: Text("No"),
    onPressed:  () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Log-out"),
    content: Text("Are you want to logout "),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
