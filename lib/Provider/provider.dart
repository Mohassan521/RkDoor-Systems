import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/completedOrders.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';
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

class setDealerType extends ChangeNotifier {
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

class AnticipatedDeliveryDateSteelOrder extends ChangeNotifier {
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

class EnquiryDropdown extends ChangeNotifier {
  String _defaultValue = "Choose Options";
  String _defaultValue2 = "Choose Options";
  String _defaultValue3 = "Choose Options";
  String _defaultValue4 = "Choose Options";
  String _defaultValue5 = "Choose Options";
  String _defaultValue6 = "Choose Options";

  String get defaultValue => _defaultValue;
  String get defaultValue2 => _defaultValue2;
  String get defaultValue3 => _defaultValue3;
  String get defaultValue4 => _defaultValue4;
  String get defaultValue5 => _defaultValue5;
  String get defaultValue6 => _defaultValue6;

  void updateSelectedValueOne(String newValue) {
    _defaultValue = newValue;
    notifyListeners();
  }

  void updateSelectedValueTwo(String newValue) {
    _defaultValue2 = newValue;
    notifyListeners();
  }

  void updateSelectedValueThree(String newValue) {
    _defaultValue3 = newValue;
    notifyListeners();
  }

  void updateSelectedValueFour(String newValue) {
    _defaultValue4 = newValue;
    notifyListeners();
  }

  void updateSelectedValueFive(String newValue) {
    _defaultValue5 = newValue;
    notifyListeners();
  }

  void updateSelectedValueSixth(String newValue) {
    _defaultValue6 = newValue;
    notifyListeners();
  }
}

class EnquiryDetailsDate extends ChangeNotifier {
  DateTime _dateTime1 = DateTime.now();

  DateTime _dateTime2 = DateTime.now();
  DateTime _dateTime3 = DateTime.now();
  DateTime _dateTime4 = DateTime.now();
  DateTime _dateTime5 = DateTime.now();
  DateTime _dateTime6 = DateTime.now();

  String get formattedDate1 => DateFormat('yyyy-MM-dd').format(_dateTime1);
  String get formattedDate2 => DateFormat('yyyy-MM-dd').format(_dateTime2);
  String get formattedDate3 => DateFormat('yyyy-MM-dd').format(_dateTime3);
  String get formattedDate4 => DateFormat('yyyy-MM-dd').format(_dateTime4);
  String get formattedDate5 => DateFormat('yyyy-MM-dd').format(_dateTime5);
  String get formattedDate6 => DateFormat('yyyy-MM-dd').format(_dateTime6);

  void updateDateTime1(DateTime newDateTime) {
    _dateTime1 = newDateTime;
    notifyListeners();
  }

  void updateDateTime2(DateTime newDateTime) {
    _dateTime2 = newDateTime;
    notifyListeners();
  }

  void updateDateTime3(DateTime newDateTime) {
    _dateTime3 = newDateTime;
    notifyListeners();
  }

  void updateDateTime4(DateTime newDateTime) {
    _dateTime4 = newDateTime;
    notifyListeners();
  }

  void updateDateTime5(DateTime newDateTime) {
    _dateTime5 = newDateTime;
    notifyListeners();
  }

  void updateDateTime6(DateTime newDateTime) {
    _dateTime6 = newDateTime;
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

class AllEnquiriesSearchedData extends ChangeNotifier {
  List<EnquiriesModel> dataModel = [];
  List<EnquiriesModel> filteredDataModel = [];

  Future<void> getAllData(String dealerId, String query) async {
    dataModel = await NetworkApiServices().getAllEnquiries(dealerId);

    filteredDataModel = dataModel
        .where((quotations) =>
            quotations.id.toString().contains(query.toLowerCase()) ||
            quotations.enquiryAllocatedTo!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryCusName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryCompanyName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquriyStatusAfterOpen!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryType!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryPriorityLevel!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.quotationNumberForEnquiry!
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }
}

class EmployeeListSearchedData extends ChangeNotifier {
  List<EmployeeList> dataModel = [];
  List<EmployeeList> filteredDataModel = [];

  Future<void> getAllData(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getEmployeeList(dealerId);
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final id = quotations.id.toString().toLowerCase();
    final name = quotations.display_name!.toLowerCase();
    final email = quotations.user_email!.toLowerCase();
    final postcode = quotations.postCode!.toLowerCase();
    final tel = quotations.telephone!.toLowerCase();

    // Check if any field contains the search query
    return id.contains(lowercaseQuery) ||
        name.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        postcode.contains(lowercaseQuery) ||
        tel.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }
}

class ClosedEnquiriesSearchedData extends ChangeNotifier {
  List<ClosedEnquiryModel> dataModel = [];
  List<ClosedEnquiryModel> filteredDataModel = [];

  Future<void> getAllData(String dealerId, String query) async {
    dataModel = await NetworkApiServices().closedEnquiries(dealerId);

    filteredDataModel = dataModel
        .where((quotations) =>
            quotations.enquiryCusName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryCompanyName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryTelNum!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryType!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquiryCusEmail!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.enquirySource!
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }
}

class CompletedOrdersSearchData extends ChangeNotifier {
  List<CompletedOrders> dataModel = [];
  List<CompletedOrders> filteredDataModel = [];

  Future<void> getAllData(String dealerId, String query) async {
    dataModel = await NetworkApiServices().getCompletedOrders(dealerId);

    filteredDataModel = dataModel
        .where((quotations) =>
            quotations.name!.toLowerCase().contains(query.toLowerCase()) ||
            quotations.quotationNumber!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.customerEmail!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.dileveryPostCodeC13!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            quotations.id!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }
}

class QuotationsSearchedData extends ChangeNotifier {
  List<QuotationsModel> dataModel = [];
  List<QuotationsModel> filteredDataModel = [];

  Future<void> getAllData(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getQuotationsList(dealerId);
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final customerEmail = quotations.customerEmail!.toLowerCase();
    final deliveryPostCode = quotations.dileveryPostCodeC13!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        customerEmail.contains(lowercaseQuery) ||
        deliveryPostCode.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }
}

class AllEntranceDoorOrderSearchedData extends ChangeNotifier {
  List<OrdersModel> dataModel = [];
  List<OrdersModel> filteredDataModel = [];
  List<OrdersModel> receivedDataModel = [];
  List<OrdersModel> placedDataModel = [];
  List<OrdersModel> awaitingDataModel = [];
  

  Future<void> getAllData(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  
  }

  Future<void> doorOrderReceived(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  receivedDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> doorOrderPlaced(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  placedDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> awaitingDeposit(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  awaitingDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> awaitingSurvey(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> depositReceived(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> PCIssued(String dealerId, String query) async {
    dataModel = await NetworkApiServices().getOrdersList(dealerId, "");

    filteredDataModel = dataModel
        .where((data) =>
            data.name!.toLowerCase().contains(query.toLowerCase()) ||
            data.quotationNumber!.toLowerCase().contains(query.toLowerCase()) ||
            data.orderStatusVal!.toLowerCase().contains(query.toLowerCase()) ||
            data.customerEmail!.toLowerCase().contains(query.toLowerCase()) ||
            data.id!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> RCIssued(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> readyForShipping(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> inProduction(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> transitToUK(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> inRKDSWarehouse(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> ABPayment(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> outForDelivery(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> delivered(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> delayed(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }

  Future<void> onHold(String dealerId, String query) async {
    if (dataModel.isEmpty) {
    dataModel = await NetworkApiServices().getOrdersList(dealerId,"");
  }

  // Use a case-insensitive search query
  final lowercaseQuery = query.toLowerCase();

  // Perform filtering
  filteredDataModel = dataModel.where((quotations) {
    final name = quotations.name!.toLowerCase();
    final quotationNumber = quotations.quotationNumber!.toLowerCase();
    final orderstatus = quotations.orderStatusVal!.toLowerCase();
    final email = quotations.customerEmail!.toLowerCase();
    final id = quotations.id!.toLowerCase();

    // Check if any field contains the search query
    return name.contains(lowercaseQuery) ||
        quotationNumber.contains(lowercaseQuery) ||
        orderstatus.contains(lowercaseQuery) ||
        email.contains(lowercaseQuery) ||
        id.contains(lowercaseQuery);
  }).toList();

  notifyListeners();
  }
}

class AllSteelOrdersData extends ChangeNotifier {
  List<SteelOrderModel> steelOrders = [];
  List<SteelOrderModel> filteredSteelOrderList = [];

  Future<void> getAllData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getAllReceivedData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getAllPlacedData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getAwaitingDepositData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getDepositReceivedData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getPCData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getRCData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getReadyForShippingData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getProductionData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getABPData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getOutForDeliveryData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getDeliveredData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> getDelayedData(
    BuildContext context,
    String dealerId,
    String query,
  ) async {
    steelOrders = await NetworkApiServices().allSteelOrders(context, dealerId);

    filteredSteelOrderList = steelOrders
        .where((order) =>
            order.steelCustomerName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            order.steelQNumber!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
