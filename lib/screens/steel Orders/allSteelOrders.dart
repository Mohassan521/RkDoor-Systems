import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/steelOrderTables/allSteelOrders.dart';
import 'package:price_link/components/tables/allSteelOrderTable.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AllSteelOrders extends StatefulWidget {
  final String dealer_id;
  final String dealer_name;
  final String? empId;
  final String? role;
  const AllSteelOrders(
      {super.key,
      required this.dealer_id,
      required this.dealer_name,
      this.empId,
      this.role});

  @override
  State<AllSteelOrders> createState() => _AllSteelOrdersState();
}

class _AllSteelOrdersState extends State<AllSteelOrders> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    List<SteelOrderModel>? newData =
        await apiServices.allSteelOrders(context, widget.dealer_id);

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
          dealer_id: widget.dealer_id,
          dealerName: widget.dealer_name,
          empId: widget.empId,
          role: widget.role,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: const Text(
            'All Steel Orders',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 18,
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Provider.of<AllSteelOrdersData>(context, listen: false)
                        .getAllData(context, widget.dealer_id, value);
                  },
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
              child: widget.role == "admin"
                  ? AdminAllSteelOrders(
                      dealerId: widget.dealer_id,
                      dealerName: widget.dealer_name)
                  : AllSteelOrdersTable(
                      dealerId: widget.role == "employee"
                          ? widget.empId!
                          : widget.dealer_id,
                      dealerName: widget.dealer_name,
                      role: widget.role,
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
