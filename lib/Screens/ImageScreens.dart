import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';

import 'BottomNavScreens.dart';

class ImageScreens  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          // ignore: deprecated_member_use
          child: FlatButton(
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

          )
      ),
    );
  }
}