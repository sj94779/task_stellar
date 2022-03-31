import 'package:flutter/cupertino.dart';

import '../model/horizontalImageList.dart';

class TodosProvider extends ChangeNotifier {
  String jobCity = 'Select your job city';
  String jobLocation = 'Select your job location';

  String cityShortName = 'MU';

  String get updatedJobCity => jobCity;
  String get updatedJobLocation => jobLocation;
  String get updatedcityShortName => cityShortName;

  List<HorizontalImageList> _todos = [];
  List<HorizontalImageList> get todos => _todos.toList();

  updateJobCity(String newJobCity) {
    jobCity = newJobCity;
    notifyListeners();
  }

  updateJobLocation(String newJobLocation) {
    jobLocation = newJobLocation;
    notifyListeners();
  }

  updateCityShortName(String newCityShortName) {
    cityShortName = newCityShortName;
    notifyListeners();
  }

  void addTodo(HorizontalImageList todo) {
    _todos.add(todo);

    notifyListeners();
  }
}
