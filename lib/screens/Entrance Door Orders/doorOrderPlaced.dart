import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/doorOrderPlacedTable.dart';
import 'package:provider/provider.dart';

class DoorOrderPlaced extends StatefulWidget {
  final String? dealerId;
  const DoorOrderPlaced({super.key, this.dealerId});

  @override
  State<DoorOrderPlaced> createState() => _DoorOrderPlacedState();
}

class _DoorOrderPlacedState extends State<DoorOrderPlaced> {
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
          'Door Orders Placed',
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
            child: DoorOrderPlacedTable(
              dealerId: widget.dealerId,
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
