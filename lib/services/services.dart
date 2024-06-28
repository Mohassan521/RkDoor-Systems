import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/BIMDetailsModel.dart';
import 'package:price_link/models/CadDetailsModel.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/PDFDetailsModel.dart';
import 'package:price_link/models/admin%20models/ClosedEnquiries.dart';
import 'package:price_link/models/admin%20models/CompletedSteelOrders.dart';
import 'package:price_link/models/admin%20models/adminCompletedOrders.dart';
import 'package:price_link/models/admin%20models/adminEnquiryModel.dart';
import 'package:price_link/models/admin%20models/adminHotleads.dart';
import 'package:price_link/models/admin%20models/adminPanelOrders.dart';
import 'package:price_link/models/admin%20models/adminQuotesModel.dart';
import 'package:price_link/models/admin%20models/administratorsModel.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/models/admin%20models/archiveEnquiries.dart';
import 'package:price_link/models/admin%20models/archiveOrderModel.dart';
import 'package:price_link/models/admin%20models/archiveQuotations.dart';
import 'package:price_link/models/admin%20models/archiveSteelOrder.dart';
import 'package:price_link/models/admin%20models/dealersList.dart';
import 'package:price_link/models/admin%20models/steelOrderModel.dart';
import 'package:price_link/models/careAndMaintenanceModel.dart';
import 'package:price_link/models/completedOrders.dart';
import 'package:price_link/models/completedSteelOrdersModel.dart';
import 'package:price_link/models/dataSheetsModel.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/models/hotLeadsModel.dart';
import 'package:price_link/models/instructionsModel.dart';
import 'package:price_link/models/marketingImagesModel.dart';
import 'package:price_link/models/marketingMaterial.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/models/quoteAnalysis.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/models/technicalWiring.dart';
import 'package:price_link/models/testingModel.dart';
import 'package:price_link/models/updatedModel.dart';
import 'package:price_link/screens/adminScreens/adminHome.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices {
  Future<EmployeeList?> getLoggedInUserDetails(
      String dealerId, String empId) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/display/employee/$dealerId'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List<EmployeeList> employeeList = jsonResponse
          .map<EmployeeList>((data) => EmployeeList.fromJson(data))
          .toList();

      final loggedInEmployee = employeeList.firstWhere(
        (employee) => employee.id == int.parse(empId),
      );

      return loggedInEmployee;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<EmployeeList>> getEmployeeList(String dealerId) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/display/employee/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<EmployeeList> persons = jsonResponse.map((data) {
        return EmployeeList.fromJson(data);
      }).toList();

      return persons;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> loginApi(
      BuildContext context, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/login";
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'name': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      final String status = jsonResponse['status'];
      final String message = jsonResponse['message'];
      prefs.setString('user_status', status);
      prefs.setString('message', message);

      if (status == 'OK' && message == "you have reached the server") {
        final Map<String, dynamic> receivedData = jsonResponse['received_data'];
        final userNestedData = receivedData['data']['data'];

        // final admin_role = receivedData['data']['roles'][0];
        //print('admin rolellelelelele$admin_role');
        //print("admin role: $admin_role");

        String user_id = userNestedData['ID'];
        final String userEmail = userNestedData['user_email'];
        String userName = userNestedData['display_name'];
        //print(userName);
        prefs.setString('username', userName);
        prefs.setString('user_id', user_id);
        prefs.setString('userEmail', userEmail);
        prefs.setBool('isLogin', true);

        prefs.setString('empId', receivedData['parent_id']);
        String dealer_id = prefs.getString('empId') ?? "";

        // prefs.setString('admin_role', admin_role);
        // String adminRole = prefs.getString('admin_role') ?? "";

        prefs.setString('role', receivedData['user_role']);
        String user_role = prefs.getString('role') ?? "";

        String userId = prefs.getString('user_id') ?? '';
        String user = prefs.getString('username') ?? '';
        print('userId in login API $userId');

        if (user_role == "dealer") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardPage(
                      dealer_name: user, dealer_id: userId, role: user_role)));
        } else if (user_role == "employee") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardPage(
                        dealer_name: user,
                        dealer_id: dealer_id,
                        empId: user_id,
                        role: user_role,
                      )));
        } else if (user_role == "") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminHomePage(
                        dealer_name: user,
                        dealer_id: dealer_id,
                        role: "admin",
                      )));
        }

        // print('Login successful with $userId');
        // print('Login successful with username $userName');
      } else {
        Utils().showToast('Invalid credentials', Colors.red, Colors.white);
      }
    } else {
      Utils().showToast('Something went wrong', Colors.red, Colors.white);
    }
  }

  Future<void> createEnquiries(
      String userId,
      String type,
      String dealer,
      String enquiryEntered,
      String requirement,
      String cus_name,
      String company,
      String supply_type,
      String address,
      String address2,
      String address3,
      String address4,
      String postcode,
      String cus_email,
      String telephone,
      String priority,
      List<File>? fileToUpload,
      String notes,
      String source,
      String allocatedTo) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/create_enquries";

    var result = http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = fileToUpload[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
          "EnquiryfileToUpload[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      newList.add(multipartFile);
    }

    result.files.addAll(newList);

    result.fields["user_id"] = userId;
    result.fields["enquiry_type"] = type;
    result.fields["enquiry_dealer"] = dealer;
    result.fields["enquiry_entered"] = enquiryEntered;
    result.fields["enquiry_requirement"] = requirement;
    result.fields["enquiry_cus_name"] = cus_name;
    result.fields["enquiry_company_name"] = company;
    result.fields["enquiry_supply_type"] = supply_type;
    result.fields["customer_address"] = address;
    result.fields["customer_address_2"] = address2;
    result.fields["customer_address_3"] = address3;
    result.fields["customer_address_4"] = address4;
    result.fields["dilevery_post_code_c13"] = postcode;
    result.fields["enquiry_cus_email"] = cus_email;
    result.fields["enquiry_tel_num"] = telephone;
    result.fields["enquiry_priorityLevel"] = priority;
    result.fields["enquiry_notes"] = notes;
    result.fields["enquiry_source"] = source;
    result.fields["enquiry_allocated_to"] = allocatedTo;

    //result.files.add(multiport);

    var response = await result.send();

    if (response.statusCode == 200) {
      print('uploaded file path: ${fileToUpload}');
      Utils().showToast('Enquiry Created', Color(0xff941420), Colors.white);
    } else {
      //print('multiport path:  ${multiport.filename}');
      print('Something went wrong ${response.statusCode}');
    }

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<void> setFollowUpOrderDate(
      String id, String quoteId, DateTime orderDate) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/set_follow_up_date_for_orders";
    var response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": id,
      "quote_id": quoteId,
      "follow_up_date_for_order": DateFormat('yyyy-MM-dd').format(orderDate)
    });

    if (response.statusCode == 200) {
      Utils().showToast('Order Date Updated', Colors.green, Colors.white);
      print('Date API called');
    } else {
      Utils().showToast('Something went wrong', Colors.red, Colors.white);
      throw Exception();
    }
  }

  Future<void> setFollowUpDate(
      String id, String quoteId, DateTime followUpDate) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/set_follow_up_date_for_quotes";
    var response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": id,
      "quote_id": quoteId,
      "follow_up_date_for_quotes": DateFormat('yyyy-MM-dd').format(followUpDate)
    });

    if (response.statusCode == 200) {
      Utils().showToast('Date Updated', Colors.green, Colors.white);
      print('Date API called');
    } else {
      Utils().showToast('Something went wrong', Colors.red, Colors.white);
      throw Exception();
    }
  }

  Future<void> setFollowUpValue(
    String id,
    String quoteId,
    String followUpMade,
  ) async {
    try {
      final apiUrl = Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/set_follow_up_made_for_quotes",
      );
      final response = await http.post(apiUrl, body: {
        'user_id': id,
        'quote_id': quoteId,
        'follow_up_made_for_quotes': followUpMade,
      });

      if (response.statusCode == 200) {
        print('API called');
        Utils().showToast('Status Updated', Colors.green, Colors.white);
      } else {
        print('API not called ${response.body}');
        Utils().showToast('Something went wrong', Colors.red, Colors.white);
        throw Exception('API call failed');
      }
    } catch (e) {
      print('Exception occured $e');
      throw e;
    }
  }

  Future<void> setFollowUpOrderValue(
    String id,
    String quoteId,
    String followUpMade,
  ) async {
    try {
      final apiUrl = Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/set_follow_up_made_for_orders",
      );
      final response = await http.post(apiUrl, body: {
        'user_id': id,
        'quote_id': quoteId,
        'follow_up_made_for_orders': followUpMade,
      });

      if (response.statusCode == 200) {
        print('API called');
        Utils().showToast('Order Status Updated ', Colors.green, Colors.white);
      } else {
        print('API not called ${response.body}');
        Utils().showToast('Something went wrong', Colors.red, Colors.white);
        throw Exception('API call failed');
      }
    } catch (e) {
      print('Exception occured $e');
      throw e;
    }
  }

  Future<void> registerPostRequest(
      BuildContext context,
      String firstName,
      LastName,
      dealer,
      dealerAddress1,
      dealerAddress2,
      dealerAddress3,
      postCode,
      telephone,
      email,
      password) async {
    try {
      final apiUrl =
          "https://www.pricelink.net/wp-json/mobile_api/v1/display/dealers";

      var response = await http.post(Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "display_name": firstName + LastName,
            "dealerName": dealer,
            "dealerAddress1": dealerAddress1,
            "dealerAddress2": dealerAddress2,
            "dealerAddress3": dealerAddress3,
            "post_code_register": postCode,
            "telephone": telephone,
            "user_email": email,
            "user_pass": password
          }));

      if (response.statusCode == 201) {
        // Handle successful registration
        print('Registration successful');
      } else {
        print('Registration failed with status code ${response.body}');
      }
    } catch (error) {
      print('Error: ${error.toString()}');
      // Handle error appropriately
    }
  }

  Future<List<EnquiriesModel>> getAllEnquiries(String dealerId,
      {String? searchQuery}) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/enquries/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      //print(jsonResponse);
      // Map each item in the JSON array to a enquiries object
      List<EnquiriesModel> enquiries = jsonResponse.map((data) {
        return EnquiriesModel.fromJson(data);
      }).toList();

      enquiries.sort((a, b) {
        DateTime adate = DateTime.parse(a.date!);
        DateTime bdate = DateTime.parse(b.date!);
        return bdate.compareTo(adate);
      });

      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerCaseQuery = searchQuery.toLowerCase();

        enquiries = enquiries.where((enquiry) {
          bool matchesCustomerName = enquiry.enquiryCusName != null &&
              enquiry.enquiryCusName!.toLowerCase().contains(lowerCaseQuery);

          return matchesCustomerName;
        }).toList();
      }

      return enquiries;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<OrdersModel>> getOrdersList(String dealerId, String? id) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/orders/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      // Map each item in the JSON array to a enquiries object
      List<OrdersModel> orders = jsonResponse.map((data) {
        return OrdersModel.fromJson(data);
      }).toList();

      orders.sort((a, b) {
        DateTime adate = DateTime.parse(a.date!);
        DateTime bdate = DateTime.parse(b.date!);
        return bdate.compareTo(adate);
      });

      return orders;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<DealersModel>> getDealersList(
      BuildContext context, String dealerId) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/display/dealers/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<DealersModel> dealers = jsonResponse.map((data) {
        return DealersModel.fromJson(data);
      }).toList();

      DealersModel dealersModel =
          DealersModel(dealerName: jsonResponse[0]['dealerName']);

      final dealerProvider = Provider.of<DealerData>(context, listen: false);
      dealerProvider.setDealerData(dealersModel);

      return dealers;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<QuotationsModel>> getQuotationsList(String? dealerId,
      {String? searchQuery}) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/quotations/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<QuotationsModel> quotes = jsonResponse.map((data) {
        return QuotationsModel.fromJson(data);
      }).toList();

      quotes.sort((a, b) {
        DateTime adate = DateTime.parse(a.date!);
        DateTime bdate = DateTime.parse(b.date!);
        return bdate.compareTo(adate);
      });

      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerCaseQuery = searchQuery.toLowerCase();

        quotes = quotes.where((quote) {
          bool matchQuoteId = quote.id!.toLowerCase().contains(lowerCaseQuery);

          bool matchCustomerName = quote.name != null &&
              quote.name!.toLowerCase().contains(lowerCaseQuery);

          return matchQuoteId || matchCustomerName;
        }).toList();
      }

      return quotes;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<SteelOrderModel>> allSteelOrders(
      BuildContext? context, String dealerId) async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/steelorders/${dealerId}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      //print(jsonResponse);
      // Map each item in the JSON array to a enquiries object
      List<SteelOrderModel> steelOrders = jsonResponse.map((data) {
        return SteelOrderModel.fromJson(data);
      }).toList();

      steelOrders.sort((a, b) {
        DateTime adate = DateTime.parse(a.date!);
        DateTime bdate = DateTime.parse(b.date!);
        return bdate.compareTo(adate);
      });

      return steelOrders;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<String> setNotesValue(
      String user_id, String quote_id, String notesMessage) async {
    var apiUrl = "https://www.pricelink.net/wp-json/mobile_api/v1/quotes_notes";

    final response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": user_id,
      "quote_id": quote_id,
      "quotes_notes": notesMessage
    });

    if (response.statusCode == 200) {
      print(notesMessage);
      Utils().showToast('Notes Updated', Colors.green, Colors.white);

      return notesMessage;
    } else {
      print('Updation failed ${response.body}');
      Utils().showToast('Something went wrong', Colors.red, Colors.white);

      return "";
    }
  }

  Future<void> setOrderNotesValue(
      String user_id, String quote_id, String orderNotes) async {
    var apiUrl = "https://www.pricelink.net/wp-json/mobile_api/v1/order_notes";
    final response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": user_id,
      "quote_id": quote_id,
      "order_notes": orderNotes
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Notes_value', orderNotes);

    if (response.statusCode == 200) {
      Utils().showToast('Order Notes Updated', Colors.blue, Colors.white);
    } else {
      Utils().showToast('Something went wrong', Colors.red, Colors.white);
    }
  }

  Future<void> deleteOrders(String userId, String quoteId) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/delete_orders";

    final response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "order_id": quoteId});

    if (response.statusCode == 200) {
      Utils().showToast('Record Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> deleteQuotes(String userId, String quoteId) async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/delete_quotes";

    final response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "quote_id": quoteId});

    if (response.statusCode == 200) {
      Utils().showToast('Record Deleted', Colors.green, Colors.white);
    } else {
      Utils().showToast('Something went wrong', Colors.green, Colors.white);
    }
  }

  Future<void> editEmployee(
      String id,
      String firstName,
      String lastName,
      String markup,
      String discount,
      String pCode,
      String telephone,
      String email,
      String qType) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/employee_edit";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "employee_id": id,
      "firstname": firstName,
      "lastname": lastName,
      "mark_up": markup,
      "max_discount": discount,
      "post_code_register": pCode,
      "telephone": telephone,
      "email": email,
      "quotation_type": qType
    });

    if (response.statusCode == 200) {
      Utils().showToast('Changes Saved', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<void> deleteEmployee(String userId) async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/delete_employees";

    var response =
        await http.post(Uri.parse(apiUrl), body: {"user_id": userId});

    if (response.statusCode == 200) {
      Utils().showToast('Employee deleted', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<void> editDealers(
      String id,
      String email,
      String firstName,
      String lastName,
      String dealerName,
      String dealerAddressOne,
      String dealerAddressTwo,
      String dealerAddressThree,
      String pCode,
      String telephone) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/dealer_edit";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "dealer_id": id,
      "email": email,
      "firstname": firstName,
      "lastname": lastName,
      "Dealer_field": dealerName,
      "Dealer_address_1": dealerAddressOne,
      "Dealer_address_2": dealerAddressTwo,
      "Dealer_address_3": dealerAddressThree,
      "post_code_register": pCode,
      "telephone": telephone
    });

    if (response.statusCode == 200) {
      Utils().showToast('Dealer Updated', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<void> deleteSteelOrder(String userId, String orderId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/delete_steel_orderapi";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "order_id": orderId});

    if (response.statusCode == 200) {
      Utils().showToast('Steel Order Deleted', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> createSteelOrder(
      String dealerId,
      type,
      cname,
      qnum,
      dealer,
      salesperson,
      supply,
      address1,
      address2,
      address3,
      postcode,
      color,
      frame,
      cusEmail,
      telephone,
      totalOrderValue,
      discount,
      deliveryCost,
      weight,
      netOrderValue,
      List<File>? fileToUpload,
      String notes) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/save_steel_orderApi";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      File imageFile = fileToUpload[i];

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartfile = http.MultipartFile(
          "fileToUploadPdf[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(multipartfile);
    }

    request.files.addAll(newList);

    request.fields["user_id"] = dealerId;
    request.fields["product_type"] = type;
    request.fields["steel_customer_name"] = cname;
    request.fields["steel_q_number"] = qnum;
    request.fields["steel_saleperson"] = dealer;
    request.fields["steel_dealer_email"] = salesperson;
    request.fields["steel_supply_type"] = supply;
    request.fields["customer_address"] = address1;
    request.fields["customer_address_2"] = address2;
    request.fields["customer_address_3"] = address3;
    request.fields["dilevery_post_code_c13"] = postcode;
    request.fields["steel_color"] = color;
    request.fields["steel_frameSize"] = frame;
    request.fields["steel_customer_email"] = cusEmail;
    request.fields["steel_customer_tel"] = telephone;
    request.fields["steel_total_order_value"] = totalOrderValue;
    request.fields["steel_discount"] = discount;
    request.fields["steel_delivery_cost"] = deliveryCost;
    request.fields["steel_weight"] = weight;
    request.fields["steel_order_net_val"] = netOrderValue;
    request.fields["Notes"] = notes;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Steel Order Created', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> editSteelOrders(
      String type,
      id,
      dealerId,
      cname,
      qnum,
      dealer,
      salesperson,
      // vat_rate,
      supply,
      address1,
      address2,
      address3,
      postcode,
      color,
      frame,
      email,
      tel,
      totalValue,
      discount,
      cost,
      weight,
      netValue,
      notes) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/update_steel_orderapi";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "id": id,
      "product_type": type,
      "user_id": dealerId,
      "steel_customer_name": cname,
      "steel_q_number": qnum,
      "steel_saleperson": dealer,
      "steel_dealer_email": salesperson,
      "steel_supply_type": supply,
      "customer_address": address1,
      "customer_address_2": address2,
      "customer_address_3": address3,
      "dilevery_post_code_c13": postcode,
      "steel_color": color,
      "steel_frameSize": frame,
      "steel_customer_email": email,
      "steel_customer_tel": tel,
      "steel_total_order_value": totalValue,
      "steel_discount": discount,
      "steel_delivery_cost": cost,
      "steel_weight": weight,
      "steel_order_net_val": netValue,
      "steel_form_notes": notes
    });

    if (response.statusCode == 200) {
      Utils().showToast('Steel Order updated', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> setEmployeeStatus(String id, String status) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/change_employee_status";

    var response = await http
        .post(Uri.parse(apiUrl), body: {"user_id": id, "user_val": status});

    if (response.statusCode == 200) {
      Utils().showToast(
          'Employee status updated', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<String> getEmployeeStatus(String empId) async {
    final apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/change_employee_status/$empId";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "";
      }
    } catch (e) {
      // Handle exception
      return e.toString();
    }
  }

  Future<void> setOrderRights(String id, String orderRights) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/create_orders_right_for_employees";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"id": id, "input_create_orders_right": orderRights});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Order Rights Created', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<bool> getOrderRights(int id) async {
    final apiUrl =
        'https://pricelink.net/wp-json/mobile_api/v1/create_orders_right_for_employees/$id';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        bool result = jsonDecode(response.body);
        return result;
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        return false; // Handle error or return a default value
      }
    } catch (error) {
      print('Error: $error');
      return false; // Handle error or return a default value
    }
  }

  Future<void> createOrder(String userId, String quoteId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/entrance_door_make_order";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "quote_id": quoteId});

    if (response.statusCode == 200) {
      Utils().showToast('Order Created', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<void> backToQuote(String userId, String quoteId) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/back_to_Quotes";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "quote_id": quoteId});

    if (response.statusCode == 200) {
      Utils().showToast('Quote Created', Color(0xff941420), Colors.white);
    } else {
      print('error ${response}');
    }
  }

  Future<void> deleteEnquiry(String user_id, String enq_id) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/delete_enquries";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": user_id, "order_id": enq_id});

    if (response.statusCode == 200) {
      Utils().showToast('Record Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> hotLeadsOrder(
      String userId,
      type,
      dealer,
      entered,
      requirement,
      cus_name,
      company,
      supply,
      address,
      address2,
      address3,
      address4,
      postCode,
      cus_email,
      tel_num,
      priority,
      notes,
      source,
      allocatedTo) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/save_hot_lead_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": userId,
      "enquiry_type": type,
      "enquiry_dealer": dealer,
      "enquiry_entered": entered,
      "enquiry_requirement": requirement,
      "enquiry_cus_name": cus_name,
      "enquiry_company_name": company,
      "enquiry_supply_type": supply,
      "customer_address": address,
      "customer_address_2": address2,
      "customer_address_3": address3,
      "customer_address_4": address4,
      "dilevery_post_code_c13": postCode,
      "enquiry_cus_email": cus_email,
      "enquiry_tel_num": tel_num,
      "enquiry_priorityLevel": priority,
      "enquiry_notes": notes,
      "enquiry_source": source,
      "enquiry_allocated_to": allocatedTo
    });

    if (response.statusCode == 200) {
      Utils().showToast(
          'Enquiry saved to Hot Leads', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong ${response.body}');
    }
  }

  Future<void> FinancialHistoryCalculation(
      String user_id,
      orderId,
      depAmountPaid,
      depPayDate,
      addPayAmount,
      addPayDate,
      balPayAmount,
      balPayDate,
      notes,
      total,
      balDueBeforeDelivery) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/Finanical_input_itemsapi";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "user_id": user_id,
      "order_id": orderId,
      "deposit_amount_paid": depAmountPaid,
      "dep_pay_date": depPayDate,
      "add_pay_amount": addPayAmount,
      "add_pay_date": addPayDate,
      "bal_pay_amount": balPayAmount,
      "bal_pay_date": balPayDate,
      "order_fin_his_note_box": notes,
      "total_sale_price": total,
      "bal_due_before_delivery": balDueBeforeDelivery
    });

    if (response.statusCode == 200) {
      Utils().showToast('Financial History Successfully Created',
          Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> closeEnquiry(String userId, String enquiryId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/enquirycloseFileApi";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"user_id": userId, "order_id": enquiryId});

    if (response.statusCode == 200) {
      Utils().showToast(
          'Enquiry Closed Successfully', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<List<ClosedEnquiryModel>> closedEnquiries(String dealerId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/enquirycloseFile_getApi/${dealerId}";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> enquiriesList = json.decode(response.body);

      List<ClosedEnquiryModel> list = enquiriesList.map((enquiries) {
        return ClosedEnquiryModel.fromJson(enquiries);
      }).toList();

      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<HotLeadsModel>> hotLeads(String dealerId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/hotleadsEnquiry_getApi/$dealerId";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      print('data in hot leads: $jsonResponse');
      List<HotLeadsModel> hotLeads = jsonResponse.map((items) {
        return HotLeadsModel.fromJson(items);
      }).toList();

      return hotLeads;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> saveEnquiryRecord(
      String id,
      dealerId,
      enqRecDate,
      enqRecDate1,
      enqRecDate2,
      enqRecDate3,
      enqRecDate4,
      enqRecDate5,
      enqRecDate6,
      enqRkds1,
      enqRkds2,
      enqRkds3,
      enqRkds4,
      enqRkds5Part2,
      enqRkds5,
      enqRkds6,
      enqRkds7,
      enqRkds8,
      survey,
      enqRkds9,
      app1,
      app2,
      app3,
      app4,
      app5,
      app6,
      app7,
      app8,
      app9,
      app10,
      chooseOp1,
      chooseOp2,
      chooseOp3,
      chooseOp4,
      chooseOp5,
      chooseOp6) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/enquiry_record_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "order_id": id,
      "user_id": dealerId,
      "enq_rec_date": enqRecDate,
      "enq_rec_date_1": enqRecDate1,
      "enq_rec_date_2": enqRecDate2,
      "enq_rec_date_3": enqRecDate3,
      "enq_rec_date_4": enqRecDate4,
      "enq_rec_date_5": enqRecDate5,
      "enq_rec_date_6": enqRecDate6,
      "enq_rkds_1": enqRkds1,
      "enq_rkds_2": enqRkds2,
      "enq_rkds_3": enqRkds3,
      "enq_rkds_4": enqRkds4,
      "enq_rkds_5_part2": enqRkds5Part2,
      "enq_rkds_5": enqRkds5,
      "enq_rkds_6": enqRkds6,
      "enq_rkds_7": enqRkds7,
      "enq_rkds_8": enqRkds8,
      "survey_field": survey,
      "enq_rkds_9": enqRkds9,
      "app_1": app1,
      "app_2": app2,
      "app_3": app3,
      "app_4": app4,
      "app_5": app5,
      "app_6": app6,
      "app_7": app7,
      "app_8": app8,
      "app_9": app9,
      "app_10": app10,
      "choose_opt_1": chooseOp1,
      "choose_opt_2": chooseOp2,
      "choose_opt_3": chooseOp3,
      "choose_opt_4": chooseOp4,
      "choose_opt_5": chooseOp5,
      "choose_opt_6": chooseOp6
    });

    if (response.statusCode == 200) {
      print('Record entered');
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> editEnquiriesForAdmin(
      String id,
      String dealerId,
      String type,
      String dealer,
      String entered,
      String requirement,
      String cusName,
      String company,
      String supplyType,
      String address,
      String address2,
      String address3,
      String address4,
      String postCode,
      String email,
      String telephone,
      String priority,
      String notes,
      String source) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/edit_enquries";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "id": id,
      "user_id": dealerId,
      "enquiry_type": type,
      "enquiry_dealer": dealer,
      "enquiry_entered": entered,
      "enquiry_requirement": requirement,
      "enquiry_cus_name": cusName,
      "enquiry_company_name": company,
      "enquiry_supply_type": supplyType,
      "customer_address": address,
      "customer_address_2": address2,
      "customer_address_3": address3,
      "customer_address_4": address4,
      "dilevery_post_code_c13": postCode,
      "enquiry_cus_email": email,
      "enquiry_tel_num": telephone,
      "enquiry_priorityLevel": priority,
      "enquiry_notes": notes,
      "enquiry_source": source,
    });

    if (response.statusCode == 200) {
      Utils().showToast('Changes Saved', Color(0xff941420), Colors.white);
    } else {
      print('Something went wong');
    }
  }

  Future<void> editEnquiries(
      String id,
      String dealerId,
      String type,
      String dealer,
      String entered,
      String requirement,
      String cusName,
      String company,
      String supplyType,
      String address,
      String address2,
      String address3,
      String address4,
      String postCode,
      String email,
      String telephone,
      String priority,
      String notes,
      String source,
      String? enquiryAllocatedTo) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/edit_enquries";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "id": id,
      "user_id": dealerId,
      "enquiry_type": type,
      "enquiry_dealer": dealer,
      "enquiry_entered": entered,
      "enquiry_requirement": requirement,
      "enquiry_cus_name": cusName,
      "enquiry_company_name": company,
      "enquiry_supply_type": supplyType,
      "customer_address": address,
      "customer_address_2": address2,
      "customer_address_3": address3,
      "customer_address_4": address4,
      "dilevery_post_code_c13": postCode,
      "enquiry_cus_email": email,
      "enquiry_tel_num": telephone,
      "enquiry_priorityLevel": priority,
      "enquiry_notes": notes,
      "enquiry_source": source,
      "enquiry_allocated_to": enquiryAllocatedTo
    });

    if (response.statusCode == 200) {
      Utils().showToast('Changes Saved', Color(0xff941420), Colors.white);
    } else {
      print('Something went wong');
    }
  }

  Future<List<UpdatesModel>> getUpdatesValue() async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/send_updates_api/1";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<UpdatesModel> updates = jsonResponse.map((updates) {
        return UpdatesModel.fromJson(updates);
      }).toList();

      return updates;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> createEmployees(
    String id,
    String fname,
    lname,
    markup,
    discount,
    postcode,
    telephone,
    email,
    password,
    qtype,
    String? cusAddress,
    String? cusAddress2,
    String? cusAddress3,
  ) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/create_employee_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "dealer_id": id,
      "firstname": fname,
      "lastname": lname,
      "mark_up": markup,
      "max_discount": discount,
      "post_code_register": postcode,
      "telephone": telephone,
      "email": email,
      "password": password,
      "quotation_type": qtype,
      "cus_address": cusAddress,
      "cus_address_2": cusAddress2,
      "cus_address_3": cusAddress3,
    });

    if (response.statusCode == 200) {
      Utils().showToast('Employee Created', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<List<CompletedOrders>> getCompletedOrders(String dealerId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/closeorders/$dealerId";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);

      List<CompletedOrders> list = jsonResponse.map((ordersList) {
        return CompletedOrders.fromJson(ordersList);
      }).toList();

      return list;
    } else {
      throw Exception('failed to fetch data');
    }
  }

  Future<String> getDealerLogo(String dealerId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/dealerLogo_api/$dealerId";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  Future<void> setDealerLogo(String userId, File? imgUrl) async {
    try {
      var apiUrl =
          "https://pricelink.net/wp-json/mobile_api/v1/post_dealerLogo_api";

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      var stream = http.ByteStream(imgUrl!.openRead());
      var length = await imgUrl.length();
      var multipartfile = http.MultipartFile("img_url", stream, length,
          filename: imgUrl.path.split("/").last);

      request.files.add(multipartfile);
      request.fields['userId'] = userId; // You can add any additional fields

      var response = await http.Client().send(request);

      if (response.statusCode == 200) {
        Utils().showToast('File Uploaded', Color(0xff941420), Colors.white);
      } else {
        print('Something went wrong ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }

  Future<void> setSteelFactoryOrderNo(
      String id, String factoryOrderValue, String userId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/steel_fac_order_no_get_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": id,
      "steel_fac_order_no_val": factoryOrderValue,
      "user_id": userId.toString()
    });

    if (response.statusCode == 200) {
      Utils().showToast(
          'Factory Order Value has been set', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> setSteelConfFile(
      String id, String userId, List<File>? fileToUpload) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/Steel_Order_Conf_File_api";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      File imageFile = fileToUpload[i];

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartfile = http.MultipartFile(
          "Steel_Order_Conf_File[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(multipartfile);
    }

    request.files.addAll(newList);

    request.fields['order_id'] = id;
    request.fields['user_id'] = userId;

    var response = await request.send();
    if (response.statusCode == 200) {
      Utils().showToast(
          'Steel Order file has been set', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<List<CadDetailsModel>> getCEDDetails() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_1/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<CadDetailsModel> apiDataList =
          jsonData.map((data) => CadDetailsModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<PDFDetailsModel>> getCEDDetailsTwo() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_2/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<PDFDetailsModel> apiDataList =
          jsonData.map((data) => PDFDetailsModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<BIMDetailsModel>> getCEDDetailsThree() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_9/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<BIMDetailsModel> apiDataList =
          jsonData.map((data) => BIMDetailsModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<CareAndMaintenanceModel>> getCEDDetailsFour() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_3/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<CareAndMaintenanceModel> apiDataList = jsonData
          .map((data) => CareAndMaintenanceModel.fromJson(data))
          .toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<InstructionsModel>> getCEDDetailsFive() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_4/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<InstructionsModel> apiDataList =
          jsonData.map((data) => InstructionsModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<DataSheetsModel>> getCEDDetailsSix() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_5/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<DataSheetsModel> apiDataList =
          jsonData.map((data) => DataSheetsModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<TestingModel>> getCEDDetailsSeven() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_6/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<TestingModel> apiDataList =
          jsonData.map((data) => TestingModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<TechnicalAndWiringModel>> getCEDDetailsEight() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_7/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<TechnicalAndWiringModel> apiDataList = jsonData
          .map((data) => TechnicalAndWiringModel.fromJson(data))
          .toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<MarketingMaterialModel>> getCEDDetailsNine() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_8/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<MarketingMaterialModel> apiDataList = jsonData
          .map((data) => MarketingMaterialModel.fromJson(data))
          .toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<MarketingImagesModel>> getCEDDetailsTen() async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/get_api_downloads_main_folder_10/1'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<MarketingImagesModel> apiDataList =
          jsonData.map((data) => MarketingImagesModel.fromJson(data)).toList();
      print(apiDataList.length);
      return apiDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> duplicateOrders(String id, String oId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/duplicate_orders_api";

    var response = await http
        .post(Uri.parse(apiUrl), body: {"order_id": oId, "user_id": id});

    if (response.statusCode == 200) {
      Utils().showToast('Duplicate created', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> duplicateQuotes(String id, String qId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/duplicate_quotes_api";

    var response = await http
        .post(Uri.parse(apiUrl), body: {"quote_id": qId, "user_id": id});

    if (response.statusCode == 200) {
      Utils().showToast('Duplicate created', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> factoryDeliveryWeekSteelOrder(
      String userId, String value, String qId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/steel_fac_delivery_weeks_post_api";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"q_id": qId, "steel_Fac_week_val": value, "user_id": userId});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Factory value Updated', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> setDelNotesSteelOrder(
      String orderId, String userId, List<File>? delNotes) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/Steel_del_notes_post_api";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < delNotes!.length; i++) {
      File imageFile = delNotes[i];
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var image = http.MultipartFile('Steel_del_notes[$i]', stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(image);
    }

    request.files.addAll(newList);

    request.fields['order_id'] = orderId;
    request.fields['user_id'] = userId;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Image Uploaded', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<void> setInvoicesSteelOrder(
      String orderId, String userId, List<File>? steelInvoice) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/Steel_invoices_post_api";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < steelInvoice!.length; i++) {
      File imageFile = steelInvoice[i];
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var image = http.MultipartFile('Steel_invoices[$i]', stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(image);
    }

    request.files.addAll(newList);

    request.fields['order_id'] = orderId;
    request.fields['user_id'] = userId;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils()
          .showToast('Steel Invoice Updated', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong $response');
    }
  }

  Future<List<CompletedSteelOrdersModel>> getCompletedSteelOrders(
      String dealerId) async {
    var response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/closeSteelorders/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<CompletedSteelOrdersModel> list = jsonResponse.map((orders) {
        return CompletedSteelOrdersModel.fromJson(orders);
      }).toList();

      return list;
    } else {
      throw Exception('Failed to fetch data $response');
    }
  }

  Future<void> ManualFileUploadSteelOrder(
      String orderId, String id, List<File>? fileToUpload) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/manual_stell_pdf_upload_post_api";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      File imageFile = fileToUpload[i];
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var image = http.MultipartFile(
          "manual_stell_pdf_upload[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(image);
    }

    request.files.addAll(newList);

    request.fields['order_id'] = orderId;
    request.fields['user_id'] = id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils()
          .showToast('Manual File Uploaded', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> setAnticipatedDate(String uid, String qid, DateTime date) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/date_steel_fac_delivery_weeks_post_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": qid,
      "steel_Fac_week_val": DateFormat('yyyy-MM-dd').format(date),
      "user_id": uid
    });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Anticipated Date set', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<QuoteAnalysis> getQuotesRecord(String dealerId, String quoteId) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/Quote_analysis_api/${dealerId}/${quoteId}";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print("quotes record ${response.body}");
      return QuoteAnalysis.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }

  ///////////////////// admin panel APIs
  ///
  ///
  ///
  ///
  ///
  ///

  Future<List<CompleteResponse>> getAdminQuotes({String? searchQuery}) async {
    final apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_quotes/1";

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<CompleteResponse> quotes = [];

      data.forEach((key, value) {
        CompleteResponse completeResponse = CompleteResponse.fromJson(value);

        quotes.add(completeResponse);
      });

      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerSearchQuery = searchQuery.toLowerCase();

        quotes = quotes.where((quote) {
          bool matchesDisplayName = quote.displayName != null &&
              quote.displayName!.toLowerCase().contains(lowerSearchQuery);

          var filterNestedOrders = quote.quotes.where((nestedOrder) {
            return nestedOrder.id != null &&
                nestedOrder.id!.toLowerCase().contains(lowerSearchQuery);
          }).toList();

          bool hasMatchingOrders = filterNestedOrders.isNotEmpty;

          if (hasMatchingOrders) {
            quote.quotes = filterNestedOrders;
          }

          return matchesDisplayName || hasMatchingOrders;
        }).toList();
      }

      // quotes.forEach((element) {
      //   element.quotes.sort((a, b) {
      //     DateTime aDate = DateTime.parse(a.date!);
      //     DateTime bDate = DateTime.parse(b.date!);
      //     return bDate.compareTo(aDate);
      //   });
      // });

      return quotes;
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  Future<List<OrdersCompleteResponse>> getAdminOrders(
      {String? searchQuery}) async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_orders/1";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<OrdersCompleteResponse> orders = [];
      data.forEach((key, value) {
        OrdersCompleteResponse completeResponse =
            OrdersCompleteResponse.fromJson(value);

        orders.add(completeResponse);
      });

      // If searchQuery is provided, filter the orders
      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerSearchQuery = searchQuery.toLowerCase();

        orders = orders.where((order) {
          // Check if the displayName contains the query
          bool matchesDisplayName = order.displayName != null &&
              order.displayName!.toLowerCase().contains(lowerSearchQuery);

          // Filter the nested orders array to include only those that match the query
          var filteredNestedOrders = order.orders.where((nestedOrder) {
            return nestedOrder.id != null &&
                nestedOrder.id!.toLowerCase().contains(lowerSearchQuery);
          }).toList();

          // Check if any nested orders remain after filtering
          bool hasMatchingNestedOrders = filteredNestedOrders.isNotEmpty;

          // Update the orders list with filtered nested orders
          if (hasMatchingNestedOrders) {
            order.orders = filteredNestedOrders;
          }

          return matchesDisplayName || hasMatchingNestedOrders;
        }).toList();
      }

      // Sort the nested orders by date after filtering
      orders.forEach((completeResponse) {
        completeResponse.orders.sort((a, b) {
          DateTime aDate = DateTime.parse(a.date!);
          DateTime bDate = DateTime.parse(b.date!);
          return bDate.compareTo(aDate);
        });
      });

      return orders;
    } else {
      throw Exception('something went wrong');
    }
  }

  // Future<List<OrdersCompleteResponse>> getAdminOrders(
  //     {String? searchQuery}) async {
  //   var apiUrl =
  //       "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_orders/1";

  //   var response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);

  //     List<OrdersCompleteResponse> orders = [];
  //     data.forEach((key, value) {
  //       OrdersCompleteResponse completeResponse =
  //           OrdersCompleteResponse.fromJson(value);

  //       completeResponse.orders.sort((a, b) {
  //         DateTime aDate = DateTime.parse(a.date!);
  //         DateTime bDate = DateTime.parse(b.date!);
  //         return bDate.compareTo(aDate);
  //       });

  //       orders.add(completeResponse);

  //       // orders.map((or) {
  //       //   or.orders.sort((a, b) {
  //       //     DateTime aDate = DateTime.parse(a.date!);
  //       //     DateTime bDate = DateTime.parse(b.date!);
  //       //     return bDate.compareTo(aDate);
  //       //   });
  //       // });
  //     });

  //     // orders.forEach((element) {
  //     //   element.orders.sort((a, b) {
  //     //     DateTime aDate = DateTime.parse(a.date ?? "");
  //     //     DateTime bDate = DateTime.parse(b.date ?? "");
  //     //     return bDate.compareTo(aDate);
  //     //   });
  //     // });

  //     // orders.sort((a, b) {
  //     //   DateTime aDate = a.orders.isNotEmpty
  //     //       ? DateTime.parse(a.orders.first.date ?? "")
  //     //       : DateTime.now();
  //     //   DateTime bDate = b.orders.isNotEmpty
  //     //       ? DateTime.parse(b.orders.first.date ?? "")
  //     //       : DateTime.now();
  //     //   return bDate.compareTo(aDate);
  //     // });

  //     if (searchQuery != null && searchQuery.isNotEmpty) {
  //       orders = orders.where((order) {
  //         return order.orders.any((nestedOrder) {
  //           return nestedOrder.id!
  //               .toLowerCase()
  //               .contains(searchQuery.toLowerCase());
  //         });
  //       }).toList();
  //     }

  //     return orders;
  //   } else {
  //     throw Exception('something went wrong');
  //   }
  // }

  Future<List<CompletedSteelOrdersResponse>> getSteelOrdersForAdmin(
      {String? searchQuery}) async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_steelorders/1";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      List<CompletedSteelOrdersResponse> steelorders = [];
      data.forEach((key, value) {
        steelorders.add(CompletedSteelOrdersResponse.fromJson(value));
      });

      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerCaseQuery = searchQuery.toLowerCase();

        steelorders = steelorders.where((steelorder) {
          bool matchesDisplayName = steelorder.displayName != null &&
              steelorder.displayName!.contains(lowerCaseQuery);

          var filterNestedOrders =
              steelorder.steelOrders!.where((nestedSteelOrder) {
            return nestedSteelOrder.steelQNumber!
                .toLowerCase()
                .contains(lowerCaseQuery);
          }).toList();

          bool hasMatchingOrders = filterNestedOrders.isNotEmpty;

          if (hasMatchingOrders) {
            steelorder.steelOrders = filterNestedOrders;
          }

          return matchesDisplayName || hasMatchingOrders;
        }).toList();
      }

      // steelorders.forEach((completeResponse) {
      //   completeResponse.steelOrders!.sort((a, b) {
      //     DateTime aDate = DateTime.parse(a.date ?? "");
      //     DateTime bDate = DateTime.parse(b.date ?? "");
      //     return bDate.compareTo(aDate);
      //   });
      // });

      // steelorders.sort((a, b) {
      //   DateTime aDate = a.steelOrders!.isNotEmpty
      //       ? DateTime.parse(a.steelOrders!.first.date ?? "")
      //       : DateTime.now();
      //   DateTime bDate = b.steelOrders!.isNotEmpty
      //       ? DateTime.parse(b.steelOrders!.first.date ?? "")
      //       : DateTime.now();
      //   return bDate.compareTo(aDate);
      // });

      print("steel orders after looping: ${steelorders.length}");

      return steelorders;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<CompleteResponseOfEnquiries>> getAdminPanelEnquiries(
      {String? searchQuery}) async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_enquries/1";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<CompleteResponseOfEnquiries> dealerDataList = [];

      data.forEach((key, value) {
        dealerDataList.add(CompleteResponseOfEnquiries.fromJson(value));
      });

      if (searchQuery != null && searchQuery.isNotEmpty) {
        String lowerSearchQuery = searchQuery.toLowerCase();

        dealerDataList = dealerDataList.where((quote) {
          bool matchesDisplayName =
              quote.displayName.toLowerCase().contains(lowerSearchQuery);

          var filterNestedOrders = quote.quotes.where((nestedOrder) {
            return nestedOrder.enquiryCustomerEmail != null &&
                nestedOrder.enquiryCustomerEmail!
                    .toLowerCase()
                    .contains(lowerSearchQuery);
          }).toList();

          bool hasMatchingOrders = filterNestedOrders.isNotEmpty;

          if (hasMatchingOrders) {
            // quote. = filterNestedOrders;
            quote.quotes = filterNestedOrders;
          }

          return matchesDisplayName || hasMatchingOrders;
        }).toList();
      }

      // dealerDataList.forEach((completeResponse) {
      //   completeResponse.quotes.sort((a, b) {
      //     DateTime aDate = DateTime.parse(a.date ?? "");
      //     DateTime bDate = DateTime.parse(b.date ?? "");
      //     return bDate.compareTo(aDate);
      //   });
      // });

      // dealerDataList.sort((a, b) {
      //   DateTime aDate = a.quotes.isNotEmpty
      //       ? DateTime.parse(a.quotes.first.date ?? "")
      //       : DateTime.now();

      //   DateTime bDate = b.quotes.isNotEmpty
      //       ? DateTime.parse(b.quotes.first.date ?? "")
      //       : DateTime.now();
      //   return bDate.compareTo(aDate);
      // });

      return dealerDataList;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<CompleteResponseOfHotLeads>> getHotLeadsForAdmin() async {
    var apiurl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_Hotleads/1";

    var response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<CompleteResponseOfHotLeads> hotleads = [];

      data.forEach((key, value) {
        hotleads.add(CompleteResponseOfHotLeads.fromJson(value));
      });

      return hotleads;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<CompleteResponseForCompletedOrders>>
      getCompletedOrdersForAdmin() async {
    var apiurl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_completedOrders/1";

    var response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<CompleteResponseForCompletedOrders> completedorders = [];

      data.forEach((key, value) {
        completedorders.add(CompleteResponseForCompletedOrders.fromJson(value));
      });

      return completedorders;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> createEnquiriesForAdmin(
      String userId,
      String type,
      String dealer,
      String enquiryAllocatedTo,
      String enquiryEntered,
      String requirement,
      String cus_name,
      String company,
      String supply_type,
      String address,
      String address2,
      String address3,
      String address4,
      String postcode,
      String cus_email,
      String telephone,
      String priority,
      List<File>? fileToUpload,
      List<File>? doorDesignFile,
      String notes,
      String source) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/create_enquries";

    var result = http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];
    List<http.MultipartFile> doorDesignFileList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = fileToUpload[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
          "EnquiryfileToUpload[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      newList.add(multipartFile);
    }

    for (int i = 0; i < doorDesignFile!.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = doorDesignFile[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
          "EnquirydoorsedignfileToUpload[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      doorDesignFileList.add(multipartFile);
    }

    result.files.addAll(newList);
    result.files.addAll(doorDesignFileList);

    result.fields["user_id"] = userId;
    result.fields["enquiry_type"] = type;
    result.fields['enquiry_allocated_to'] = enquiryAllocatedTo;
    result.fields["enquiry_dealer"] = dealer;
    result.fields["enquiry_entered"] = enquiryEntered;
    result.fields["enquiry_requirement"] = requirement;
    result.fields["enquiry_cus_name"] = cus_name;
    result.fields["enquiry_company_name"] = company;
    result.fields["enquiry_supply_type"] = supply_type;
    result.fields["customer_address"] = address;
    result.fields["customer_address_2"] = address2;
    result.fields["customer_address_3"] = address3;
    result.fields["customer_address_4"] = address4;
    result.fields["dilevery_post_code_c13"] = postcode;
    result.fields["enquiry_cus_email"] = cus_email;
    result.fields["enquiry_tel_num"] = telephone;
    result.fields["enquiry_priorityLevel"] = priority;
    result.fields["enquiry_notes"] = notes;
    result.fields["enquiry_source"] = source;

    //result.files.add(multiport);

    var response = await result.send();

    if (response.statusCode == 200) {
      print('uploaded file path: ${fileToUpload}');
      Utils().showToast('Enquiry Created', Color(0xff941420), Colors.white);
    } else {
      //print('multiport path:  ${multiport.filename}');
      print('Something went wrong ${response.statusCode}');
    }

    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });
  }

  Future<void> createSteelOrderForAdmin(
      String dealerId,
      type,
      cname,
      qnum,
      dealer,
      salesperson,
      supply,
      address1,
      address2,
      address3,
      postcode,
      color,
      frame,
      cusEmail,
      telephone,
      totalOrderValue,
      discount,
      deliveryCost,
      weight,
      netOrderValue,
      List<File>? fileToUpload,
      String notes,
      String customHandle) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/save_steel_orderApi";

    var request = await http.MultipartRequest('POST', Uri.parse(apiUrl));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload!.length; i++) {
      File imageFile = fileToUpload[i];

      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartfile = http.MultipartFile(
          "fileToUploadPdf[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      newList.add(multipartfile);
    }

    request.files.addAll(newList);

    request.fields["user_id"] = dealerId;
    request.fields["product_type"] = type;
    request.fields["steel_customer_name"] = cname;
    request.fields["steel_q_number"] = qnum;
    request.fields["steel_saleperson"] = dealer;
    request.fields["steel_dealer_email"] = salesperson;
    request.fields["steel_supply_type"] = supply;
    request.fields["customer_address"] = address1;
    request.fields["customer_address_2"] = address2;
    request.fields["customer_address_3"] = address3;
    request.fields["dilevery_post_code_c13"] = postcode;
    request.fields["steel_color"] = color;
    request.fields["steel_frameSize"] = frame;
    request.fields["steel_customer_email"] = cusEmail;
    request.fields["steel_customer_tel"] = telephone;
    request.fields["steel_total_order_value"] = totalOrderValue;
    request.fields["steel_discount"] = discount;
    request.fields["steel_delivery_cost"] = deliveryCost;
    request.fields["steel_weight"] = weight;
    request.fields["steel_order_net_val"] = netOrderValue;
    request.fields["Notes"] = notes;
    request.fields["steel_custom_handle"] = customHandle;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Steel Order Created', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<List<AllDealersModel>> getAllDealers() async {
    var response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/All_dealers_from_admin/1'));

    final body = json.decode(response.body) as List;
    if (response.statusCode == 200) {
      return body.map((e) {
        final map = e as Map<String, dynamic>;
        return AllDealersModel(iD: map['ID'], name: map['name']);
      }).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<AdminModel>> getAllAdmins() async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_administrators/1";

    var response = await http.get(Uri.parse(apiUrl));

    final body = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      return body.map((e) {
        final map = e as Map<String, dynamic>;
        return AdminModel(
            iD: map['ID'],
            name: map['name'],
            postCode: map['post_code_register'],
            email: map['email'],
            registeredUser: map['user_registered']);
      }).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<ClosedSteelOrders>> getAllCompletedSteelOrders() async {
    var apiurl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_closeSteelArray/1";

    var response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<ClosedSteelOrders> completeSteelOrders = [];

      data.forEach((key, value) {
        completeSteelOrders.add(ClosedSteelOrders.fromJson(value));
      });

      return completeSteelOrders;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<ClosedResponseOfEnquiries>> getAdminClosedEnquiries() async {
    var apiurl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_closeEnqries/1";

    var response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<ClosedResponseOfEnquiries> closedEnquiries = [];

      data.forEach((key, value) {
        closedEnquiries.add(ClosedResponseOfEnquiries.fromJson(value));
      });

      return closedEnquiries;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<DealersList>> getDealersListForAdmin() async {
    var apiUrl =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_all_dealer_details/1";

    var response = await http.get(Uri.parse(apiUrl));

    final body = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      return body.map((e) {
        final map = e as Map<String, dynamic>;
        return DealersList(
            iD: map['ID'],
            name: map['name'],
            dealerName: map['dealerName'],
            email: map['email'],
            dealerAddress1: map['DealerAddress1'],
            dealerAddress2: map['DealerAddress2'],
            dealerAddress3: map['DealerAddress3'],
            postCodeRegister: map['post_code_register'],
            dealerType: map['dealerType'],
            telephone: map['telephone'],
            userRegistered: map['user_registered'],
            lDealer: map['l_dealer'],
            lStatus: map['l_status'],
            lDate: map['l_date'],
            supportMember: map['support_member'],
            marketingImages: map['marketing_images'],
            userMarketingRecord: map['user_marketing_record']);
      }).toList();
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<void> setEnquiryConfigCode(String qid, String code, int userId) async {
    var apiuRL =
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_enquiry_conf_code";
    var response = await http.post(Uri.parse(apiuRL), body: {
      "q_id": qid.toString(),
      "enquiry_conf_code": code.toString(),
      "user_id": userId.toString()
    });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Configurator code set', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setEnquiryOrderConfFile(
      String qid, int userId, List<File> fileToUpload) async {
    var result = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_enquiry_Order_Conf_File"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = fileToUpload[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
          "enquiry_Order_Conf_File[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      newList.add(multipartFile);
    }

    result.files.addAll(newList);

    result.fields['user_id'] = userId.toString();
    result.fields['order_id'] = qid;

    var response = await result.send();

    if (response.statusCode == 200) {
      Utils().showToast('Enquiry File added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setOrderNum(String qid, int userId, String orderVal) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_order_no"),
        body: {
          "q_id": qid,
          "order_no_val": orderVal,
          "user_id": userId.toString()
        });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Fcatory Order No. set', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setOrderStatus(String qid, int userId, String orderVal) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_order_status"),
        body: {
          "q_id": qid,
          "order_status_val": orderVal,
          "user_id": userId.toString()
        });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Order status updated', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setPaymentStatus(String qid, int userId, String orderVal) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_order_payment_status"),
        body: {
          "q_id": qid,
          "order_payment_status_val": orderVal,
          "user_id": userId.toString()
        });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Order status updated', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> OrderDocumentUpload(
      String qid, int userId, List<File> fileToUpload) async {
    var result = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_document_upload"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = fileToUpload[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile("documents[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      newList.add(multipartFile);
    }

    result.files.addAll(newList);

    result.fields['user_id'] = userId.toString();
    result.fields['order_id'] = qid;

    var response = await result.send();

    if (response.statusCode == 200) {
      Utils().showToast('Enquiry File added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> manualQuickDocUpload(
      String order_id, int user_id, List<File> fileToUpload) async {
    var result = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_manual_quick_document_upload"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      //File imageFile = File(fileToUpload[i]);
      File imageFile = fileToUpload[i];
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
          "manual_quick_document_upload[$i]", stream, length,
          filename: imageFile.path.split("/").last);
      print(imageFile.path);
      newList.add(multipartFile);
    }

    result.files.addAll(newList);

    result.fields['user_id'] = user_id.toString();
    result.fields['order_id'] = order_id;

    var response = await result.send();

    if (response.statusCode == 200) {
      Utils().showToast('Enquiry File added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setAnticipatedDateForAdmin(
      int uid, String qid, DateTime date) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/admin_set_anticipated_date";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": qid,
      "anticipated_date_val": DateFormat('yyyy-MM-dd').format(date),
      "user_id": uid.toString()
    });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Anticipated Date set', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> setInvoiceDocumentForAdmin(
      String order_id, int user_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_invoices_upload"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "invoices_documents[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils()
          .showToast('Invoice Document Added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setDeliveryDocForAdmin(
      int user_id, String order_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_delivery_notes_upload"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "delivery_documents[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast(
          'Delivery Document Added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setFacDeliveryWeekValue(
      String qid, int userId, String facValue) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_fac_delivery_weeks"),
        body: {
          "q_id": qid,
          "fac_delivery_weeks_val": facValue,
          "user_id": userId.toString()
        });

    if (response.statusCode == 200) {
      Utils().showToast('Factory Delivery Week Value updated',
          Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setFactoryConfirmationDoc(
      String order_id, int user_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_fac_conf_documents"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "fac_conf_documents[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Factory Confirmation Document Added',
          Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setOrderDateForAdmin(int uid, String qid, DateTime date) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/admin_set_order_date";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": qid,
      "order_val": DateFormat('yyyy-MM-dd').format(date),
      "user_id": uid.toString()
    });

    if (response.statusCode == 200) {
      Utils().showToast('Order Date set', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> setFollowUpForAdmin(
      int userId, String qid, String FupValue) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_order_followup"),
        body: {
          "q_id": qid,
          "order_f_up_val": FupValue,
          "user_id": userId.toString()
        });

    if (response.statusCode == 200) {
      Utils().showToast('Factory Delivery Week Value updated',
          Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setNotesValueForAdmin(
      String qid, int userId, String notes) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_Set_order_Notes"),
        body: {"q_id": qid, "notes": notes, "user_id": userId.toString()});

    if (response.statusCode == 200) {
      Utils().showToast('Notes Value updated', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> CloseOrderFromAdmin(int userId, String order_id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_close_order"),
        body: {"order_id": order_id, "user_id": userId.toString()});

    if (response.statusCode == 200) {
      Utils().showToast(
          'Order Saved to Completed Orders', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> DeleteOrderFromAdmin(int userId, String order_id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_delete_order"),
        body: {"order_id": order_id, "user_id": userId.toString()});

    if (response.statusCode == 200) {
      Utils().showToast('Order Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setFactoryOrderNoForAdmin(
      int userid, String order_id, String steelOrderVal) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_steel_fac_order_no"),
        body: {
          "order_id": order_id,
          "user_id": userid.toString(),
          "steel_fac_order_no_val": steelOrderVal
        });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Factory Order No Added', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setSteelOrderStatusForAdmin(
      int userid, String order_id, String steelOrderStatus) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_steel_order_status"),
        body: {
          "q_id": order_id,
          "user_id": userid.toString(),
          "steel_order_status_val": steelOrderStatus
        });

    if (response.statusCode == 200) {
      Utils().showToast(
          'Steel Order Status Updated', Color(0xff941420), Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setSteelPaymentStatus(
      int userid, String order_id, String steelOrderStatus) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_steel_order_status"),
        body: {
          "q_id": order_id,
          "user_id": userid.toString(),
          "steel_order_payment_status_val": steelOrderStatus
        });

    if (response.statusCode == 200) {
      Utils().showToast('Steel Order Payment Status Updated', Color(0xff941420),
          Colors.white);
    } else {
      print('Soething went wrong');
    }
  }

  Future<void> setSteelOrderConfFile(
      String order_id, int user_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/Steel_Order_Conf_File_api"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "Steel_Order_Conf_File[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast(
          'Order Confirmation Document Added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setSteelOrderAnticipatedDate(
      int uid, String qid, DateTime date) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/admin_set_steel_anticipated_date";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": qid,
      "steel_anticipated_date": DateFormat('yyyy-MM-dd').format(date),
      "user_id": uid.toString()
    });

    if (response.statusCode == 200) {
      Utils()
          .showToast('Anticipated Date set', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> setSteelInvoicesForAdmin(
      int user_id, String order_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/Steel_invoices_post_api"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "Steel_invoices[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Invoice Added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setSteelDeliveryNotes(
      int user_id, String order_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/Steel_del_notes_post_api"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "Steel_del_notes[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils()
          .showToast('Delivery Notes Added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setSteelFactoryDeliveryWeek(
      int user_id, String order_id, String facWeekVal) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/admin_set_anticipated_date";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": order_id,
      "steel_Fac_week_val": facWeekVal,
      "user_id": user_id.toString()
    });

    if (response.statusCode == 200) {
      Utils().showToast('Factory Delivery Week Value updated',
          Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> setFileUploadForAdmin(
      int user_id, String order_id, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/manual_stell_pdf_upload_post_api"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "manual_stell_pdf_upload[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['user_id'] = user_id.toString();
    request.fields['order_id'] = order_id;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils()
          .showToast('Manual File Uploaded', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setSteelOrderNotes(
      int user_id, String order_id, String notes) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/steel_Notes_api";

    var response = await http.post(Uri.parse(apiUrl), body: {
      "q_id": order_id,
      "notes": notes,
      "user_id": user_id.toString()
    });

    if (response.statusCode == 200) {
      Utils().showToast('Notes updated', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> completeSteelOrderForAdmin(int user_id, String order_id) async {
    var apiUrl =
        "https://pricelink.net/wp-json/mobile_api/v1/steel_close_orderapi";

    var response = await http.post(Uri.parse(apiUrl),
        body: {"order_id": order_id, "user_id": user_id.toString()});

    if (response.statusCode == 200) {
      Utils().showToast(
          'Added to Completed Steel Order', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong $response');
    }
  }

  Future<void> updateSteelOrderOfAdmin(
      String quoteId,
      String type,
      String qnum,
      String salesperson,
      String dealerEmail,
      String dealerTel,
      String postCode,
      String supply,
      String cusName,
      String color,
      address,
      address2,
      address3,
      String saleBonus,
      int userid,
      String cusEmail,
      String custel,
      String totalOrderValue,
      String discount,
      String weight,
      String deliveryCost,
      String instCost,
      String netOrderVal,
      String frameSize,
      String supplier,
      String notes) async {
    var response = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/update_steel_orderapi"),
        body: {
          "id": quoteId,
          "product_type": type,
          "steel_q_number": qnum,
          "steel_saleperson": salesperson,
          "steel_dealer_email": dealerEmail,
          "steel_dealer_telno": dealerTel,
          "dilevery_post_code_c13": postCode,
          "steel_supply_type": supply,
          "steel_customer_name": cusName,
          "steel_color": color,
          "customer_address": address,
          "customer_address_2": address2,
          "customer_address_3": address3,
          "sale_bonus": saleBonus,
          "user_id": userid.toString(),
          "steel_customer_email": cusEmail,
          "steel_customer_tel": custel,
          "steel_total_order_value": totalOrderValue,
          "steel_discount": discount,
          "steel_weight": weight,
          "steel_delivery_cost": deliveryCost,
          "steel_inst_cost": instCost,
          "steel_order_net_val": netOrderVal,
          "steel_frameSize": frameSize,
          "steel_supplier": supplier,
          "steel_form_notes": notes
        });

    if (response.statusCode == 200) {
      Utils().showToast('Updated', Color(0xff941420), Colors.white);
    } else {
      print("something went wrong");
    }
  }

  Future<void> createAdministrator(
      String firstname, lastname, postcode, telephone, email, password) async {
    var response = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_api_create_administration"),
        body: {
          "firstname": firstname,
          "lastname": lastname,
          "post_code_register": postcode,
          "telephone": telephone,
          "email": email,
          "password": password,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Admin created', Color(0xff941420), Colors.white);
    } else {
      print("something went wrong");
    }
  }

  Future<void> sendUpdatesForAdmin(String value) async {
    var response = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_send_updates"),
        body: {"user_val": value});

    if (response.statusCode == 200) {
      Utils().showToast('Update Added', Color(0xff941420), Colors.white);
    } else {
      print("something went wrong");
    }
  }

  Future<String> getSubFolder1Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_1/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder2Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_2/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder3Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_3/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder4Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_4/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder5Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_5/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder6Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_6/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder7Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_7/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder8Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_8/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder9Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_9/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<String> getSubFolder10Downloads() async {
    var response = await http.get(Uri.parse(
        "https://www.pricelink.net/wp-json/mobile_api/v1/admin_get_edit_sub_folder_10/1"));

    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<void> updateSubFolder1(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder1"),
        body: {"Set_folder_name": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder2(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder2"),
        body: {"Set_folder_name_2": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder3(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder3"),
        body: {"Set_folder_name_3": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder4(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder4"),
        body: {"Set_folder_name_4": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder5(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder5"),
        body: {"Set_folder_name_5": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder6(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder6"),
        body: {"Set_folder_name_6": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder7(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder7"),
        body: {"Set_folder_name_7": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder8(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder8"),
        body: {"Set_folder_name_8": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder9(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder9"),
        body: {"Set_folder_name_9": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateSubFolder10(String val) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_EditSubFolder10"),
        body: {"Set_folder_name_10": val});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Subfolder name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name"),
        body: {"u_id": id, "new_folder_name": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName2(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name2"),
        body: {"u_id": id, "new_folder_name2": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory2(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames2"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName3(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name3"),
        body: {"u_id": id, "new_folder_name3": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory3(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames3"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName4(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name4"),
        body: {"u_id": id, "new_folder_name4": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory4(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames4"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName5(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name5"),
        body: {"u_id": id, "new_folder_name5": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory5(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames5"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName6(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name6"),
        body: {"u_id": id, "new_folder_name6": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory6(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames6"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName7(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name7"),
        body: {"u_id": id, "new_folder_name7": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory7(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames7"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName8(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name8"),
        body: {"u_id": id, "new_folder_name8": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory8(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames8"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName9(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name9"),
        body: {"u_id": id, "new_folder_name9": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory9(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames9"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> updateDirectoryName10(String id, String value) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_edit_folder_name10"),
        body: {"u_id": id, "new_folder_name10": value});

    if (response.statusCode == 200) {
      Utils()
          .showToast('Directory Name changed', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> deleteWholeDirectory10(String id) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_deletesubFoldersnames10"),
        body: {
          "u_id": id,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Directory Deleted', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addSubFolders(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name'] = name;
    request.fields['file_number'] = number;
    request.fields['file_description'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addInsideFolder(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder"),
        body: {
          "sub_folder_name": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder2(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder2"),
        body: {
          "sub_folder_name2": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder3(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder3"),
        body: {
          "sub_folder_name3": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder4(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder4"),
        body: {
          "sub_folder_name4": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder5(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder5"),
        body: {
          "sub_folder_name5": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder6(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder6"),
        body: {
          "sub_folder_name6": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder7(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder7"),
        body: {
          "sub_folder_name7": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder8(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder8"),
        body: {
          "sub_folder_name8": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder9(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder9"),
        body: {
          "sub_folder_name9": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addInsideFolder10(String folderName) async {
    var response = await http.post(
        Uri.parse(
            "https://www.pricelink.net/wp-json/mobile_api/v1/admin_set_downloads_main_folder10"),
        body: {
          "sub_folder_name10": folderName,
        });

    if (response.statusCode == 200) {
      Utils().showToast('Category Added', Color(0xff941420), Colors.white);
    } else {
      print('Something went wrong');
    }
  }

  Future<void> addSubFolders2(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload2"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents2[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name2'] = name;
    request.fields['file_number2'] = number;
    request.fields['file_description2'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders3(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload3"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents2[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name3'] = name;
    request.fields['file_number3'] = number;
    request.fields['file_description3'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders4(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload4"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents4[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name4'] = name;
    request.fields['file_number4'] = number;
    request.fields['file_description4'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders5(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload5"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents5[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name5'] = name;
    request.fields['file_number5'] = number;
    request.fields['file_description5'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders6(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload6"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents6[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name6'] = name;
    request.fields['file_number6'] = number;
    request.fields['file_description6'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders7(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload7"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents7[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name7'] = name;
    request.fields['file_number7'] = number;
    request.fields['file_description7'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders8(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload8"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents8[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name8'] = name;
    request.fields['file_number8'] = number;
    request.fields['file_description8'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders9(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload9"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents9[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name9'] = name;
    request.fields['file_number9'] = number;
    request.fields['file_description9'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> addSubFolders10(
      String name, number, description, List<File> fileToUpload) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_subFolder_doc_upload10"));

    List<http.MultipartFile> newList = [];

    for (int i = 0; i < fileToUpload.length; i++) {
      File docFile = fileToUpload[i];
      var stream = new http.ByteStream(docFile.openRead());
      var length = await docFile.length();
      var multipartFile = http.MultipartFile(
          "subfolders_documents10[$i]", stream, length,
          filename: docFile.path.split("/").last);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

    request.fields['folders_name10'] = name;
    request.fields['file_number10'] = number;
    request.fields['file_description10'] = description;

    var response = await request.send();

    if (response.statusCode == 200) {
      Utils().showToast('Subfolder added', Color(0xff941420), Colors.white);
    } else {
      print('something went wrong');
    }
  }

  Future<void> setFollowUpDateForAdmin(
      String qid, int userId, DateTime date) async {
    var request = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_quote_followupDate"),
        body: {
          "q_id": qid,
          "user_id": userId.toString(),
          "order_date_q_array": DateFormat('yyyy-MM-dd').format(date)
        });

    if (request.statusCode == 200) {
      Utils().showToast('Date updated', Color(0xff941420), Colors.white);
    } else {
      print('something went wrng');
    }
  }

  Future<void> setFollowUpValueForAdmin(
      String qid, int userId, String value) async {
    var request = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_quote_f_up_q_val"),
        body: {
          "q_id": qid,
          "user_id": userId.toString(),
          "order_f_up_q_val": value
        });

    if (request.statusCode == 200) {
      Utils().showToast('Value updated', Color(0xff941420), Colors.white);
    } else {
      print('something went wrng');
    }
  }

  Future<void> setNotesForAdmin(String qid, int userId, String notes) async {
    var request = await http.post(
        Uri.parse(
            "https://pricelink.net/wp-json/mobile_api/v1/admin_set_quote_f_up_q_val"),
        body: {"q_id": qid, "user_id": userId.toString(), "q_val": notes});

    if (request.statusCode == 200) {
      Utils().showToast('Notes updated', Color(0xff941420), Colors.white);
    } else {
      print('something went wrng');
    }
  }

  Future<List<ArchiveEnquiriesModel>> getArchiveEnquiries() async {
    var response = await http.get(Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/admin_get_all_archive_enquiries/1"));

    if (response.statusCode == 200) {
      List<dynamic> enquiries = jsonDecode(response.body);

      List<ArchiveEnquiriesModel> archives = enquiries
          .map((data) => ArchiveEnquiriesModel.fromJson(data))
          .toList();

      archives.sort((a, b) {
        DateTime aDate = DateTime.parse(a.date ?? "");
        DateTime bDate = DateTime.parse(b.date ?? "");
        return bDate.compareTo(aDate);
      });

      return archives;
    } else {
      throw Exception("something went wrong");
    }
  }

  Future<List<ArchiveOrdersModel>> getArchiveOrders() async {
    var response = await http.get(Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/admin_get_all_archive_orders/1"));

    if (response.statusCode == 200) {
      List<dynamic> orders = jsonDecode(response.body);

      List<ArchiveOrdersModel> ordersData =
          orders.map((data) => ArchiveOrdersModel.fromJson(data)).toList();

      return ordersData;
    } else {
      throw Exception("something went wrong");
    }
  }

  Future<List<ArchiveSteelOrdersModel>> getArchiveSteelOrders() async {
    var response = await http.get(Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/admin_get_all_archive_steel_orders/1"));

    if (response.statusCode == 200) {
      List<dynamic> orders = jsonDecode(response.body);

      List<ArchiveSteelOrdersModel> ordersData =
          orders.map((data) => ArchiveSteelOrdersModel.fromJson(data)).toList();

      return ordersData;
    } else {
      throw Exception("something went wrong");
    }
  }

  Future<List<ArchiveQuotationsModel>> getArchiveQuotations() async {
    var response = await http.get(Uri.parse(
        "https://pricelink.net/wp-json/mobile_api/v1/admin_get_all_archive_quotes/1"));

    if (response.statusCode == 200) {
      List<dynamic> orders = jsonDecode(response.body);

      List<ArchiveQuotationsModel> ordersData =
          orders.map((data) => ArchiveQuotationsModel.fromJson(data)).toList();

      ordersData.sort((a, b) {
        DateTime aDate = DateTime.parse(a.date ?? "");
        DateTime bDate = DateTime.parse(b.date ?? "");
        return bDate.compareTo(aDate);
      });

      return ordersData;
    } else {
      throw Exception("something went wrong");
    }
  }
}
