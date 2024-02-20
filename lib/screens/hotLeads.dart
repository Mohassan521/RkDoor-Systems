import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/hotLeads.dart';
import 'package:price_link/components/tables/hotLeadsTable.dart';
import 'package:provider/provider.dart';

class HotLeads extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const HotLeads(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<HotLeads> createState() => _HotLeadsState();
}

class _HotLeadsState extends State<HotLeads> {
  late String selectedValue;
  List<String> qtyList = ['10', '25', '50', '100'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealerName: widget.dealerName,
        dealer_id: widget.dealerId,
        empId: widget.empId,
        role: widget.role,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Hot Leads',
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
                ? AdminHotLeads(
                    dealerId: widget.dealerId,
                    dealerName: widget.dealerName,
                  )
                : HotLeadsTable(
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
      ),
    );
  }
}
