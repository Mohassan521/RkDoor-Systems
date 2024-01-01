import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoorAwaitingDepositTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const DoorAwaitingDepositTable({super.key, this.dealerId, this.dealerName});

  @override
  State<DoorAwaitingDepositTable> createState() =>
      _DoorAwaitingDepositTableState();
}

class _DoorAwaitingDepositTableState extends State<DoorAwaitingDepositTable> {
  DateTime _dateTime = DateTime.now();
  String? prevValue;
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<OrdersModel>>(
      future: apiServices.getOrdersList(widget.dealerId!, ""),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<OrdersModel>? list = snapshot.data!;
        List<OrdersModel> awaitedSurveyList = list
            .where((result) =>
                result.orderStatusVal == "Awaiting Survey / Dimensions")
            .toList();

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              rowsPerPage: (awaitedSurveyList.length >= 5 &&
                      awaitedSurveyList.isNotEmpty)
                  ? 5
                  : (awaitedSurveyList.isEmpty)
                      ? 1
                      : awaitedSurveyList.length,
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff941420)),
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Customer Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Number',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Created By',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Order No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Payment Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Confirmation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quick PDF Quotation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anticipated Delivery Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Invoices',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Balance Due',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Note',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Door Model',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Marine Grade Finish',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Frame Size',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Goalpost Construction',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Overall Weight',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Threshold Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Keyless access',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Total Quote Value',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow up Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow up Made',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Date History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Action Status',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(list, awaitedSurveyList, _dateTime,
                  widget.dealerId, widget.dealerName, _showDatePicker,
                  myGlobalBuildContext: context));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  List<OrdersModel> awaitedSurveyList;
  final String? dealerId;
  final String? dealerName;
  NetworkApiServices apiServices = NetworkApiServices();
  DateTime _datetime = DateTime.now();
  //final String? prevNotesValue;
  void Function()? _showDatePicker;
  final BuildContext myGlobalBuildContext;
  TextEditingController orderNotesController = TextEditingController();
  final List<OrdersModel> data;

  MyData(this.data, this.awaitedSurveyList, this._datetime, this.dealerId,
      this.dealerName, this._showDatePicker,
      {required this.myGlobalBuildContext});

  @override
  int get rowCount => awaitedSurveyList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  DoorAwaitingDepositTable table = DoorAwaitingDepositTable();

  @override
  DataRow getRow(int index) {
    // String? prevValue =
    //print(prevNotesValue);
    var userData = Provider.of<UserLoginData>(myGlobalBuildContext).dataModel;
    var dealerData = Provider.of<DealerData>(myGlobalBuildContext).model;
    final OrdersModel result = awaitedSurveyList[index];

    //Widget selectedTable = determineTable(result, dealerId!);

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.name ?? '')),
        DataCell(Text(result.quotationNumber ?? '')),
        DataCell(Text(dealerData.dealerName ?? "")),
        DataCell(Text(userData.displayName ?? "")),
        DataCell(Text(result.orderNoVal ?? "")),
        DataCell(Text((result.orderStatusVal ?? ""))),
        DataCell(Text(result.orderPaymentStatusVal ?? '')),
        DataCell(
            Text(result.facConfDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.quickPdfUrl ?? '')),
        DataCell(Text(result.anticipatedDateVal ?? '')),
        DataCell(Text(
            result.invoicesDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.balDueBeforeDelivery ?? '')),
        DataCell(Text(
            result.deliveryDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.profile ?? '')),
        DataCell(Text(result.doorModel ?? '')),
        DataCell(Text(result.marineGradeVal ?? '')),
        DataCell(Text(result.frameSizeHeightWidth ?? '')),
        DataCell(Text(result.lhGoalPostE44 ?? '')),
        DataCell(Text(result.totalWeightKg ?? '')),
        DataCell(Text(result.thresholdType ?? '')),
        DataCell(Text(result.ekeylessAccess ?? '')),
        DataCell(Text(result.telephoneNumber ?? '')),
        DataCell(Text(result.customerEmail ?? '')),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        DataCell(Text(result.id ?? '')),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(Text(result.wholeTotal ?? '')),
        DataCell(Consumer<FollowUpOrderDate>(
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (result.orderDate != null)
                      ? result.orderDate!
                      : value.getDate(result.id!),
                  style: TextStyle(fontSize: 12),
                ),
                DateButton(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                    );

                    if (pickedDate != null) {
                      // value.setDate(result.id!, pickedDate);
                      apiServices.setFollowUpOrderDate(
                          dealerId!, result.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ],
            );
          },
        )),
        DataCell(Consumer<setFollowUpOrderValue>(
          builder: (context, value, child) {
            return Center(
              child: DropdownButton<String>(
                value:
                    (result.orderFollowup == "") ? "NO" : result.orderFollowup!,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  //newValue = result.orderFollowup;
                  if (newValue != null) {
                    // Provider.of<setFollowUpOrderValue>(context, listen: false)
                    //     .changeValue(newValue: newValue, quoteId: result.id!);
                    apiServices.setFollowUpOrderValue(
                        dealerId!, result.id!, newValue);
                  } else {
                    // Provider.of<setFollowUpOrderValue>(context, listen: false)
                    //     .changeValue(
                    //         newValue: result.orderFollowup, quoteId: result.id!);
                    apiServices.setFollowUpOrderValue(
                        dealerId!, result.id!, result.orderFollowup!);
                  }
                },
                items: [
                  DropdownMenuItem<String>(value: 'YES', child: Text('YES')),
                  DropdownMenuItem<String>(value: 'NO', child: Text('NO')),
                ],
              ),
            );
          },
        )),
        //DataCell(Text(result.orderFinHisNoteBox ?? '')),
        //DataCell(Text(result.customNotes ?? '')),

        DataCell(RoundButton(
          text: 'Notes',
          onTap: () async {
            await showDialog(
                context: myGlobalBuildContext,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      insetPadding: EdgeInsets.all(9),
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              right: -40,
                              top: -40,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xff941420),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          Form(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                  child: Text('Enter Order Notes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff941420),
                                          fontWeight: FontWeight.w600))),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  maxLines: 6,
                                  controller: orderNotesController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff941420))),
                                      hintText: 'Notes'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RoundButton(
                                text: 'Save',
                                onTap: () {
                                  apiServices.setOrderNotesValue(dealerId!,
                                      result.id!, orderNotesController.text);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');
                                },
                                color: Color(0xff941420),
                              )
                            ],
                          ))
                        ],
                      ),
                    ));
          },
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          text: 'Quote Analysis',
          onTap: () {
            Navigator.push(
                myGlobalBuildContext,
                MaterialPageRoute(
                    builder: (context) => RkDoorCalculatorView(
                        url:
                            'https://www.pricelink.net/dashboard/sales_details.php?user_id=$dealerId&quote_id=${result.id}&mobile_token=true')));
          },
          color: Colors.blue,
        )),

        DataCell(Text('${result.date} ${result.orderStatusVal ?? ''}')),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    myGlobalBuildContext,
                    MaterialPageRoute(
                        builder: (context) => RkDoorCalculatorView(
                            url:
                                'https://www.pricelink.net/rk-door-calculator/?user_id=$dealerId&cal_order_id=${result.id}&mobile_token=true')));
              },
              icon: Icon(Icons.edit),
              iconSize: 16,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.copy),
              iconSize: 16,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: myGlobalBuildContext,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Icon(Icons.warning),
                        content:
                            Text('Are u sure you want to delete this Order'),
                        actions: [
                          Center(
                            child: Column(
                              children: [
                                RoundButton(
                                  text: 'Delete',
                                  onTap: () {
                                    apiServices.deleteOrders(
                                        dealerId!, result.id!);
                                    Navigator.pop(context);
                                  },
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                RoundButton(
                                  text: 'Cancel',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete),
              iconSize: 16,
              color: Colors.red,
            ),
          ],
        )),
      ],
    );
  }
}
