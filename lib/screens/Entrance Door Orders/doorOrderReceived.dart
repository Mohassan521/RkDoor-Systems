import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/doorOrderReceived.dart';
import 'package:price_link/components/tables/doorOrderReceivedTable.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class DoorOrderReceived extends StatefulWidget {
  final String? dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const DoorOrderReceived(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<DoorOrderReceived> createState() => _DoorOrderReceivedState();
}

class _DoorOrderReceivedState extends State<DoorOrderReceived> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    List<OrdersModel>? newData =
        await apiServices.getOrdersList(widget.dealerId!, "");

    // Update the UI with the new data
    setState(() {});

    // Return a delayed Future to simulate a refresh
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: Scaffold(
        drawer: DrawerPage(
          dealer_id: widget.dealerId,
          dealerName: widget.dealerName,
          empId: widget.empId,
          role: widget.role,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Door Orders Received',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalculatorWebView(
                        dealerId: widget.dealerId!,
                        url:
                            'https://www.pricelink.net/rk-door-calulator-by-admin?user_id=${widget.dealerId}&method=order&mobile_token=true')));
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
        body: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Provider.of<AllEntranceDoorOrderSearchedData>(context,
                            listen: false)
                        .doorOrderReceived(widget.dealerId!, value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Search here',
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: widget.role == "admin"
                  ? AdminDoorOrdersReceived(
                      dealerId: widget.dealerId!,
                      dealerName: widget.dealerName,
                      role: widget.role,
                    )
                  : DoorOrderReceivedTable(
                      dealerId: widget.role == "employee"
                          ? widget.empId
                          : widget.dealerId,
                      dealerName: widget.dealerName,
                      role: widget.role,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
