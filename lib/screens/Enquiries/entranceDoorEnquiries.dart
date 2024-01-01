import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/entranceDoorEnquiriesTable.dart';
import 'package:price_link/components/tables/hotLeadsTable.dart';
import 'package:provider/provider.dart';

class EntranceDoorEnquiries extends StatefulWidget {
  final String dealer_id;
  final String dealer_name;
  const EntranceDoorEnquiries(
      {super.key, required this.dealer_id, required this.dealer_name});

  @override
  State<EntranceDoorEnquiries> createState() => _EntranceDoorEnquiriesState();
}

class _EntranceDoorEnquiriesState extends State<EntranceDoorEnquiries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(
          dealerName: widget.dealer_name,
          dealer_id: widget.dealer_id,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Entrance Door Enquiries',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<SelectedValueProvider>(
          builder: (context, value, child) {
            return Column(
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
                //           Container(
                //             height: MediaQuery.of(context).size.height * 0.035,
                //             width: MediaQuery.of(context).size.width * 0.16,
                //             child: ReusableDropdown(
                //                 items: qtyList,
                //                 valueProvider: value,
                //                 onChanged: (newValue) {}),
                //           ),
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
                  child: EntranceDoorEnquiriesTable(
                    dealerId: widget.dealer_id,
                    dealerName: widget.dealer_name,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
