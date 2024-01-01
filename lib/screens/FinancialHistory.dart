import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancialHistory extends StatefulWidget {
  final String? dealerId;
  final String? id;
  final String? quotationNumber;
  const FinancialHistory(
      {super.key, this.id, this.dealerId, this.quotationNumber});

  @override
  State<FinancialHistory> createState() => _FinancialHistoryState();
}

class _FinancialHistoryState extends State<FinancialHistory> {
  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(
          dealer_id: widget.dealerId,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: Text(
            "Order Payment History Analysis",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<OrdersModel>>(
          future: apiServices.getOrdersList(widget.dealerId!, widget.id),
          builder: (context, snapshot) {
            List<OrdersModel> list = snapshot.data!;

            if (list.isEmpty) {
              Center(child: Text('No data to display'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  OrdersModel order = list.firstWhere((order) =>
                      (order.id == widget.id) &&
                      (order.quotationNumber == widget.quotationNumber));

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Customer Name:  ${order.name!}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('Quotation Number:  ${order.uniqueNumber}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Order Value (Incl VAT) Applied'),
                              Text(order.wholeTotal!)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Deposit Amount Paid :'),
                              Text(order.depositAmountPaid ?? "")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Deposit Payment Date:'),
                              Text(
                                (order.depositPayDate == "")
                                    ? "mm/dd/yyyy"
                                    : order.depositPayDate!,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Additional Payment Amount:'),
                              Text(order.addPayAmount ?? "")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Additional Payment Date:'),
                              Text((order.addPayDate == "")
                                  ? "mm/dd/yyyy"
                                  : order.addPayDate!)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Balance Payment Amount:'),
                              Text(order.balPayAmount ?? "")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Balance Payment Date:'),
                              Text((order.balPayDate == "")
                                  ? "mm/dd/yyyy"
                                  : order.balPayDate!)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Notes',
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            maxLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Balance Due before delivery:'),
                              Text(order.balDueBeforeDelivery ?? "")
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RoundButton(
                          onTap: () {},
                          text: 'Calculate or recalculate financial History',
                          color: Colors.green,
                          width: MediaQuery.sizeOf(context).width * 0.85,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RoundButton(
                          onTap: () {},
                          text: 'Close',
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
