import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/ankaTable.dart';
import 'package:price_link/components/tables/adminTables/enquiryAllocationTable.dart';
import 'package:price_link/components/tables/adminTables/orderAllocationTable.dart';
import 'package:price_link/components/tables/adminTables/queueAllocationTable.dart';
import 'package:provider/provider.dart';

class EnquiryAllocation extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const EnquiryAllocation(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<EnquiryAllocation> createState() => _EnquiryAllocationState();
}

class _EnquiryAllocationState extends State<EnquiryAllocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Enquiry Allocation',
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
                  Provider.of<AllEnquiriesSearchedDataForAdmin>(context,
                              listen: false)
                          .getAllData(widget.dealerId!, value);
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
              child: EnquiryAllocationTable(
                dealerId: widget.dealerId!,
                dealerName: widget.dealerName!,
                role: widget.role,
              )),
        ],
      ),
    );
  }
}
