import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/archives/doorOrdersTable.dart';
import 'package:price_link/services/services.dart';

class ArchiveDoorOrders extends StatefulWidget {
  final String? dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const ArchiveDoorOrders(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<ArchiveDoorOrders> createState() => _ArchiveDoorOrdersState();
}

class _ArchiveDoorOrdersState extends State<ArchiveDoorOrders> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.getOrdersList(widget.dealerId!, "");
    await apiServices.getAdminOrders();
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
            'Archive Door Orders',
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    hintText: 'Search here',
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: ArchiveDoorOrdersTable(
                  dealerId: widget.dealerId!,
                  dealerName: widget.dealerName,
                )),
          ],
        ),
      ),
    );
  }
}
