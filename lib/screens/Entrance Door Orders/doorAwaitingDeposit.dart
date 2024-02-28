import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/tables/adminTables/doorAwaitingDeposit.dart';
import 'package:price_link/components/tables/doorAwaitingDepositTable.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class DoorAwaitingDeposit extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? empId;
  final String? role;
  const DoorAwaitingDeposit(
      {super.key, this.dealerId, this.dealerName, this.empId, this.role});

  @override
  State<DoorAwaitingDeposit> createState() => _DoorAwaitingDepositState();
}

class _DoorAwaitingDepositState extends State<DoorAwaitingDeposit> {
  NetworkApiServices apiServices = NetworkApiServices();
  Future<void> _handleRefresh() async {
    List<OrdersModel>? newData =
        await apiServices.getOrdersList(widget.dealerId!, "");

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
            'Door Awaiting Deposit',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
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
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Provider.of<AllEntranceDoorOrderSearchedData>(context,
                            listen: false)
                        .awaitingDeposit(widget.dealerId!, value);
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
                  ? AdminDoorAwaitingDeposit(
                      dealerId: widget.dealerId!,
                      dealerName: widget.dealerName!,
                      role: widget.role,
                    )
                  : DoorAwaitingDepositTable(
                      dealerId: widget.role == "employee" ? widget.empId : widget.dealerId,
                      dealerName: widget.dealerName,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
