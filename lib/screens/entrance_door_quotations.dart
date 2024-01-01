import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:provider/provider.dart';

class EntranceDoorQuotations extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const EntranceDoorQuotations({super.key, this.dealerId, this.dealerName});

  @override
  State<EntranceDoorQuotations> createState() => _EntranceDoorQuotationsState();
}

class _EntranceDoorQuotationsState extends State<EntranceDoorQuotations> {
  late String selectedValue;
  List<String> qtyList = ['10', '25', '50', '100'];

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
          'Quotations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RkDoorCalculatorView(
                                  url:
                                      'https://www.pricelink.net/rk-door-calculator/${widget.dealerId}&mobile_token=true')));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.blue,
                        ),
                        Text(
                          'Add New Quote',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
                    hintText: 'Search Records here',
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: QuotationsTable(
                dealerId: widget.dealerId,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
