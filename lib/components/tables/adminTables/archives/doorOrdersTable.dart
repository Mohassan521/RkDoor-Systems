import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/archiveOrderModel.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/services/services.dart';

class ArchiveDoorOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const ArchiveDoorOrdersTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<ArchiveDoorOrdersTable> createState() => _ArchiveDoorOrdersTableState();
}

class _ArchiveDoorOrdersTableState extends State<ArchiveDoorOrdersTable> {
  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    DateTime _dateTime = DateTime.now();
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

    return FutureBuilder(
      future: apiServices.getArchiveOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<ArchiveOrdersModel> list = snapshot.data ?? [];

        // List<OrdersCompleteResponse> filteredList =
        //     Provider.of<AllDoorOrdersForAdmin>(context).filteredDataModel;
        // List<OrdersCompleteResponse>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
          showEmptyRows: false,
          headingRowHeight: 48,
          dataRowMaxHeight: 48,
          columnSpacing: 20,
          rowsPerPage: 5,
          // headingRowColor: MaterialStateProperty.resolveWith(
          //     (states) => Color(0xff941420)),
          columns: const <DataColumn>[
            DataColumn(
                label: Text(
              'Customer Name',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Action Status',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Username',
              style: TextStyle(color: Color(0xff941420)),
            )),
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
              'Factory Order No.',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Filter Order Status',
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
              'Financial History',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Delivery Notes',
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
              'Keyless Access',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Factory Delivery Week',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Customer Tel No',
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
              'Total Quote Value (inc. VAT)',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Follow Up Date',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Follow Up Made',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Quote ID',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Anka Items',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Factory Confirmation',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Notes',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Custom Handles',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Quote Analysis',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Back to Quote',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Order Date History',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Total Sales Bonus',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Total Staff Bonus',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Admin Staff Bonus',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Dealer Support',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Online Survey Form',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              'Completed Orders',
              style: TextStyle(color: Color(0xff941420)),
            )),
            DataColumn(
                label: Text(
              '',
              style: TextStyle(color: Color(0xff941420)),
            )),
          ],
          source: MyData(list, _dateTime, widget.dealerId, widget.dealerName,
              _showDatePicker,
              myGlobalBuildContext: context),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final String? message;
  final String? dealerId;
  final String? dealerName;
  NetworkApiServices apiServices = NetworkApiServices();
  DateTime? _datetime = DateTime.now();
  //final String? prevNotesValue;
  void Function()? _showDatePicker;
  final BuildContext? myGlobalBuildContext;
  final List<ArchiveOrdersModel>? data;

  MyData(this.data, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.myGlobalBuildContext, this.message});

  File? _image;
  List<File> filesToUpload = [];
  Future<List<File>> getImage() async {
    final _picker = ImagePicker();

    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      filesToUpload.clear();
      filesToUpload.add(_image!);
      return filesToUpload;
    } else {
      print('no image selected');
      return [];
    }
  }

  @override
  DataRow? getRow(int index) {
    if (index >= totalRowCount) return null;

    final _formKey = GlobalKey<FormState>();

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

    TextEditingController confcode = TextEditingController();
    TextEditingController facDeliveryWeek = TextEditingController();
    TextEditingController ankaValue = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return DataRow.byIndex(
      color: MaterialStatePropertyAll(Colors.white),
      index: index,
      cells: [
        //1
        DataCell(Text(
          data![index].name ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //2
        DataCell(
          Container(
            height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
            width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.24,
            decoration: BoxDecoration(
                color: data![index].orderStatusVal == "Deposit Received" ||
                        data![index].orderStatusVal ==
                            "Preliminary Confirmation Issued" ||
                        data![index].orderStatusVal == "Awaiting Deposit" ||
                        data![index].orderStatusVal ==
                            "Revised Confirmation Issued" ||
                        data![index].orderStatusVal ==
                            "Awaiting Balance Payment" ||
                        data![index].orderStatusVal ==
                            "Awaiting Survey / Dimensions"
                    ? Colors.red
                    : Color(0xffb5e51d),
                borderRadius: BorderRadius.circular(19)),
            child: Center(
              child: Text(
                (data![index].orderStatusVal == "Deposit Received" ||
                        data![index].orderStatusVal ==
                            "Preliminary Confirmation Issued" ||
                        data![index].orderStatusVal == "Awaiting Deposit" ||
                        data![index].orderStatusVal ==
                            "Revised Confirmation Issued" ||
                        data![index].orderStatusVal ==
                            "Awaiting Balance Payment" ||
                        data![index].orderStatusVal ==
                            "Awaiting Survey / Dimensions")
                    ? 'Action Required'
                    : "No Action Required",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        //3
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //4
        DataCell(Text(
          data![index].quotationNumber ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //5
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //6
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
              controller: confcode,
              onChanged: (value) {
                // value = confcode.text;
                // apiServices.setOrderNum(
                //     data![index].id!, data![index].userId, value);
              },
            ))),

        //7
        DataCell(Text(
          data![index].orderStatusVal ?? "",
          style: TextStyle(fontSize: 12.5),
        )),

        //8
        DataCell(Builder(builder: (context) {
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: data![index].orderStatusVal == "Order Received"
                      ? Color(0xff9ad9ea)
                      : data![index].orderStatusVal == "Order Placed"
                          ? Color(0xffffc90d)
                          : data![index].orderStatusVal ==
                                  "Awaiting Balance Payment"
                              ? Colors.yellow
                              : data![index].orderStatusVal == "Delayed"
                                  ? Colors.red
                                  : data![index].orderStatusVal ==
                                          "In Production"
                                      ? Color(0xffb5351d)
                                      : data![index].orderStatusVal ==
                                              "Ready For Shipping"
                                          ? Color(0xff0080001)
                                          : data![index].orderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : data![index].orderStatusVal ==
                                                      "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6)
                                                  : data![index]
                                                              .orderStatusVal ==
                                                          "In Transit To UK"
                                                      ? Color(0xfffeaec9)
                                                      : data![index]
                                                                  .orderStatusVal ==
                                                              "In RKDS Warehouse"
                                                          ? Color(0xff9ad9ea)
                                                          : Color(0xff7092bf),
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.042,
              width: MediaQuery.sizeOf(context).width * 0.40,
              child: DropdownButton<String>(
                alignment: Alignment.center,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                underline: SizedBox(),
                iconEnabledColor: data![index].orderStatusVal ==
                        "Order Received"
                    ? Color(0xff9ad9ea)
                    : data![index].orderStatusVal == "Order Placed"
                        ? Color(0xffffc90d)
                        : data![index].orderStatusVal ==
                                "Awaiting Balance Payment"
                            ? Colors.yellow
                            : data![index].orderStatusVal == "Delayed"
                                ? Colors.red
                                : data![index].orderStatusVal == "In Production"
                                    ? Color(0xffb5351d)
                                    : data![index].orderStatusVal ==
                                            "Ready For Shipping"
                                        ? Color(0xff0080001)
                                        : data![index].orderStatusVal ==
                                                "Revised Confirmation Issued"
                                            ? Color(0xffa747a2)
                                            : data![index].orderStatusVal ==
                                                    "Final Confirmation Issued"
                                                ? Color(0xffc7bfe6)
                                                : data![index].orderStatusVal ==
                                                        "In Transit To UK"
                                                    ? Color(0xfffeaec9)
                                                    : data![index]
                                                                .orderStatusVal ==
                                                            "In RKDS Warehouse"
                                                        ? Color(0xff9ad9ea)
                                                        : Color(0xff7092bf),
                value: data![index].orderStatusVal,
                onChanged: (String? newValue) {
                  //newValue = result.orderFollowup;
                  // if (newValue != null) {
                  //   apiServices.setOrderStatus(
                  //       quote.id!, dealerData.userId, newValue);
                  // } else {
                  //   apiServices.setOrderStatus(
                  //       quote.id!, dealerData.userId, orderStatus);
                  // }
                },
                items: [
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Order Received',
                      child: Center(
                        child: Text(
                          'Order Received',
                          textAlign: TextAlign.center,
                        ),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Order Placed',
                      child: Center(
                        child:
                            Text('Order Placed', textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Awaiting Survey / Dimensions',
                      child: Center(
                        child: Text('Awaiting Survey / Dimensions',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Awaiting Deposit',
                      child: Center(
                        child: Text('Awaiting Deposit',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Deposit Received',
                      child: Center(
                        child: Text('Deposit Received',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Preliminary Confirmation Issued',
                      child: Center(
                        child: Text('Preliminary Confirmation Issued',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Revised Confirmation Issued',
                      child: Center(
                        child: Text('Revised Confirmation Issued',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Final Confirmation Issued',
                      child: Center(
                        child: Text('Final Confirmation Issued',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'In Production',
                      child: Center(
                        child:
                            Text('In Production', textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Ready For Shipping',
                      child: Center(
                        child: Text('Ready For Shipping',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'In Transit To UK',
                      child: Center(
                        child: Text('In Transit To UK',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'In RKDS Warehouse',
                      child: Center(
                        child: Text('In RKDS Warehouse',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Awaiting Balance Payment',
                      child: Center(
                        child: Text('Awaiting Balance Payment',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Out For Delivery',
                      child: Center(
                        child: Text('Out For Delivery',
                            textAlign: TextAlign.center),
                      )),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Delivered',
                      child: Center(
                          child:
                              Text('Delivered', textAlign: TextAlign.center))),
                  DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: 'Delayed',
                      child: Center(
                          child: Text('Delayed', textAlign: TextAlign.center))),
                ],
              ));
        })),

        //9
        DataCell(Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: data![index].orderPaymentStatusVal == "Awaiting Deposit"
                    ? Colors.yellow
                    : data![index].orderPaymentStatusVal == "Deposit Received"
                        ? Color(0xffffd5cd)
                        : data![index].orderPaymentStatusVal ==
                                "Awaiting Survey Fee"
                            ? Color(0xffbde2fd)
                            : data![index].orderPaymentStatusVal ==
                                    "Survey Fee Received"
                                ? Color(0xffd2ecbd)
                                : data![index].orderPaymentStatusVal ==
                                        "Awaiting Balance"
                                    ? Color(0xffffe8a1)
                                    : data![index].orderPaymentStatusVal ==
                                            "Balance Paid"
                                        ? Colors.orange
                                        : data![index].orderPaymentStatusVal ==
                                                "Awaiting Install Payment"
                                            ? Color(0xfffbd0ca)
                                            : data![index]
                                                        .orderPaymentStatusVal ==
                                                    "All Invoices Paid"
                                                ? Color(0xff0d714b)
                                                : Colors.yellow,
                borderRadius: BorderRadius.circular(5.5)),
            height: MediaQuery.sizeOf(context).height * 0.042,
            width: MediaQuery.sizeOf(context).width * 0.35,
            child: DropdownButton<String>(
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              alignment: Alignment.center,
              iconEnabledColor: data![index].orderPaymentStatusVal ==
                      "Awaiting Deposit"
                  ? Colors.yellow
                  : data![index].orderPaymentStatusVal == "Deposit Received"
                      ? Color(0xffffd5cd)
                      : data![index].orderPaymentStatusVal ==
                              "Awaiting Survey Fee"
                          ? Color(0xffbde2fd)
                          : data![index].orderPaymentStatusVal ==
                                  "Survey Fee Received"
                              ? Color(0xffd2ecbd)
                              : data![index].orderPaymentStatusVal ==
                                      "Awaiting Balance"
                                  ? Color(0xffffe8a1)
                                  : data![index].orderPaymentStatusVal ==
                                          "Balance Paid"
                                      ? Colors.orange
                                      : data![index].orderPaymentStatusVal ==
                                              "Awaiting Install Payment"
                                          ? Color(0xfffbd0ca)
                                          : data![index]
                                                      .orderPaymentStatusVal ==
                                                  "All Invoices Paid"
                                              ? Color(0xff0d714b)
                                              : Colors.yellow,
              isExpanded: true,
              //value: paymentStatus,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                //newValue = result.orderFollowup;
                // if (newValue != null) {
                //   // Provider.of<setFollowUpOrderValue>(context, listen: false)
                //   //     .changeValue(newValue: newValue, quoteId: result.id!);
                //   apiServices.setPaymentStatus(
                //       quote.id!, dealerData.userId, newValue);
                // } else {
                //   // Provider.of<setFollowUpOrderValue>(context, listen: false)
                //   //     .changeValue(
                //   //         newValue: result.orderFollowup, quoteId: result.id!);
                //   apiServices.setPaymentStatus(
                //       quote.id!, dealerData.userId, paymentStatus);
                // }
              },
              items: [
                DropdownMenuItem<String>(
                    alignment: Alignment.center, value: '', child: Text('')),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Awaiting Deposit',
                    child: Text(
                      'Awaiting Deposit',
                      textAlign: TextAlign.center,
                    )),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Deposit Received',
                    child:
                        Text('Deposit Received', textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Awaiting Survey Fee',
                    child: Text('Awaiting Survey Fee',
                        textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Survey Fee Received',
                    child: Text('Survey Fee Received',
                        textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Awaiting Balance',
                    child:
                        Text('Awaiting Balance', textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Balance Paid',
                    child: Text('Balance Paid', textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'Awaiting Install Payment',
                    child: Text('Awaiting Install Payment',
                        textAlign: TextAlign.center)),
                DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: 'All Invoices Paid',
                    child:
                        Text('All Invoices Paid', textAlign: TextAlign.center)),
              ],
            ),
          );
        })),
        //10
        DataCell(Text(data![index].documents ?? "")),
        // DataCell(
        //   data![index].documents!.isNotEmpty
        //       ? Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.OrderDocumentUpload(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               SizedBox(width: 10),
        //               // Generate icon widgets with spacing
        //               ...List<Widget>.generate(
        //                 data![index].documents!.length * 2 - 1,
        //                 (index) {
        //                   if (index % 2 == 0) {
        //                     var file = data![index].documents![index ~/ 2];
        //                     String fileExtension =
        //                         extension(file).toLowerCase();
        //                     return InkWell(
        //                       onTap: () {
        //                         if (fileExtension == ".pdf") {
        //                           print(file);
        //                           Navigator.push(
        //                             myGlobalBuildContext!,
        //                             MaterialPageRoute(
        //                               builder: (context) =>
        //                                   PDFViewer(url: file),
        //                             ),
        //                           );
        //                         } else if ([".jpg", ".jpeg", ".png"]
        //                             .contains(fileExtension)) {
        //                           print(file);
        //                           showImageDialog(myGlobalBuildContext!, file);
        //                         } else {
        //                           print(file);
        //                           Utils().showToast(
        //                             'File Format not supported',
        //                             Color(0xff941420),
        //                             Colors.white,
        //                           );
        //                         }
        //                       },
        //                       child: Icon(
        //                         fileExtension == '.jpg' ||
        //                                 fileExtension == '.jpeg' ||
        //                                 fileExtension == '.png'
        //                             ? Icons.file_open
        //                             : fileExtension == '.pdf'
        //                                 ? Icons.picture_as_pdf
        //                                 : Icons.file_present,
        //                         size: 16,
        //                         color: Colors.blue,
        //                       ),
        //                     );
        //                   } else {
        //                     return SizedBox(width: 5); // Space between icons
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       : Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.OrderDocumentUpload(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               Text(
        //                 'Add Files',
        //                 style: TextStyle(color: Colors.grey),
        //               )
        //             ],
        //           ),
        //         ),
        // ),

        //11
        DataCell(Text(data![index].manualQuickDocumentUpload ?? "")),
        // DataCell(
        //   data![index].manualQuickDocumentUpload!.isNotEmpty
        //       ? Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.OrderDocumentUpload(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               SizedBox(width: 10),
        //               // Generate icon widgets with spacing
        //               ...List<Widget>.generate(
        //                 data![index].manualQuickDocumentUpload!.length * 2 - 1,
        //                 (index) {
        //                   if (index % 2 == 0) {
        //                     var file = data![index]
        //                         .manualQuickDocumentUpload![index ~/ 2];
        //                     String fileExtension =
        //                         extension(file).toLowerCase();
        //                     return InkWell(
        //                       onTap: () {
        //                         if (fileExtension == ".pdf") {
        //                           print(file);
        //                           Navigator.push(
        //                             myGlobalBuildContext!,
        //                             MaterialPageRoute(
        //                               builder: (context) =>
        //                                   PDFViewer(url: file),
        //                             ),
        //                           );
        //                         } else if ([".jpg", ".jpeg", ".png"]
        //                             .contains(fileExtension)) {
        //                           print(file);
        //                           showImageDialog(myGlobalBuildContext!, file);
        //                         } else {
        //                           print(file);
        //                           Utils().showToast(
        //                             'File Format not supported',
        //                             Color(0xff941420),
        //                             Colors.white,
        //                           );
        //                         }
        //                       },
        //                       child: Icon(
        //                         fileExtension == '.jpg' ||
        //                                 fileExtension == '.jpeg' ||
        //                                 fileExtension == '.png'
        //                             ? Icons.file_open
        //                             : fileExtension == '.pdf'
        //                                 ? Icons.picture_as_pdf
        //                                 : Icons.file_present,
        //                         size: 16,
        //                         color: Colors.blue,
        //                       ),
        //                     );
        //                   } else {
        //                     return SizedBox(width: 5); // Space between icons
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       : Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.OrderDocumentUpload(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               Text(
        //                 'Add Files',
        //                 style: TextStyle(color: Colors.grey),
        //               )
        //             ],
        //           ),
        //         ),
        // ),
        //12
        DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            data![index].anticipatedDateVal!.isNotEmpty
                ? Text(
                    data![index].anticipatedDateVal!,
                    style: TextStyle(fontSize: 12.5),
                  )
                : Text(
                    'mm/dd/yyyy',
                    style: TextStyle(fontSize: 12.5),
                  ),
            DateButton(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: myGlobalBuildContext!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );

                // if (pickedDate != null) {
                //   apiServices.setAnticipatedDateForAdmin(
                //       dealerData.userId, quote.id!, pickedDate);
                // }
              },
              icon: Icons.date_range,
            ),
          ],
        )),
        //13
        DataCell(Text(data![index].invoicesDocuments ?? "")),
        // DataCell(
        //   data![index].invoicesDocuments!.isNotEmpty
        //       ? Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               SizedBox(width: 10),
        //               // Create icons for each file
        //               ...List<Widget>.generate(
        //                 data![index].invoicesDocuments!.length * 2 - 1,
        //                 (index) {
        //                   if (index % 2 == 0) {
        //                     var file =
        //                         data![index].invoicesDocuments![index ~/ 2];
        //                     String fileExtension =
        //                         extension(file).toLowerCase();
        //                     return InkWell(
        //                       onTap: () {
        //                         if (fileExtension == ".pdf") {
        //                           print(file);
        //                           Navigator.push(
        //                             myGlobalBuildContext!,
        //                             MaterialPageRoute(
        //                               builder: (context) =>
        //                                   PDFViewer(url: file),
        //                             ),
        //                           );
        //                         } else if ([".jpg", ".jpeg", ".png"]
        //                             .contains(fileExtension)) {
        //                           print(file);
        //                           showImageDialog(myGlobalBuildContext!, file);
        //                         } else {
        //                           print(file);
        //                           Utils().showToast(
        //                             'File Format not supported',
        //                             Color(0xff941420),
        //                             Colors.white,
        //                           );
        //                         }
        //                       },
        //                       child: Icon(
        //                         fileExtension == '.jpg' ||
        //                                 fileExtension == '.jpeg' ||
        //                                 fileExtension == '.png'
        //                             ? Icons.file_open
        //                             : fileExtension == '.pdf'
        //                                 ? Icons.picture_as_pdf
        //                                 : Icons.file_present,
        //                         size: 16,
        //                         color: Colors.blue,
        //                       ),
        //                     );
        //                   } else {
        //                     return SizedBox(width: 5); // Space between icons
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       : Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               Text(
        //                 'Add Files',
        //                 style: TextStyle(color: Colors.grey),
        //               )
        //             ],
        //           ),
        //         ),
        // ),
        //14
        DataCell(Text(
          data![index].balDueBeforeDelivery ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //15
        DataCell(RoundButton(
          onTap: () {
            // Navigator.push(
            //     myGlobalBuildContext!,
            //     MaterialPageRoute(
            //         builder: (context) => FinancialHistoryForAdminOrders(
            //               dealerName: dealerData.dealerName,
            //               dealerId: dealerData.userId.toString(),
            //               ordersModel: quote,
            //             )));
          },
          text: "Financial History",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.24,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
        )),
        //16
        DataCell(Text(data![index].deliveryDocuments ?? "")),
        // DataCell(
        //   data![index].deliveryDocuments!.isNotEmpty
        //       ? Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               SizedBox(width: 10),
        //               // Create icons for each file
        //               ...List<Widget>.generate(
        //                 data![index].deliveryDocuments!.length * 2 - 1,
        //                 (index) {
        //                   if (index % 2 == 0) {
        //                     var file =
        //                         data![index].deliveryDocuments![index ~/ 2];
        //                     String fileExtension =
        //                         extension(file).toLowerCase();
        //                     return InkWell(
        //                       onTap: () {
        //                         if (fileExtension == ".pdf") {
        //                           print(file);
        //                           Navigator.push(
        //                             myGlobalBuildContext!,
        //                             MaterialPageRoute(
        //                               builder: (context) =>
        //                                   PDFViewer(url: file),
        //                             ),
        //                           );
        //                         } else if ([".jpg", ".jpeg", ".png"]
        //                             .contains(fileExtension)) {
        //                           print(file);
        //                           showImageDialog(myGlobalBuildContext!, file);
        //                         } else {
        //                           print(file);
        //                           Utils().showToast(
        //                             'File Format not supported',
        //                             Color(0xff941420),
        //                             Colors.white,
        //                           );
        //                         }
        //                       },
        //                       child: Icon(
        //                         fileExtension == '.jpg' ||
        //                                 fileExtension == '.jpeg' ||
        //                                 fileExtension == '.png'
        //                             ? Icons.file_open
        //                             : fileExtension == '.pdf'
        //                                 ? Icons.picture_as_pdf
        //                                 : Icons.file_present,
        //                         size: 16,
        //                         color: Colors.blue,
        //                       ),
        //                     );
        //                   } else {
        //                     return SizedBox(width: 5); // Space between icons
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       : Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               Text(
        //                 'Add Files',
        //                 style: TextStyle(color: Colors.grey),
        //               )
        //             ],
        //           ),
        //         ),
        // ),
        //17
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //18
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //19
        DataCell(Center(
            child: Text(
          data![index].marineGradeVal ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //20
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //21
        DataCell(Center(
            child: Text(
          data![index].dileveryPostCodeC13 ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //22
        DataCell(Text(
          data![index].totalWeightKg ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //23
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //24
        DataCell(Text(
          data![index].ekeylessAccess ?? "",
          style: TextStyle(fontSize: 12.5),
        )),

        //25
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
              controller: facDeliveryWeek,
              onChanged: (value) {
                // value = facDeliveryWeek.text;
                // apiServices.setFacDeliveryWeekValue(
                //     quote.id!, dealerData.userId, value);
                // Timer(Duration(seconds: 5), () {
                //   apiServices.factoryDeliveryWeekSteelOrder(
                //       dealerId, value, result.id!);
                // });
              },
            ))),
        //26
        DataCell(Text(
          data![index].telephoneNumber ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //27
        DataCell(Text(
          data![index].customerEmail ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //28
        DataCell(Text(
          data![index].dileveryPostCodeC13 ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //29
        DataCell(Text(
          data![index].date ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //30
        DataCell(Text(
          data![index].time ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //31
        DataCell(Center(
            child: Text(
          data![index].wholeTotal ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //32
        DataCell(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (data![index].orderDate != null)
                  ? data![index].orderDate!
                  : "mm/dd/yyyy",
              style: TextStyle(fontSize: 12.5),
            ),
            DateButton(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: myGlobalBuildContext!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );

                if (pickedDate != null) {
                  // apiServices.setOrderDateForAdmin(
                  //     dealerData.userId, quote.id!, pickedDate);
                }
              },
              icon: Icons.calendar_month,
            )
          ],
        )),
        //33
        DataCell(Center(
          child: DropdownButton<String>(
            value: (data![index].orderFollowup == "")
                ? "NO"
                : data![index].orderFollowup!,
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            style: TextStyle(fontSize: 12.5, color: Colors.black),
            onChanged: (String? newValue) {
              //newValue = result.orderFollowup;
              if (newValue != null) {
                // apiServices.setFollowUpForAdmin(
                //     dealerData.userId, quote.id!, newValue);
              } else {}
            },
            items: [
              DropdownMenuItem<String>(
                  value: 'YES',
                  child: Text(
                    'YES',
                    style: TextStyle(fontSize: 12.5),
                  )),
              DropdownMenuItem<String>(
                  value: 'NO',
                  child: Text(
                    'NO',
                    style: TextStyle(fontSize: 12.5),
                  )),
            ],
          ),
        )),
        //34
        DataCell(Text(
          data![index].id ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        //35
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
              controller: ankaValue,
              onChanged: (value) {
                // Timer(Duration(seconds: 5), () {
                //   apiServices.factoryDeliveryWeekSteelOrder(
                //       dealerId, value, result.id!);
                // });
              },
            ))),
        //36
        DataCell(Text(data![index].facConfDocuments ?? "")),
        // DataCell(
        //   data![index].facConfDocuments!.isNotEmpty
        //       ? Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               SizedBox(width: 10),
        //               // Create icons for each file
        //               ...List<Widget>.generate(
        //                 data![index].facConfDocuments!.length * 2 - 1,
        //                 (index) {
        //                   if (index % 2 == 0) {
        //                     var file =
        //                         data![index].facConfDocuments![index ~/ 2];
        //                     String fileExtension =
        //                         extension(file).toLowerCase();
        //                     return InkWell(
        //                       onTap: () {
        //                         if (fileExtension == ".pdf") {
        //                           print(file);
        //                           Navigator.push(
        //                             myGlobalBuildContext!,
        //                             MaterialPageRoute(
        //                               builder: (context) =>
        //                                   PDFViewer(url: file),
        //                             ),
        //                           );
        //                         } else if ([".jpg", ".jpeg", ".png"]
        //                             .contains(fileExtension)) {
        //                           print(file);
        //                           showImageDialog(myGlobalBuildContext!, file);
        //                         } else {
        //                           print(file);
        //                           Utils().showToast(
        //                             'File Format not supported',
        //                             Color(0xff941420),
        //                             Colors.white,
        //                           );
        //                         }
        //                       },
        //                       child: Icon(
        //                         fileExtension == '.jpg' ||
        //                                 fileExtension == '.jpeg' ||
        //                                 fileExtension == '.png'
        //                             ? Icons.file_open
        //                             : fileExtension == '.pdf'
        //                                 ? Icons.picture_as_pdf
        //                                 : Icons.file_present,
        //                         size: 16,
        //                         color: Colors.blue,
        //                       ),
        //                     );
        //                   } else {
        //                     return SizedBox(width: 5); // Space between icons
        //                   }
        //                 },
        //               ),
        //             ],
        //           ),
        //         )
        //       : Center(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   // getImage().then((value) {
        //                   //   apiServices.setInvoiceDocumentForAdmin(
        //                   //       quote.id!, dealerData.userId, value);
        //                   // });
        //                 },
        //                 icon: Icon(Icons.add_circle_outline),
        //               ),
        //               Text(
        //                 'Add Files',
        //                 style: TextStyle(color: Colors.grey),
        //               )
        //             ],
        //           ),
        //         ),
        // ),
        //37
        DataCell(RoundButton(
          onTap: () async {
            notesController.text = data![index].notes ?? "";
            await showDialog(
                context: myGlobalBuildContext!,
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
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                      child: Text('Enter Notes',
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
                                      // initialValue: result.notes,
                                      controller: notesController,
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
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        apiServices.setNotesValueForAdmin(
                                            data![index].id!,
                                            int.parse(
                                                data![index].userId ?? ""),
                                            notesController.text);
                                      }

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
          text: "Notes",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.15,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
        )),
        // custom handle file
        //38
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //39
        DataCell(RoundButton(
          onTap: () {
            // Navigator.push(
            //     myGlobalBuildContext!,
            //     MaterialPageRoute(
            //         builder: (context) => QuoteAnalysisForAdmin(
            //               dealerId: dealerData.userId.toString(),
            //               quoteId: quote.id,
            //             )));
          },
          text: "Quote Analysis",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.18,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
        )),
        //40
        DataCell(RoundButton(
          onTap: () {
            // apiServices.backToQuote(
            //     dealerData.userId.toString(), quote.id!);
          },
          text: "Back To Quote",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.21,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
        )),
        //41
        DataCell(Text(
          "${data![index].date} ${data![index].orderStatusVal}",
          style: TextStyle(fontSize: 12.5),
        )),
        //42
        DataCell(Center(
            child: Text(
          "${data![index].saleBonus}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //43
        DataCell(Center(
            child: Text(
          "${data![index].saleStaffBonus}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //44
        DataCell(Center(
            child: Text(
          "${data![index].adminStaffBonus}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5),
        ))),
        //45
        DataCell(Text(
          "",
          style: TextStyle(fontSize: 12.5),
        )),
        //46
        DataCell(RoundButton(
          onTap: () {},
          text: "Survey Form",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.20,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.042,
        )),
        //47
        DataCell(RoundButton(
          onTap: () {
            // apiServices.CloseOrderFromAdmin(dealerData.userId, quote.id!);
          },
          text: "Order Complete - Archive File",
          color: Colors.blue,
          width: MediaQuery.sizeOf(myGlobalBuildContext!).width * 0.35,
          height: MediaQuery.sizeOf(myGlobalBuildContext!).height * 0.05,
        )),

        //48
        DataCell(Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    myGlobalBuildContext!,
                    MaterialPageRoute(
                        builder: (context) => CalculatorWebView(
                            dealerId: dealerId!,
                            url:
                                "https://www.pricelink.net/rk-door-calculator/?user_id=${data![index].userId}&cal_order_id=${data![index].id}&mobile_token=true")));
              },
              child: Icon(
                Icons.edit,
                size: 14,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.copy,
              size: 14,
            ),
            SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {
                // apiServices.DeleteOrderFromAdmin(
                //     dealerData.userId, quote.id!);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 14,
              ),
            ),
          ],
        ))

        // Add more cells for other quote fields if needed
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRowCount;

  @override
  int get selectedRowCount => 0;

  int get totalRowCount => 5;
}
