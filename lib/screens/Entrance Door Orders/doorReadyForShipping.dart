import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/doorReadyForShippingTable.dart';
import 'package:provider/provider.dart';

class DoorReadyForShipping extends StatefulWidget {
  final String dealerId;
  const DoorReadyForShipping({super.key, required this.dealerId});

  @override
  State<DoorReadyForShipping> createState() => _DoorReadyForShippingState();
}

class _DoorReadyForShippingState extends State<DoorReadyForShipping> {
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
          'Door Ready For Shipping',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           Text('Show '),
          //           Consumer<SelectedValueProvider>(
          //               builder: (context, value, child) {
          //             return Container(
          //               height: MediaQuery.of(context).size.height * 0.035,
          //               width: MediaQuery.of(context).size.width * 0.16,
          //               child: ReusableDropdown(
          //                   items: qtyList,
          //                   valueProvider: value,
          //                   onChanged: (newValue) {}),
          //             );
          //           }),
          //           Text(' Entries'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
            child: DoorReadyForShippingTable(
              dealerId: widget.dealerId,
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Text('Showing 1 of 1 Entries'),
          // SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left_sharp)),
          //     Center(child: Text('1')),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right_sharp))
          //   ],
          // ),
        ],
      ),
    );
  }
}
