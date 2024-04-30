import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/archives/steelOrdersTable.dart';
import 'package:price_link/services/services.dart';

class ArchiveSteelOrders extends StatefulWidget {
  final String dealer_id;
  final String dealer_name;
  final String? empId;
  final String? role;
  const ArchiveSteelOrders(
      {super.key,
      required this.dealer_id,
      required this.dealer_name,
      this.empId,
      this.role});

  @override
  State<ArchiveSteelOrders> createState() => _ArchiveSteelOrdersState();
}

class _ArchiveSteelOrdersState extends State<ArchiveSteelOrders> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.allSteelOrders(context, widget.dealer_id);

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
          dealer_id: widget.dealer_id,
          dealerName: widget.dealer_name,
          empId: widget.empId,
          role: widget.role,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Archive Steel Orders',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
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
                child: ArchiveSteelOrdersTable(
                  dealerId: widget.dealer_id,
                  dealerName: widget.dealer_name,
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
