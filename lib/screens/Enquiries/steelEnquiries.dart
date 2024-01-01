import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/steelEnquiriesTable.dart';
import 'package:provider/provider.dart';

class SteelEnquiries extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  const SteelEnquiries(
      {super.key, required this.dealerId, required this.dealerName});

  @override
  State<SteelEnquiries> createState() => _SteelEnquiriesState();
}

class _SteelEnquiriesState extends State<SteelEnquiries> {
  late String selectedValue;
  List<String> qtyList = ['10', '25', '50', '100'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(
          dealerName: widget.dealerName,
          dealer_id: widget.dealerId,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Steel Enquiries',
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
                  child: SteelEnquiriesTable(
                    dealerId: widget.dealerId,
                    dealerName: widget.dealerName,
                  ),
                )
              ],
            );
          },
        ));
  }
}
