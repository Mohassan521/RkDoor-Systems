import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkApiServices {
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
        print('user nested data present: $userNestedData');

        final userDataProvider =
            Provider.of<UserLoginData>(context, listen: false);

        loginDataModel dataModel = loginDataModel(
            id: userNestedData['ID'],
            userEmail: userNestedData['user_email'],
            displayName: userNestedData['display_name'],
            userNicename: userNestedData['user_nicename']);

        userDataProvider.setUserData(dataModel);

        String user_id = userNestedData['ID'];
        final String userEmail = userNestedData['user_email'];
        String userName = userNestedData['display_name'];
        //print(userName);
        prefs.setString('username', userName);
        prefs.setString('user_id', user_id);
        prefs.setString('userEmail', userEmail);
        prefs.setBool('isLogin', true);

        String userId = prefs.getString('user_id') ?? '';
        String user = prefs.getString('username') ?? '';

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardPage(
                      dealer_name: user,
                      dealer_id: userId,
                    )));

        print('Login successful with $userId');
        print('Login successful with username $userName');
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
      File fileToUpload,
      String notes,
      String source,
      String allocatedTo) async {
    var apiUrl = "https://pricelink.net/wp-json/mobile_api/v1/create_enquries";

    var result = http.MultipartRequest('POST', Uri.parse(apiUrl));

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

    var stream = new http.ByteStream(fileToUpload.openRead());

    var length = await fileToUpload.length();

    var multiport = new http.MultipartFile('enquiryFileUpload', stream, length,
        filename: fileToUpload.path.split("/").last);

    result.files.add(multiport);

    var response = await result.send();

    if (response.statusCode == 200) {
      Utils().showToast('Enquiry Created', Color(0xff941420), Colors.white);
    } else {
      print('multiport path:  ${multiport.filename}');
      print('Something went wrong ${response.statusCode}');
    }
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

  Future<List<EnquiriesModel>> getAllEnquiries(String dealerId) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/enquries/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      //print(jsonResponse);
      // Map each item in the JSON array to a enquiries object
      List<EnquiriesModel> enquiries = jsonResponse.map((data) {
        return EnquiriesModel.fromJson(data);
      }).toList();

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

      //print(jsonResponse);
      // Map each item in the JSON array to a enquiries object
      List<OrdersModel> orders = jsonResponse.map((data) {
        return OrdersModel.fromJson(data);
      }).toList();

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

      //print('Dealer Name: ${jsonResponse[0]['dealerName']}');

      return dealers;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<QuotationsModel>> getQuotationsList(String? dealerId) async {
    final response = await http.get(Uri.parse(
        'https://www.pricelink.net/wp-json/mobile_api/v1/quotations/$dealerId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      List<QuotationsModel> quotes = jsonResponse.map((data) {
        return QuotationsModel.fromJson(data);
      }).toList();

      return quotes;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<SteelOrderModel>> allSteelOrders(String dealerId) async {
    final response = await http.get(Uri.parse(
        'https://pricelink.net/wp-json/mobile_api/v1/steelorders/${dealerId}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);

      //print(jsonResponse);
      // Map each item in the JSON array to a enquiries object
      List<SteelOrderModel> steelOrders = jsonResponse.map((data) {
        return SteelOrderModel.fromJson(data);
      }).toList();

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
        return response
            .body; // Assuming the response body directly contains the status
      } else {
        // Handle error, return a default value, or throw an exception
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

  Future<bool> getOrderRights(String id) async {
    final apiUrl =
        'https://pricelink.net/wp-json/mobile_api/v1/create_orders_right_for_employees/$id';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return true;
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
      enqRkds5,
      enqRkds6,
      enqRkds7,
      enqRkds8,
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
    var apiUrl = "";
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
}
