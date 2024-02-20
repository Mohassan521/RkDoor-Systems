import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/doorDelivered.dart';
import 'package:price_link/components/tables/doorDeliveredTable.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class DoorDelivered extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const DoorDelivered(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<DoorDelivered> createState() => _DoorDeliveredState();
}

class _DoorDeliveredState extends State<DoorDelivered> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    List<OrdersModel>? newData =
        await apiServices.getOrdersList(widget.dealerId, "");

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
            'Door Delivered',
            style: TextStyle(color: Colors.white),
          ),
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
                        .delivered(widget.dealerId, value);
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
                  ? AdminDoorDelivered(
                      dealerId: widget.dealerId,
                      dealerName: widget.dealerName,
                      role: widget.role,
                    )
                  : DoorDeliveredTable(
                      dealerId: widget.dealerId,
                      dealerName: widget.dealerName,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
