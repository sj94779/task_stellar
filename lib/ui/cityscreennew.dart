import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/model/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task/ui/LocationScreenNew.dart';

import '../provider/provider.dart';
import 'locatiionscreen.dart';

class CityScreenNew extends StatefulWidget {
  const CityScreenNew({ Key? key }) : super(key: key);

  @override
  _CityScreenNewState createState() => _CityScreenNewState();
}

class _CityScreenNewState extends State<CityScreenNew> {

  var city = {
  User('Mumbai'): 'MU',
  User('Pune'): 'PU',
  User('Nashik'): 'NA',
  User('Bangalore'): 'BA',
  };

 // List _users = [];
  List<User> _users = [];
  CountryDependentDropDown() {
    city.forEach((key, value) {
      _users.add(key);
    });
  }

  List<User> _foundedUsers = [];



  @override
  void initState() {

    super.initState();
    CountryDependentDropDown();
    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1A237E),
        title:
        Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey[850],),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[850]
                ),
                hintText: "Search job city"
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _foundedUsers.length > 0 ? ListView.builder(
            itemCount: _foundedUsers.length,
            itemBuilder: (context, index) {

              return
                userComponent(user: _foundedUsers[index]);
              // return Slidable(
              //   actionPane: SlidableDrawerActionPane(),
              //   actionExtentRatio: 0.25,
              //   child: userComponent(user: _foundedUsers[index]),
              //   actions: <Widget>[
              //     new IconSlideAction(
              //       caption: 'Archive',
              //       color: Colors.transparent,
              //       icon: Icons.archive,
              //
              //       onTap: () => print("archive"),
              //     ),
              //     new IconSlideAction(
              //       caption: 'Share',
              //       color: Colors.transparent,
              //       icon: Icons.share,
              //       onTap: () => print('Share'),
              //     ),
              //   ],
              //   secondaryActions: <Widget>[
              //     new IconSlideAction(
              //       caption: 'More',
              //       color: Colors.transparent,
              //       icon: Icons.more_horiz,
              //       onTap: () => print('More'),
              //     ),
              //     new IconSlideAction(
              //       caption: 'Delete',
              //       color: Colors.transparent,
              //       icon: Icons.delete,
              //       onTap: () => print('Delete'),
              //     ),
              //   ],
              // );
            }) : Center(child: Text("No such city found", style: TextStyle(color: Colors.black),)),
      ),
    );
  }

  userComponent({required User user}) {
    final myProvider = Provider.of<TodosProvider>(context);
    myProvider.updateJobCity(user.name);
    myProvider.updateCityShortName(city[user.name].toString());
    return
      Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child:
      GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w500,

                            )),

                        SizedBox(height: 5,),

                      ]
                  )
                ]
            ),

          ],
        ),


        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LocationScreenNew())),
      ),
    );
  }
}
