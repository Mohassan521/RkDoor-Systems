import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/allDoorOrdersTable.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingDeposit.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingPayment.dart';
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
import 'package:price_link/screens/adminScreens/HomeScreen.dart/allDoorOrders.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/services/services.dart';

class AdminHomePage extends StatefulWidget {
  final String? dealer_id;
  final String? dealer_name;
  final String? role;
  const AdminHomePage({super.key, this.dealer_id, this.dealer_name, this.role});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    print("dealer Id in dashboard: ${widget.role}");
    Future<void> _handleRefresh() async {
      await apiServices.getAdminOrders();

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 28.5,
                    ),
                  ),
                );
              },
            ),
          ),
          drawer: DrawerPage(
            dealerName: widget.dealer_name,
            dealer_id: widget.dealer_id,
            role: widget.role,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalculatorWebView(
                      dealerId: widget.dealer_id!,
                      url:
                          'https://www.pricelink.net/rk-door-calulator-by-admin?user_id=${widget.dealer_id}&method=order&mobile_token=true'),
                ),
              );
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
                Image(
                    width: MediaQuery.of(context).size.width * 0.75,
                    image: const AssetImage('assets/images/logo.jpeg')),
                SizedBox(
                  height: 20,
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xffFF2D2D), Color(0xffA53B3B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'ADMINISTRATOR',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff941420),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'ALL DOOR ORDERS',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AllDoorOrdersHomePage(
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
                      Text(
                        'ORDER RECEIVED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'AWAITING DEPOSIT',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'DEPOSIT RECEIVED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         padding: EdgeInsets.only(
                //             bottom: 8), // Adjust padding as needed
                //         decoration: BoxDecoration(
                //           border: Border(
                //             bottom: BorderSide(
                //               color:
                //                   Color(0xff941420), // Adjust color as needed
                //               width: 3.0, // Adjust thickness as needed
                //             ),
                //           ),
                //         ),
                //         child: Flexible(
                //           child: Text(
                //             'Awaiting Survey / Dimensions',
                //             style: TextStyle(
                //                 height: 1.5,
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.w600),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //   child: AdminDoorAwaitingSurvey(
                //     dealerId: widget.dealer_id ?? "",
                //     dealerName: widget.dealer_name ?? "",
                //   ),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ORDER PLACED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'PC ISSUED',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'RC ISSUED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'IN PRODUCTION',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'DELAYED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'READY FOR SHIPPING',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'IN TRANSIT TO UK',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'IN RKDS WAREHOUSE',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'AWAITING BALANCE PAYMENT',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'OUT FOR DELIVERY',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'DELIVERED',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
                      Text(
                        'ON HOLD',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 2.5,
                            height: 1.5,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
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
