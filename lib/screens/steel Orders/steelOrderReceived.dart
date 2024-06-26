import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/steelOrderTables/steelOrderReceived.dart';
import 'package:price_link/components/tables/steelOrderReceivedTable.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class SteelOrderReceived extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const SteelOrderReceived(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<SteelOrderReceived> createState() => _SteelOrderReceivedState();
}

class _SteelOrderReceivedState extends State<SteelOrderReceived> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    List<SteelOrderModel>? newData =
        await apiServices.allSteelOrders(context, widget.dealerId);

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
            'Steel Order Received',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            // Container(
            //     padding: EdgeInsets.only(left: 20, right: 20),
            //     child: TextFormField(
            //       onChanged: (value) {
            //         Provider.of<AllSteelOrdersData>(context, listen: false)
            //             .getAllReceivedData(context, widget.dealerId, value);
            //       },
            //       decoration: InputDecoration(
            //         contentPadding: EdgeInsets.symmetric(vertical: 5),
            //         prefixIcon: IconButton(
            //           icon: Icon(Icons.search),
            //           onPressed: () {},
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(7.0),
            //         ),
            //         hintText: 'Search here',
            //       ),
            //     )),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: widget.role == "admin"
                  ? AdminSteelOrdersReceived(
                      dealerId: widget.dealerId,
                      dealerName: widget.dealerName,
                      role: widget.role,
                    )
                  : SteelOrderReceivedTable(
                      dealerId: widget.role == "employee"
                          ? widget.empId!
                          : widget.dealerId,
                      dealerName: widget.dealerName,
                      role: widget.role,
                      empId: widget.empId,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
