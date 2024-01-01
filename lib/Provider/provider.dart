import 'package:flutter/material.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setFollowUpValue extends ChangeNotifier {
  Map<String, String?> _dropdownValues = {};

  String? getDropdownValue(String quoteId) {
    return _dropdownValues[quoteId];
  }

  Future<void> changeValue({String? newValue, required String quoteId}) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    _dropdownValues[quoteId] = newValue;
    // prefs.setString('updatedValue', newValue!);
    notifyListeners();
  }
}

class setFollowUpOrderValue extends ChangeNotifier {
  Map<String, String> _dropdownValues = {};

  String? getDropdownValue(String quoteId) {
    return _dropdownValues.containsKey(quoteId)
        ? _dropdownValues[quoteId]!
        : "YES";
  }
}

class setEmployeeStatus extends ChangeNotifier {
  final Map<String, String> _userStatusMap = {};

  // Get the status for a specific userId
  String getStatusForUser(String userId) {
    return _userStatusMap[userId] ??
        'Employee'; // Default to 'Employee' if status is not set
  }

  // Set the status for a specific userId
  void setStatusForUser(String userId, String status) {
    _userStatusMap[userId] = status;
    notifyListeners();
  }
}

class DealerData extends ChangeNotifier {
  late DealersModel _model;

  DealersModel get model => _model;

  void setDealerData(DealersModel dealersModel) {
    _model = dealersModel;
    notifyListeners();
  }
}

class UserLoginData extends ChangeNotifier {
  loginDataModel _dataModel;

  UserLoginData() : _dataModel = loginDataModel();

  loginDataModel get dataModel => _dataModel;

  void setUserData(loginDataModel data) {
    _dataModel = data;
    notifyListeners();
  }
}

class FollowUpOrderDate extends ChangeNotifier {
  Map<String, String> _dateMap = {};

  String getDate(String quoteId) {
    return _dateMap.containsKey(quoteId) ? _dateMap[quoteId]! : "mm/dd/yyyy";
  }
}

class FollowUpDate extends ChangeNotifier {
  Map<String, String> _dateMap = {};

  String getDate(String quoteId) {
    return _dateMap.containsKey(quoteId)
        ? _dateMap[quoteId]!
        : DateTime.now().toString();
  }

  void setDate(String quoteId, String date) {
    _dateMap[quoteId] = date;
    notifyListeners();
  }
}

class AuthProvider extends ChangeNotifier {
  String? _userId;

  String? get userId => _userId;

  Future<void> login(String userId) async {
    _userId = userId;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);

    notifyListeners();
  }

  Future<void> logout() async {
    _userId = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    notifyListeners();
  }

  Future<void> checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getString('userId');
    notifyListeners();
  }
}

class PaginationProvider extends ChangeNotifier {
  int _rowsPerPage = 1;

  int get rowsPerPage => _rowsPerPage;

  void setRowsPerPage(int rowsValue) {
    _rowsPerPage = rowsValue;
    notifyListeners();
  }
}

class SelectedValueProvider extends ChangeNotifier {
  String _selectedValue = "";

  String get selectedValue => _selectedValue;

  void setSelectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }
}

class HandlingStates extends ChangeNotifier {
  Map<String, bool> checkboxStates = {};

  bool isChecked(String id) {
    return checkboxStates[id] ?? false;
  }

  void toggleCheckbox(String id, bool newValue) {
    checkboxStates[id] = newValue;
    notifyListeners();
  }
}
