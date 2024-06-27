import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/AdminAllEnquiryTable.dart';
import 'package:price_link/components/tables/allEnquiriesTable.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AllEnquiries extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? empId;
  final String? role;
  const AllEnquiries(
      {super.key, this.dealerId, this.dealerName, this.empId, this.role});

  @override
  State<AllEnquiries> createState() => _AllEnquiriesState();
}

class _AllEnquiriesState extends State<AllEnquiries> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.getAllEnquiries(widget.dealerId!);
    await apiServices.getAdminPanelEnquiries();
    // Update the UI with the new data
    setState(() {});

    // Return a delayed Future to simulate a refresh
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    print("empID in enquiries: ${widget.empId}");
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
              'Enquiries',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton.extended(
              label: Text(
                'Add New Enquiry',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0xff941420),
              onPressed: () {}),
          body: ListView(
            children: [
              SizedBox(
                height: 18,
              ),
              // Container(
              //     padding: EdgeInsets.only(left: 20.0, right: 20),
              //     child: TextFormField(
              //       onChanged: (value) {
              //         if (widget.role == "dealer" ||
              //             widget.role == "employee") {
              //           Provider.of<AllEnquiriesSearchedData>(context,
              //                   listen: false)
              //               .getAllData(widget.dealerId!, value);
              //         } else if (widget.role == "admin") {
              //           Provider.of<AllEnquiriesSearchedDataForAdmin>(context,
              //                   listen: false)
              //               .getAllData(widget.dealerId!, value);
              //         }
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
                    ? AdminAllEnquiriesTable(
                        dealerId: widget.dealerId,
                        dealerName: widget.dealerName,
                      )
                    : AllEnquiriesTable(
                        dealerId: widget.role == "employee"
                            ? widget.empId
                            : widget.dealerId,
                        dealerName: widget.dealerName,
                      ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
