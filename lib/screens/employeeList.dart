import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/employeeListTable.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EmployeeList extends StatefulWidget {
  final String dealer_id;
  final String dealerName;
  final String? role;
  final String? empId;
  const EmployeeList(
      {super.key,
      required this.dealer_id,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.getEmployeeList(widget.dealer_id);

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
            dealerName: widget.dealerName,
            role: widget.role,
            empId: widget.empId,
          ),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff941420),
            title: const Text(
              'Employee List',
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
                    onChanged: (value) {
                      Provider.of<EmployeeListSearchedData>(context,
                              listen: false)
                          .getAllData(widget.dealer_id, value);
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
                child: EmployeeListTable(
                  dealer_id: widget.dealer_id,
                  dealer_name: widget.dealerName,
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
