import 'package:flutter/material.dart';

import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/quoteAnalysis.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:path/path.dart';

class AllDoorOrdersTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;

  const AllDoorOrdersTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AllDoorOrdersTable> createState() => _AllDoorOrdersTableState();
}

class _AllDoorOrdersTableState extends State<AllDoorOrdersTable> {
  DateTime _dateTime = DateTime.now();
  String? prevValue;
  List<OrdersModel>? list = [];
  void _showDatePicker() {
    showDatePicker(
      context: context as BuildContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then(
      (value) {
        setState(
          () {
            _dateTime = value!;
          },
        );
      },
    );
  }

  String searchInput = "";

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: TextFormField(
            onChanged: (value) {
              setState(
                () {
                  searchInput = value;
                },
              );
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              hintText: 'Search by Customer Name or Quote ID',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: apiServices.getOrdersList(widget.dealerId!, "",
              searchInput: searchInput),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: [
                  PaginatedDataTable(
                      showEmptyRows: false,
                      headingRowHeight: 48,
                      dataRowMaxHeight: 48,
                      columnSpacing: 20,
                      rowsPerPage: 1,
                      // headingRowColor:
                      //     MaterialStateProperty.resolveWith((states) => Colors.white),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Customer Name',
                            style: TextStyle(
                              color: Color(0xff941420),
                            ),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          'Quotation Number',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Dealer',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Quote Created By',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Factory Order No.',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Order Status',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Payment Status',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Order Confirmation',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Quick PDF Quotation',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Anticipated Delivery Date',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Invoices',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Balance Due',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Delivery Note',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Profile',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Door Model',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Marine Grade Finish',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Frame Size',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Goalpost Construction',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Overall Weight',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Threshold Type',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Keyless access',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Customer Tel No.',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Customer Email',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Post Code',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Quote ID',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Date',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Time',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Total Quote Value',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Follow up Date',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Follow up Made',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Financial History',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Notes',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Quote Analysis',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          'Order Date History',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                        DataColumn(
                            label: Text(
                          '',
                          style: TextStyle(color: Color(0xff941420)),
                        )),
                      ],
                      source: MyData([], _dateTime, widget.dealerId,
                          widget.dealerName, _showDatePicker,
                          myGlobalBuildContext: context)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 55),
                        Text('Getting your desired result'),
                      ],
                    ),
                  ),
                ],
              );
            }

            list = snapshot.data ?? [];

            List<OrdersModel> filteredList =
                Provider.of<AllEntranceDoorOrderSearchedData>(context)
                    .filteredDataModel;
            List<OrdersModel>? displayData =
                filteredList.isNotEmpty ? filteredList : list;

            return PaginatedDataTable(
                showEmptyRows: false,
                headingRowHeight: 48,
                dataRowMaxHeight: 48,
                columnSpacing: 20,
                rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                    ? 5
                    : (list!.isEmpty)
                        ? 1
                        : list!.length,
                // headingRowColor:
                //     MaterialStateProperty.resolveWith((states) => Colors.white),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Customer Name',
                      style: TextStyle(
                        color: Color(0xff941420),
                      ),
                    ),
                  ),
                  DataColumn(
                      label: Text(
                    'Quotation Number',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Quote Created By',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Factory Order No.',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Order Status',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Payment Status',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Order Confirmation',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Quick PDF Quotation',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Anticipated Delivery Date',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Invoices',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Balance Due',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Delivery Note',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Profile',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Door Model',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Marine Grade Finish',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Frame Size',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Goalpost Construction',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Overall Weight',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Threshold Type',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Keyless access',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Customer Tel No.',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Customer Email',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Post Code',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Quote ID',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Time',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Total Quote Value',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Follow up Date',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Follow up Made',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Financial History',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Notes',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Quote Analysis',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Order Date History',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    '',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                ],
                source: MyData(displayData!, _dateTime, widget.dealerId,
                    widget.dealerName, _showDatePicker,
                    myGlobalBuildContext: context));
          },
        ),
      ],
    );
  }
}

class MyData extends DataTableSource {
  final String? dealerId;
  final String? dealerName;
  NetworkApiServices apiServices = NetworkApiServices();
  DateTime _datetime = DateTime.now();
  //final String? prevNotesValue;
  void Function()? _showDatePicker;
  final BuildContext myGlobalBuildContext;
  TextEditingController orderNotesController = TextEditingController();
  final List<OrdersModel> data;

  MyData(this.data, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.myGlobalBuildContext});

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  AllDoorOrdersTable table = AllDoorOrdersTable();

  @override
  DataRow getRow(int index) {
    // String? prevValue =
    //print(prevNotesValue);
    //var userData = Provider.of<UserLoginData>(myGlobalBuildContext).dataModel;
    var dealerData = Provider.of<DealerData>(myGlobalBuildContext).model;
    final OrdersModel result = data[index];

    List<dynamic> steelOrderFile = result.documents ?? [];
    String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.last : '';
    String fileExtension = extension(filePath).toLowerCase();

    List<dynamic> invoicesDocuments = result.invoicesDocuments ?? [];
    String invoiceFilePath =
        invoicesDocuments.isNotEmpty ? invoicesDocuments.last : '';
    String invoiceFileExtension = extension(invoiceFilePath).toLowerCase();

    // print(invoiceFileExtension);

    List<dynamic> deliveryDocuments = result.deliveryDocuments ?? [];
    String ddFilePath =
        deliveryDocuments.isNotEmpty ? deliveryDocuments.first : '';
    String ddFileExtension = extension(ddFilePath).toLowerCase();

    print('delivery doc file ext: $ddFileExtension');

    //Widget selectedTable = determineTable(result, dealerId!);
    showImageDialog(BuildContext context, String imageUrl) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          insetPadding: EdgeInsets.all(9),
          content: SizedBox(
            height: 200.0, // Set the height as needed
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }

    return DataRow.byIndex(
      color: MaterialStatePropertyAll(Colors.white),
      index: index,
      cells: <DataCell>[
        DataCell(Text(
          result.name ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        DataCell(Text(result.quotationNumber ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(dealerData.dealerName ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(dealerName ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.orderNoVal != "" ? result.orderNoVal! : "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.orderStatusVal == "Order Received"
                      ? Color(0xff9ad9ea)
                      : result.orderStatusVal == "Order Placed"
                          ? Color(0xffffc90d)
                          : result.orderStatusVal == "Awaiting Balance Payment"
                              ? Colors.yellow
                              : result.orderStatusVal == "Delayed"
                                  ? Colors.red
                                  : result.orderStatusVal == "In Production"
                                      ? Color(0xffb5351d)
                                      : result.orderStatusVal ==
                                              "Ready For Shipping"
                                          ? Color(0xff0080001)
                                          : result.orderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : result.orderStatusVal ==
                                                      "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6)
                                                  : result.orderStatusVal ==
                                                          "In Transit To UK"
                                                      ? Color(0xfffeaec9)
                                                      : result.orderStatusVal ==
                                                              "In RKDS Warehouse"
                                                          ? Color(0xff9ad9ea)
                                                          : Color(0xff7092bf),
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.042,
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: Center(
                  child: Text(
                result.orderStatusVal!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              )));
        })),

        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.orderPaymentStatusVal == "Awaiting Deposit"
                      ? Colors.yellow
                      : result.orderPaymentStatusVal == "Deposit Received"
                          ? Color(0xffffd5cd)
                          : result.orderPaymentStatusVal ==
                                  "Awaiting Survey Fee"
                              ? Color(0xffbde2fd)
                              : result.orderPaymentStatusVal ==
                                      "Survey Fee Received"
                                  ? Color(0xffd2ecbd)
                                  : result.orderPaymentStatusVal ==
                                          "Awaiting Balance"
                                      ? Color(0xffffe8a1)
                                      : result.orderPaymentStatusVal ==
                                              "Balance Paid"
                                          ? Colors.orange
                                          : result.orderPaymentStatusVal ==
                                                  "Awaiting Install Payment"
                                              ? Color(0xfffbd0ca)
                                              : result.orderPaymentStatusVal ==
                                                      "All Invoices Paid"
                                                  ? Color(0xff0d714b)
                                                  : Colors.yellow,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.042,
              width: MediaQuery.sizeOf(context).width * 0.22,
              child: Center(
                  child: Text(
                result.orderPaymentStatusVal ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              )));
        })),
        DataCell(
          result.documents!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.documents!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              myGlobalBuildContext,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(myGlobalBuildContext, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Icon(
                          (fileExtension == '.jpg' ||
                                  fileExtension == '.jpeg' ||
                                  fileExtension == '.png')
                              ? Icons.file_open
                              : (fileExtension == '.pdf')
                                  ? Icons.picture_as_pdf
                                  : Icons.file_present,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        //DataCell(result.facConfDocuments!.isNotEmpty ? Text('file available') : Text("")),
        DataCell(Text(result.quickPdfUrl != null ? result.quickPdfUrl! : "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Builder(builder: (context) {
          return Center(
            child: Container(
                decoration: BoxDecoration(
                    color: result.anticipatedDateVal != ""
                        ? Colors.yellow
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.5)),
                height: MediaQuery.sizeOf(context).height * 0.042,
                width: MediaQuery.sizeOf(context).width * 0.28,
                child: Center(
                    child: Text(
                  result.anticipatedDateVal ?? "",
                  style: TextStyle(color: Colors.black, fontSize: 12.5),
                ))),
          );
        })),
        // DataCell(Text(
        //     result.invoicesDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(
          result.invoicesDocuments!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.invoicesDocuments!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              myGlobalBuildContext,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(myGlobalBuildContext, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Icon(
                          (invoiceFileExtension == '.jpg' ||
                                  invoiceFileExtension == '.jpeg' ||
                                  invoiceFileExtension == '.png')
                              ? Icons.file_open
                              : (invoiceFileExtension == '.pdf')
                                  ? Icons.picture_as_pdf
                                  : Icons.file_present,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        DataCell(Text(result.balDueBeforeDelivery ?? "",
            style: TextStyle(fontSize: 12.5))),
        // DataCell(Text(
        //     result.deliveryDocuments!.map((e) => e.toString()).join(', '))),
        // DataCell(result.deliveryDocuments!.isNotEmpty ? Text('file available') : Text("")),
        DataCell(
          result.deliveryDocuments!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.deliveryDocuments!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              myGlobalBuildContext,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(myGlobalBuildContext, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Icon(
                          (ddFileExtension == '.jpg' ||
                                  ddFileExtension == '.jpeg' ||
                                  ddFileExtension == '.png')
                              ? Icons.file_open
                              : (ddFileExtension == '.pdf')
                                  ? Icons.picture_as_pdf
                                  : Icons.file_present,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        DataCell(Text(result.profile ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(result.doorModel ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Builder(builder: (context) {
          return Center(
            child: Container(
                decoration: BoxDecoration(
                    color: result.marineGradeVal == "YES"
                        ? Color(0xff9ad9ea)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.5)),
                height: MediaQuery.sizeOf(context).height * 0.042,
                width: MediaQuery.sizeOf(context).width * 0.18,
                child: Center(
                  child: Text(
                    result.marineGradeVal ?? "",
                    style: TextStyle(fontSize: 12.5),
                  ),
                )),
          );
        })),

        DataCell(Text(result.frameSizeHeightWidth ?? "",
            style: TextStyle(fontSize: 12.5))),
        //DataCell(Text(result.lhGoalPostE44 ?? "")),
        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.lhGoalPostE44 == "YES"
                      ? const Color.fromARGB(255, 200, 197, 169)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.042,
              width: MediaQuery.sizeOf(context).width * 0.18,
              child: Center(
                  child: Text(
                result.lhGoalPostE44 ?? "",
                style: TextStyle(fontSize: 12.5),
              )));
        })),

        DataCell(
            Text(result.totalWeightKg ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.thresholdType ==
                              "C - 25MM HIGH PROJECTING CILL - 85MM WIDE" ||
                          result.thresholdType ==
                              "C - 25MM HIGH PROJECTING CILL - 150MM WIDE" ||
                          result.thresholdType ==
                              "C - 25MM HIGH PROJECTING CILL - 190MM WIDE" ||
                          result.thresholdType ==
                              "C - 25MM HIGH PROJECTING CILL - 225MM WIDE"
                      ? Color(0xff9ad9ea)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.042,
              width: MediaQuery.sizeOf(context).width * 0.33,
              child: Center(
                  child: Text(
                result.thresholdType ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              )));
        })),
        DataCell(Text(result.ekeylessAccess ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.telephoneNumber ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(result.customerEmail ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.dileveryPostCodeC13 ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.id ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.date ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.time ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(result.wholeTotal ?? "", style: TextStyle(fontSize: 12.5))),
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
        //DataCell(Text(result.orderFinHisNoteBox ?? "")),
        //DataCell(Text(result.customNotes ?? "")),
        DataCell(RoundButton(
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.24,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
          text: 'Financial History',
          onTap: () {
            Navigator.push(
                myGlobalBuildContext,
                MaterialPageRoute(
                    builder: (context) => FinancialHistory(
                          dealerId: dealerId,
                          dealerName: dealerName,
                          ordersModel: result,
                        )));
          },
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.15,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
          text: 'Notes',
          onTap: () async {
            orderNotesController.text = result.notes!;
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
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.20,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
          text: 'Quote Analysis',
          onTap: () {
            Navigator.push(
                myGlobalBuildContext,
                MaterialPageRoute(
                    builder: (context) => OrdersQuoteAnalysis(
                          dealerId: dealerId,
                          quoteId: result.id,
                        )));
          },
          color: Colors.blue,
        )),

        DataCell(Text('${result.date} ${result.orderStatusVal ?? ""}',
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(""))
        // DataCell(Row(
        //   children: [
        //     IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //             myGlobalBuildContext,
        //             MaterialPageRoute(
        //                 builder: (context) => RkDoorCalculatorView(
        //                     url:
        //                         'https://www.pricelink.net/rk-door-calculator/?user_id=$dealerId&cal_order_id=${result.id}&mobile_token=true')));
        //       },
        //       icon: Icon(Icons.edit),
        //       iconSize: 16,
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         apiServices.duplicateOrders(dealerId!, result.id!);
        //       },
        //       icon: Icon(Icons.copy),
        //       iconSize: 16,
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         showDialog(
        //             context: myGlobalBuildContext,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 title: Icon(Icons.warning),
        //                 content:
        //                     Text('Are u sure you want to delete this Order'),
        //                 actions: [
        //                   Center(
        //                     child: Column(
        //                       children: [
        //                         RoundButton(
        //                           text: 'Delete',
        //                           onTap: () {
        //                             apiServices.deleteOrders(
        //                                 dealerId!, result.id!);
        //                             Navigator.pop(context);
        //                           },
        //                           color: Colors.red,
        //                         ),
        //                         SizedBox(
        //                           height: 15,
        //                         ),
        //                         RoundButton(
        //                           text: 'Cancel',
        //                           onTap: () {
        //                             Navigator.pop(context);
        //                           },
        //                           color: Colors.blue,
        //                         ),
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               );
        //             });
        //       },
        //       icon: Icon(Icons.delete),
        //       iconSize: 16,
        //       color: Colors.red,
        //     ),
        //   ],
        // )),
      ],
    );
  }
}
