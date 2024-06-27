import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/steelOrderTables/delivered.dart';
import 'package:price_link/components/tables/steelDeliveredTable.dart';
import 'package:provider/provider.dart';

class SteelDelivered extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const SteelDelivered(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<SteelDelivered> createState() => _SteelDeliveredState();
}

class _SteelDeliveredState extends State<SteelDelivered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Steel Delivered',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          // Container(
          //     padding: EdgeInsets.only(left: 20.0, right: 20),
          //     child: TextFormField(
          //       onChanged: (value) {
          //         Provider.of<AllSteelOrdersData>(context, listen: false)
          //             .getDeliveredData(context, widget.dealerId, value);
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
                ? AdminSteelDelivered(
                    dealerId: widget.dealerId,
                    dealerName: widget.dealerName,
                    role: widget.role,
                  )
                : SteelDeliveredTable(
                    dealerId: widget.role == "employee"
                        ? widget.empId!
                        : widget.dealerId,
                    dealerName: widget.dealerName,
                    role: widget.role,
                    empId: widget.empId),
          ),
        ],
      ),
    );
  }
}
