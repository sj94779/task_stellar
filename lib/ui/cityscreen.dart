import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/provider.dart';
import 'locatiionscreen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _selectedCity = "Mumbai";
  var city = {
    'Mumbai': 'MU',
    'Pune': 'PU',
    'Nashik': 'NA',
    'Bangalore': 'BA',
  };

  List _countries = [];
  CountryDependentDropDown() {
    city.forEach((key, value) {
      _countries.add(key);
    });
  }

  List _states = [];

  @override
  void initState() {
    super.initState();
    CountryDependentDropDown();
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<TodosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A237E),
        title: Text(
          "Select your job city",
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
                    value: _selectedCity,
                    onChanged: (newValue) {
                      setState(() {
                        _states = [];

                        myProvider
                            .updateCityShortName(city[newValue].toString());
                        _selectedCity = "$newValue";
                      });
                      myProvider.updateJobCity(_selectedCity);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                    },
                    items: _countries.map((city) {
                      return DropdownMenuItem(
                        child: new Text(city,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        value: city,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
