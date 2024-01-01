import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/doorDepositReceivedTable.dart';
import 'package:provider/provider.dart';

class DoorDepositReceived extends StatefulWidget {
  final String? dealerId;
  const DoorDepositReceived({super.key, this.dealerId});

  @override
  State<DoorDepositReceived> createState() => _DoorDepositReceivedState();
}

class _DoorDepositReceivedState extends State<DoorDepositReceived> {
  late String selectedValue;
  List<String> qtyList = ['10', '25', '50', '100'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Door Deposit Received',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 18,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextFormField(
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
            child: DoorDepositReceivedTable(
              dealerId: widget.dealerId,
            ),
          ),
        ],
      ),
    );
  }
}
