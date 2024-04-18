import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/AdminEntranceDoorTable.dart';
import 'package:price_link/components/tables/entranceDoorEnquiriesTable.dart';
import 'package:price_link/services/services.dart';

class EntranceDoorEnquiries extends StatefulWidget {
  final String dealer_id;
  final String dealer_name;
  final String? empId;
  final String? role;
  const EntranceDoorEnquiries(
      {super.key,
      required this.dealer_id,
      required this.dealer_name,
      this.empId,
      this.role});

  @override
  State<EntranceDoorEnquiries> createState() => _EntranceDoorEnquiriesState();
}

class _EntranceDoorEnquiriesState extends State<EntranceDoorEnquiries> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.getAllEnquiries(widget.dealer_id);

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
            dealerName: widget.dealer_name,
            dealer_id: widget.dealer_id,
            empId: widget.empId,
            role: widget.role,
          ),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff941420),
            title: const Text(
              'Entrance Door Enquiries',
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
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
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
                child: widget.role == "admin"
                    ? AdminEntranceDoorEnquiries(
                        dealerId: widget.dealer_id,
                        dealerName: widget.dealer_name)
                    : EntranceDoorEnquiriesTable(
                        dealerId: widget.role == "employee"
                            ? widget.empId
                            : widget.dealer_id,
                        dealerName: widget.dealer_name,
                      ),
              ),
            ],
          )),
    );
  }
}
