import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/provider.dart';
import 'loginscreen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _selectedLocation = "Kandivali";
  var state = {
    'Kandivali': 'MU',
    'Goregoan': 'MU',
    'Sakinaka': 'MU',
    'Shivaji Nagar': 'PU',
    'Kothrud':'PU',
    'Kalyani Nagar': 'PU',
    'Jagtap Nagar': 'NA',
    'Kartikey Nagar': 'NA',
    'Hirawadi':'NA',
    'Basavanagudi': 'BA',
    'Jayanagar' : 'BA',
    'Malleshwaram':'BA'
  };

  List _states = [];
  StateDependentDropDown(countryShortName) {
    state.forEach((key, value) {
      if (countryShortName == value) {
        _states.add(key);
      }
    });
    _selectedLocation = _states[0];
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<TodosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        title: Text(
          "Select your job location",

          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 23,
              ),
              SizedBox(
                height: 23,
              ),
              SizedBox(
                height: 23,
              ),

              Container(
                width: 400,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = "$newValue";
                      });
                      myProvider.updateJobLocation(_selectedLocation);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    items: _states.map((country) {
                      return DropdownMenuItem(
                        child: new Text(country,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        value: country,
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void refreshData() {
    final myProvider = Provider.of<TodosProvider>(context, listen: false);
    String selectedCountry = myProvider.updatedcityShortName;
    StateDependentDropDown(selectedCountry);
  }
}
