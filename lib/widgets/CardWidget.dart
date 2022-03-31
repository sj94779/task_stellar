import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/horizontalImageList.dart';
import '../provider/provider.dart';

class CardWidget extends StatelessWidget {
  List data = [
    {'name': 'Business Development', 'iconPath': 'assets/welcome.png'},
    {'name': 'Telecaller/BPO', 'iconPath': 'assets/background.png'},
    {'name': 'Graphic Designer', 'iconPath': 'assets/background.png'},
    {'name': 'Technology', 'iconPath': 'assets/background.png'},
    {'name': 'Telecaller/BPO', 'iconPath': 'assets/welcome.png'},
    {'name': 'Telecaller/BPO', 'iconPath': 'assets/welcome.png'},



  ];

  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 430,
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            height: 30,
                            width: 30,
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: IconButton(
                              color: Colors.grey,
                              iconSize: 10,
                              icon: Icon(Icons.check),
                              onPressed: () {
                                final horizontalimageitem = HorizontalImageList(
                                    data[index]["iconPath"]
                                );
                                final myProvider = Provider.of<TodosProvider>(context,listen: false );
                                myProvider.addTodo(horizontalimageitem);
                              },
                            ),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        child: Image(
                          image: AssetImage(data[index]["iconPath"]),
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                        child: Text(
                          data[index]["name"],
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
