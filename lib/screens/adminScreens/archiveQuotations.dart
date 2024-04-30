import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/archives/quotationsTable.dart';
import 'package:price_link/services/services.dart';

class ArchiveQuotations extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? empId;
  final String? role;
  const ArchiveQuotations(
      {super.key, this.dealerId, this.dealerName, this.empId, this.role});

  @override
  State<ArchiveQuotations> createState() => _ArchiveQuotationsState();
}

class _ArchiveQuotationsState extends State<ArchiveQuotations> {
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
            'Archive Quotations',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    hintText: 'Search Records here',
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: ArchiveQuotationsTable(
                  dealerId: widget.dealerId,
                  dealerName: widget.dealerName,
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
