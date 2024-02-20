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
  final OrdersModel ordersModel;
  const FinancialHistory(
      {super.key,
      this.id,
      this.dealerId,
      this.quotationNumber,
      required this.ordersModel});

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Customer Name:  ${widget.ordersModel.name!}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Quotation Number:  ${widget.ordersModel.uniqueNumber}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Order Value (Incl VAT) Applied'),
                    Text(widget.ordersModel.wholeTotal!)
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
                    Text(widget.ordersModel.depositAmountPaid ?? "")
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
                      (widget.ordersModel.depositPayDate == "")
                          ? "mm/dd/yyyy"
                          : widget.ordersModel.depositPayDate!,
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
                    Text(widget.ordersModel.addPayAmount ?? "")
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
                    Text((widget.ordersModel.addPayDate == "")
                        ? "mm/dd/yyyy"
                        : widget.ordersModel.addPayDate!)
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
                    Text(widget.ordersModel.balPayAmount ?? "")
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
                    Text((widget.ordersModel.balPayDate == "")
                        ? "mm/dd/yyyy"
                        : widget.ordersModel.balPayDate!)
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
                    Text(widget.ordersModel.balDueBeforeDelivery ?? "")
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RoundButton(
                onTap: () {
                  apiServices.FinancialHistoryCalculation(
                      widget.dealerId!,
                      widget.ordersModel.id!,
                      widget.ordersModel.depositAmountPaid ?? "",
                      widget.ordersModel.depositPayDate ?? "",
                      widget.ordersModel.addPayAmount,
                      widget.ordersModel.addPayDate,
                      widget.ordersModel.balPayAmount,
                      widget.ordersModel.balPayDate,
                      widget.ordersModel.notes,
                      widget.ordersModel.wholeTotal,
                      widget.ordersModel.balDueBeforeDelivery);
                },
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
        ));
  }
}
