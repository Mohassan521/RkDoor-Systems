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

class OrdersTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const OrdersTable({super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<OrdersTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<OrdersTable> {
  // DateTime _dateTime = DateTime.now();
  // String? prevValue;
  // void _showDatePicker() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(2000),
  //           lastDate: DateTime(2050))
  //       .then((value) {
  //     setState(() {
  //       _dateTime = value!;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();
    //print('employee/dealerId: ${widget.dealerId}');
    return FutureBuilder(
      future: apiServices.getOrdersList(widget.dealerId!.toString(), ""),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        print(widget.dealerId);
        List<OrdersModel>? list =
            snapshot.data != null || snapshot.data!.isNotEmpty
                ? snapshot.data
                : [];

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            child: PaginatedDataTable(
                rowsPerPage: (list!.length >= 5 && list.isNotEmpty)
                    ? 5
                    : (list.isEmpty)
                        ? 1
                        : list.length,
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
                    'Order Confirmation',
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
                    'Delivery Note',
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
                    'Balance Due',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Financial History',
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
                    'Back To Quote',
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
                source: MyData(list, widget.dealerId, widget.dealerName,
                    myGlobalBuildContext: context)),
          );
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final String? dealerId;
  final String? dealerName;
  NetworkApiServices apiServices = NetworkApiServices();

  final BuildContext myGlobalBuildContext;
  TextEditingController orderNotesController = TextEditingController();
  final List<OrdersModel> data;

  MyData(this.data, this.dealerId, this.dealerName,
      {required this.myGlobalBuildContext});

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  OrdersTable table = OrdersTable();

  @override
  DataRow getRow(int index) {
    final OrdersModel result = data[index];

    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(result.name != null ? result.name! : "")),
      DataCell(
          Text(result.quotationNumber != null ? result.quotationNumber! : "")),
      DataCell(Text(dealerName != null ? dealerName! : "")),
      DataCell(Text(result.orderNoVal != null ? result.orderNoVal! : "")),
      DataCell(
          Text(result.orderStatusVal != null ? result.orderStatusVal! : "")),
      // DataCell(
      //     Text(result.facConfDocuments!.map((e) => e.toString()).join(', '))),
      DataCell(result.facConfDocuments!.isNotEmpty
          ? Center(child: Icon(Icons.file_open))
          : Center(child: Text('No file avaibale'))),
      DataCell(Text(
          result.anticipatedDateVal != null ? result.anticipatedDateVal! : "")),
      // DataCell(
      //     Text(result.invoicesDocuments!.map((e) => e.toString()).join(', '))),
      DataCell(result.invoicesDocuments!.isNotEmpty
          ? Center(child: Icon(Icons.file_open))
          : Center(child: Text('No file avaibale'))),
      // DataCell(
      //     Text(result.deliveryDocuments!.map((e) => e.toString()).join(', '))),
      DataCell(result.deliveryDocuments!.isNotEmpty
          ? Center(child: Icon(Icons.file_open))
          : Center(child: Text('No file avaibale'))),
      DataCell(
          Text(result.marineGradeVal != null ? result.marineGradeVal! : '')),
      DataCell(Text(result.frameSizeHeightWidth != null
          ? result.frameSizeHeightWidth!
          : "")),
      DataCell(Text(result.lhGoalPostE44 != null ? result.lhGoalPostE44! : "")),
      DataCell(Text(result.totalWeightKg != null ? result.totalWeightKg! : "")),
      DataCell(Text(result.thresholdType != null ? result.thresholdType! : "")),
      DataCell(
          Text(result.telephoneNumber != null ? result.telephoneNumber! : "")),
      DataCell(Text(result.customerEmail != null ? result.customerEmail! : "")),
      DataCell(Text(result.dileveryPostCodeC13 != null
          ? result.dileveryPostCodeC13!
          : "")),
      DataCell(Text(result.id != null ? result.id! : "")),
      DataCell(Text(result.date != null ? result.date! : "")),
      DataCell(Text(result.time != null ? result.time! : "")),
      DataCell(Text(result.wholeTotal != null ? result.wholeTotal! : "")),
      DataCell(Consumer<FollowUpOrderDate>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (result.orderDate == null) ? result.orderDate! : "mm/dd/yyyy",
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
              value: (result.orderFollowup == "YES" ||
                      result.orderFollowup == "NO")
                  ? result.orderFollowup
                  : "NO",
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
      DataCell(Text(result.balDueBeforeDelivery != null
          ? result.balDueBeforeDelivery!
          : "")),
      //DataCell(Text(result.orderFinHisNoteBox ?? '')),
      //DataCell(Text(result.customNotes ?? '')),
      DataCell(RoundButton(
        text: 'Financial History',
        onTap: () {
          Navigator.push(
              myGlobalBuildContext,
              MaterialPageRoute(
                  builder: (context) => FinancialHistory(
                        dealerId: dealerId,
                        id: result.id,
                        quotationNumber: result.quotationNumber,
                        ordersModel: result,
                      )));
        },
        color: Colors.blue,
      )),
      DataCell(RoundButton(
        text: 'Notes',
        onTap: () async {
          orderNotesController.text = result.notes ?? "";
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
      DataCell(RoundButton(
        text: 'Back to Quote',
        onTap: () {
          apiServices.backToQuote(dealerId!, result.id!);
        },
        color: Colors.blue,
      )),
      DataCell(Text(
          '${result.date != null ? result.date : ""} ${result.orderStatusVal != null ? result.orderStatusVal! : ""}')),
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
                      content: Text('Are u sure you want to delete this Order'),
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
    ]);
  }
}
