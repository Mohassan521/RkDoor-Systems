import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/allEnquiriesTable.dart';
import 'package:provider/provider.dart';

class AllEnquiries extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const AllEnquiries({super.key, this.dealerId, this.dealerName});

  @override
  State<AllEnquiries> createState() => _AllEnquiriesState();
}

class _AllEnquiriesState extends State<AllEnquiries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(
          dealer_id: widget.dealerId,
          dealerName: widget.dealerName,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Enquiries',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<SelectedValueProvider>(
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
                    child: AllEnquiriesTable(
                      dealerId: widget.dealerId,
                      dealerName: widget.dealerName,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
