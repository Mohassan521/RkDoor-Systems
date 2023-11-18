import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';

class EntranceDoorQuotations extends StatefulWidget {
  const EntranceDoorQuotations({super.key});

  @override
  State<EntranceDoorQuotations> createState() => _EntranceDoorQuotationsState();
}

class _EntranceDoorQuotationsState extends State<EntranceDoorQuotations> {
  late String selectedValue;
  List<String> qtyList = ['10', '25', '50', '100'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Quotations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Show '),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.width * 0.16,
                      child: ReusableDropdown(
                          items: qtyList,
                          value: qtyList.first,
                          onChanged: (newValue) {}),
                    ),
                    Text(' Entries'),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RkDoorCalculatorView(
                                url:
                                    'https://www.pricelink.net/rk-door-calculator/')));
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
            child: QuotationsTable(),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Showing 1 of 1 Entries'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left_sharp)),
              Center(child: Text('1')),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right_sharp))
            ],
          ),
        ],
      ),
    );
  }
}
