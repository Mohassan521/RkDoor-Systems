import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/queueAllocationTable.dart';
import 'package:provider/provider.dart';

class QueuesAllocation extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const QueuesAllocation(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<QueuesAllocation> createState() => _QueuesAllocationState();
}

class _QueuesAllocationState extends State<QueuesAllocation> {
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
          'Quotes Allocation',
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
                  Provider.of<QuotationsSearchedDataForAdmin>(context,
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
              child: QueueAllocationTable(
                dealerId: widget.dealerId!,
                dealerName: widget.dealerName!,
                role: widget.role,
              )),
        ],
      ),
    );
  }
}
