import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/model/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../provider/provider.dart';
import 'locatiionscreen.dart';
import 'loginscreen.dart';

class LocationScreenNew extends StatefulWidget {
  const LocationScreenNew({ Key? key }) : super(key: key);

  @override
  _LocationScreenNewState createState() => _LocationScreenNewState();
}

class _LocationScreenNewState extends State<LocationScreenNew> {
 // String _selectedLocation = "Kandivali";
  var state = {
    User('Kandivali'): 'MU',
  User('Goregoan'): 'MU',
  User('Sakinaka'): 'MU',
  User('Shivaji Nagar'): 'PU',
  User('Kothrud'):'PU',
  User('Kalyani Nagar'): 'PU',
  User('Jagtap Nagar'): 'NA',
  User('Kartikey Nagar'): 'NA',
  User('Hirawadi'):'NA',
  User('Basavanagudi'): 'BA',
  User('Jayanagar') : 'BA',
  User('Malleshwaram'):'BA'
  };

 // List _states = [];
  List<User> _users = [];
  StateDependentDropDown(countryShortName) {
    state.forEach((key, value) {
      if (countryShortName == value) {
        _users.add(key);
      }
    });
  //  _selectedLocation = _users[0].name;
  }

  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
    refreshData();
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
                hintText: "Search job location"
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
            }) : Center(child: Text("No such location found", style: TextStyle(color: Colors.black),)),
      ),
    );
  }

  userComponent({required User user}) {
    final myProvider = Provider.of<TodosProvider>(context);
    myProvider.updateJobLocation(user.name);

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
                    // Container(
                    //     width: 60,
                    //     height: 60,
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(50),
                    //      // child: Image.network(user.image),
                    //     )
                    // ),
                    // SizedBox(width: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name,
                              style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w500,

                              )),

                          SizedBox(height: 5,),
                          //   Text(user.username, style: TextStyle(color: Colors.black)),
                        ]
                    )
                  ]
              ),

            ],
          ),


          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen())),
        ),
      );
  }

  void refreshData() {
    final myProvider = Provider.of<TodosProvider>(context, listen: false);
    String selectedCountry = myProvider.updatedcityShortName;
    StateDependentDropDown(selectedCountry);
  }
}
