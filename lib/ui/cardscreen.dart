import 'package:flutter/material.dart';
import 'package:task/widgets/CardWidget.dart';

import '../main.dart';
import '../widgets/todo_list_widget.dart';
import 'loginscreen.dart';

class cardscreen extends StatefulWidget {
  const cardscreen({Key? key}) : super(key: key);

  @override
  State<cardscreen> createState() => _cardscreenState();
}

class _cardscreenState extends State<cardscreen> {
  // List<Map> categories = [
  //   {'name': 'All', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'My', 'iconPath': 'assets/background.png'},
  //   {'name': 'Anxious', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'Kids', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'Sleep', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'All', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'My', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'Anxious', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'Kids', 'iconPath': 'assets/welcome.png'},
  //   {'name': 'Sleep', 'iconPath': 'assets/welcome.png'},
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: 
        Column(
          children: [
            SizedBox(
              height: 4,
            ),
            Text(
              "Choose Your Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "You have to choose atleast one category",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),

                TodoListWidget(),



            Expanded(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: Color(0xFF1A237E),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 42,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[850],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey[850]),
                            hintText: "Search"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      child: CardWidget(),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        color: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
