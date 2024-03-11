import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/quotationsTable.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EntranceDoorQuotations extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? empId;
  final String? role;
  const EntranceDoorQuotations(
      {super.key, this.dealerId, this.dealerName, this.empId, this.role});

  @override
  State<EntranceDoorQuotations> createState() => _EntranceDoorQuotationsState();
}

class _EntranceDoorQuotationsState extends State<EntranceDoorQuotations> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    await apiServices.getQuotationsList(widget.dealerId!);

    // Update the UI with the new data
    setState(() {});

    // Return a delayed Future to simulate a refresh
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: Scaffold(
        drawer: DrawerPage(
          dealer_id: widget.dealerId,
          dealerName: widget.dealerName,
          empId: widget.empId,
          role: widget.role,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'Quotations',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
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
                                dealerId: widget.dealerId!,
                                  url:
                                      'https://www.pricelink.net/rk-door-calculator/?${widget.dealerId}&mobile_token=true')));
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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: TextFormField(
                    onChanged: (value) {
                      Provider.of<QuotationsSearchedData>(context, listen: false)
                          .getAllData(widget.dealerId!, value);
                  
                    },
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
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: widget.role == "admin"
                  ? AdminQuotationsTable(
                      dealerId: widget.dealerId,
                      dealerName: widget.dealerName,
                      role: "admin",
                    )
                  : QuotationsTable(
                      dealerId: widget.role == "employee"
                          ? widget.empId
                          : widget.dealerId,
                      dealerName: widget.dealerName,
                      empId: widget.empId,
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
