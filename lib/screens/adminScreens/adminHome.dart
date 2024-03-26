import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/components/tables/adminTables/allDoorOrdersTable.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingDeposit.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingPayment.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingSurvey.dart';
import 'package:price_link/components/tables/adminTables/doorDelayed.dart';
import 'package:price_link/components/tables/adminTables/doorDelivered.dart';
import 'package:price_link/components/tables/adminTables/doorDepositReceived.dart';
import 'package:price_link/components/tables/adminTables/doorInProduction.dart';
import 'package:price_link/components/tables/adminTables/doorOnHold.dart';
import 'package:price_link/components/tables/adminTables/doorOrderPlaced.dart';
import 'package:price_link/components/tables/adminTables/doorOrderReceived.dart';
import 'package:price_link/components/tables/adminTables/doorOutForDelivery.dart';
import 'package:price_link/components/tables/adminTables/doorPCIssued.dart';
import 'package:price_link/components/tables/adminTables/doorRCIssued.dart';
import 'package:price_link/components/tables/adminTables/doorReadyForShipping.dart';
import 'package:price_link/components/tables/adminTables/inRKDSWarehouse.dart';
import 'package:price_link/components/tables/adminTables/transitToUk.dart';
import 'package:price_link/components/tables/employeeTable.dart';
import 'package:price_link/components/tables/employeeTables/employeeTable.dart';
import 'package:price_link/components/tables/orderTable.dart';
import 'package:price_link/components/tables/ownerTable.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  final String? dealer_id;
  final String? dealer_name;
  final String? role;
  const AdminHomePage({super.key, this.dealer_id, this.dealer_name, this.role});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController markup = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController address3 = TextEditingController();

  NetworkApiServices apiServices = NetworkApiServices();
  final Duration animationDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    print("dealer Id in dashboard: ${widget.role}");
    //var userData = Provider.of<UserLoginData>(context, listen: false).dataModel;
    //final paginationProvider = Provider.of<PaginationProvider>(context);
    // var dealerData = Provider.of<DealerData>(context).model;
    // print(dealerData.iD);
    Future<void> _handleRefresh() async {
      // await apiServices.getDealersList(context, widget.dealer_id!);

      // await apiServices.getEmployeeList(widget.dealer_id!);
      // await apiServices.getOrdersList(widget.dealer_id!, "");
      // await apiServices.getQuotationsList(widget.dealer_id);

      // Update the UI with the new data
      setState(() {});

      // Return a delayed Future to simulate a refresh
      return await Future.delayed(Duration(seconds: 2));
    }

    print("admin ID in admin dashboard ${widget.dealer_id}");
    print("admin name in admin dashboard ${widget.dealer_name}");

    // print(dealerData);
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: Scaffold(
          drawer: DrawerPage(
            dealerName: widget.dealer_name,
            dealer_id: widget.dealer_id,
            role: widget.role,
          ),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff941420),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculatorWebView(
                          dealerId: widget.dealer_id!,
                          url:
                              'https://www.pricelink.net/rk-door-calulator-by-admin?user_id=${widget.dealer_id}&method=order&mobile_token=true')));
            },
            label: Text(
              'Add New Order',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color(0xff941420),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Administrator',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //     'App Developer\nGulshan e Iqbal block 11\nsame as above\n74600')
                        ],
                      ),
                      Image(
                          width: MediaQuery.of(context).size.width * 0.35,
                          image: const AssetImage('assets/images/logo.jpeg'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'All Door Orders',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorOrders(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Order Received',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorOrdersReceived(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Awaiting Deposit',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorAwaitingDeposit(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Deposit Received',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorDepositReceived(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Flexible(
                          child: Text(
                            'Awaiting Survey / Dimensions',
                            style: TextStyle(
                                letterSpacing: 2.5,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorAwaitingSurvey(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Order Placed',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorOrderPlaced(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'PC Issued',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorPCIssued(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'RC Issued',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AdminDoorRCIssued(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'In Production',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorInProduction(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Delayed',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorDelayed(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Ready For Shipping',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorReadyForShipping(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'In Transit To UK',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorTransitToUK(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'In RKDS Warehouse',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorInRKDS(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Awaiting Balance Payment',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorAwaitingPayment(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Out For Delivery',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorOutForDelivery(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'Delivered',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorDelivered(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 8), // Adjust padding as needed
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  Color(0xff941420), // Adjust color as needed
                              width: 3.0, // Adjust thickness as needed
                            ),
                          ),
                        ),
                        child: Text(
                          'On Hold',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 2.5,
                              height: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AdminDoorOnHold(
                    dealerId: widget.dealer_id ?? "",
                    dealerName: widget.dealer_name ?? "",
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
