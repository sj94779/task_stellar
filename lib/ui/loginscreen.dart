import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/provider.dart';
import 'LocationScreenNew.dart';
import 'cardscreen.dart';
import 'cityscreen.dart';
import 'cityscreennew.dart';
import 'locatiionscreen.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime currentDate = DateTime.now();
  DateTime? newDate;
  late TextEditingController _jobCityController;
  late TextEditingController _jobLocationController;
  String _selectedGender = "Gender";

  List _countries = [];
  var country = {'Gender': 'IN', 'Male': 'IN', 'Female': 'PAK'};
  CountryDependentDropDown() {
    country.forEach((key, value) {
      _countries.add(key);
    });
  }

  @override
  void initState() {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    super.initState();
    CountryDependentDropDown();
    _jobCityController = TextEditingController(text: provider.updatedJobCity);
    _jobLocationController =
        TextEditingController(text: provider.updatedJobLocation);
  }

  @override
  void dispose() {
    super.dispose();
    _jobCityController.dispose();
    _jobLocationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    refreshData();
    final myProvider = Provider.of<TodosProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Let's create your profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/welcome.png"))),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          labelText: "Full Name",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.emoji_people),
                            onPressed: () {},
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      child: DateTimeField(
                        decoration: InputDecoration(
                          labelText: "Date of birth",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.perm_contact_calendar),
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
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
                          value: _selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedGender = "$newValue";
                            });
                          },
                          items: _countries.map((country) {
                            return DropdownMenuItem(
                              child: new Text(country,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              value: country,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: _jobCityController,
                      onTap: () {
                        setState(() {
                          _jobCityController.text =
                              myProvider.updatedJobCity.toString();
                        });

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (BuildContext context) {},
                                child: CityScreenNew())));
                      },
                      decoration: InputDecoration(
                        hintText: "Job City",
                        labelText: "Job City",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: _jobLocationController,
                      onTap: () {
                        setState(() {
                          _jobLocationController.text =
                              myProvider.updatedJobLocation.toString();
                        });

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (BuildContext context) {},
                                child: LocationScreenNew())));
                      },
                      decoration: InputDecoration(
                        hintText: "Job Location",
                        labelText: "Job Location",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
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
                    height: 60,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => cardscreen()));
                    },
                    color: Color(0xFF1A237E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Next",
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
      ),
    );
  }

  void refreshData() {
    final myProvider = Provider.of<TodosProvider>(context, listen: false);
    _jobCityController.text = myProvider.updatedJobCity.toString();
    _jobLocationController.text = myProvider.updatedJobLocation.toString();
  }
}