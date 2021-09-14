import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galleyapp/Constats/ColorConstants.dart';


class AudioScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
           child: ListSearch(),
        ),
      ),
    );
  }
}
class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}
class ListSearchState extends State<ListSearch> {

TextEditingController _textController = TextEditingController();

static List<String> mainDataList = [
  "Apple",
  "Apricot",
  "Banana",
  "Blackberry",
  "Coconut",
  "Date",
  "Fig",
  "Gooseberry",
  "Grapes",
  "Lemon",
  "Litchi",
  "Mango",
  "Orange",
  "Papaya",
  "Peach",
  "Pineapple",
  "Pomegranate",
  "Starfruit"
];

// Copy Main List into New List.
//List<String> newDataList = List.from(mainDataList);
  late List<String> newDataList=[];
onItemChanged(String value) {
  setState(() {
    newDataList= mainDataList
        .where((string) => string.toLowerCase().contains(value.toLowerCase()))
        .toList();
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: <Widget>[
        Padding(

          padding: const EdgeInsets.only(top: 10.0),
          child: Container(

            padding:EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Here...',
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: mainblue,
                ),
              ),
              onChanged: onItemChanged,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(12.0),
            children: newDataList.map((data) {
              return ListTile(
                title: Text(data),
                onTap: ()=> print(data),);
            }).toList(),
          ),
        )
      ],
    ),
  );
}
}
