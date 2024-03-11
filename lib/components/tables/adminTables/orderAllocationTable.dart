import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminPanelOrders.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class OrdersAllocationTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const OrdersAllocationTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<OrdersAllocationTable> createState() => _OrdersAllocationTableState();
}

class _OrdersAllocationTableState extends State<OrdersAllocationTable> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<OrdersCompleteResponse>? list = [];

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
      future: apiServices.getAdminOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                  ? 5
                  : (list!.isEmpty)
                      ? 1
                      : list!.length,
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
                  'Action Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Username',
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
                  'Delivery Notes',
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
                  'Keyless Access',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Delivery Week',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No',
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
                  'Total Quote Value (inc. VAT)',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Made',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anka Items',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Custom Handles',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Back to Quote',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Date History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sales Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Support',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Completed Orders',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Allocate to other users',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(list!, _dateTime, widget.dealerId,
                  widget.dealerName, _showDatePicker,
                  myGlobalBuildContext: context)),
        );
      },
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
  final List<OrdersCompleteResponse>? dealerDataList;

  MyData(this.dealerDataList, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.myGlobalBuildContext});

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

    int currentIndex = 0;
    for (var dealerData in dealerDataList!) {
      for (var quote in dealerData.orders) {
        // TextEditingController configuratorCode = TextEditingController();
        // configuratorCode.text = quote.enquiryConfCode ?? "";

        confcode.text = quote.orderNoVal ?? "";
        facDeliveryWeek.text = quote.facDeliveryWeeksVal ?? "";
        ankaValue.text = quote.ankaItems ?? "";

        List<dynamic> steelOrderFile = quote.documents ?? [];
        String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
        String fileExtension = extension(filePath).toLowerCase();

        List<dynamic> invoices = quote.manualQuickDocumentUpload ?? [];
        String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
        String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

        List<dynamic> delNotes = quote.invoicesDocuments ?? [];
        String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
        String delNotesFileExtension =
            extension(delNotesFilePath).toLowerCase();

        List<dynamic> pdfUrl = quote.deliveryDocuments ?? [];
        String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
        String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

        List<dynamic> facConfDocuments = quote.facConfDocuments ?? [];
        String facConfDocsFilepath =
            facConfDocuments.isNotEmpty ? facConfDocuments.first : '';
        String facConfExtension = extension(facConfDocsFilepath).toLowerCase();

        var enqAllocatedTo;

        // List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
        // String pdfImageUrlFilePath =
        //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        // String pdfImageUrlFileExtension =
        //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              //1
              DataCell(Text(quote.name ?? "")),
              //2
              DataCell(
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: quote.orderStatusVal == "Deposit Received" ||
                            quote.orderStatusVal ==
                                "Preliminary Confirmation Issued" ||
                            quote.orderStatusVal == "Awaiting Deposit" ||
                            quote.orderStatusVal ==
                                "Revised Confirmation Issued" ||
                            quote.orderStatusVal ==
                                "Awaiting Balance Payment" ||
                            quote.orderStatusVal ==
                                "Awaiting Survey / Dimensions"
                        ? Colors.red
                        : Color(0xffb5e51d),
                  ),
                  child: Text(
                    (quote.orderStatusVal == "Deposit Received" ||
                            quote.orderStatusVal ==
                                "Preliminary Confirmation Issued" ||
                            quote.orderStatusVal == "Awaiting Deposit" ||
                            quote.orderStatusVal ==
                                "Revised Confirmation Issued" ||
                            quote.orderStatusVal ==
                                "Awaiting Balance Payment" ||
                            quote.orderStatusVal ==
                                "Awaiting Survey / Dimensions")
                        ? 'Action Required'
                        : "No Action Required",
                  ),
                ),
              ),
              //3
              DataCell(Text(dealerData.displayName ?? "")),
              //4
              DataCell(Text(quote.quotationNumber ?? "")),
              //5
              DataCell(Text(dealerData.dealerName ?? "")),
              //6
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                    controller: confcode,
                    onChanged: (value) {
                      // Timer(Duration(seconds: 5), () {
                      //   apiServices.factoryDeliveryWeekSteelOrder(
                      //       dealerId, value, result.id!);
                      // });
                    },
                  ))),
              //8
              DataCell(Builder(builder: (context) {
                return Container(
                    decoration: BoxDecoration(
                        color: quote.orderStatusVal == "Order Received"
                            ? Color(0xff9ad9ea)
                            : quote.orderStatusVal == "Order Placed"
                                ? Color(0xffffc90d)
                                : quote.orderStatusVal ==
                                        "Awaiting Balance Payment"
                                    ? Colors.yellow
                                    : quote.orderStatusVal == "Delayed"
                                        ? Colors.red
                                        : quote.orderStatusVal ==
                                                "In Production"
                                            ? Color(0xffb5351d)
                                            : quote.orderStatusVal ==
                                                    "Ready For Shipping"
                                                ? Color(0xff0080001)
                                                : quote.orderStatusVal ==
                                                        "Revised Confirmation Issued"
                                                    ? Color(0xffa747a2)
                                                    : quote.orderStatusVal ==
                                                            "Final Confirmation Issued"
                                                        ? Color(0xffc7bfe6)
                                                        : quote.orderStatusVal ==
                                                                "In Transit To UK"
                                                            ? Color(0xfffeaec9)
                                                            : quote.orderStatusVal ==
                                                                    "In RKDS Warehouse"
                                                                ? Color(
                                                                    0xff9ad9ea)
                                                                : Color(
                                                                    0xff7092bf),
                        borderRadius: BorderRadius.circular(5.5)),
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.40,
                    child: Center(
                        child: Text(
                      quote.orderStatusVal!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    )));
              })),

              //9
              //       DataCell(Builder(builder: (context) {
              //   return Container(
              //       decoration: BoxDecoration(
              //           color: quote.orderPaymentStatusVal == "Awaiting Deposit"
              //               ? Colors.yellow
              //               : quote.orderPaymentStatusVal == "Deposit Received"
              //                   ? Color(0xffffd5cd)
              //                   : quote.orderPaymentStatusVal == "Awaiting Survey Fee"
              //                       ? Color(0xffbde2fd)
              //                       : quote.orderPaymentStatusVal == "Survey Fee Received"
              //                           ? Color(0xffd2ecbd)
              //                           : quote.orderPaymentStatusVal == "Awaiting Balance"
              //                               ? Color(0xffffe8a1)
              //                               : quote.orderPaymentStatusVal ==
              //                                       "Balance Paid"
              //                                   ? Colors.orange
              //                                   : quote.orderPaymentStatusVal ==
              //                                           "Awaiting Install Payment"
              //                                       ? Color(0xfffbd0ca)
              //                                       : quote.orderPaymentStatusVal == "All Invoices Paid"
              //                                           ? Color(0xff0d714b) : Colors.yellow,
              //           borderRadius: BorderRadius.circular(5.5)),
              //       height: MediaQuery.sizeOf(context).height * 0.05,
              //       width: MediaQuery.sizeOf(context).width * 0.35,
              //       child: Center(
              //           child: Text(
              //         quote.orderPaymentStatusVal!,
              //         style: TextStyle(color: Colors.black),
              //       )));
              // })),
              //10
              DataCell(
                quote.documents!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.OrderDocumentUpload(quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            // Create icons for each file
                            for (var file in quote.documents!)
                              InkWell(
                                onTap: () {
                                  String fileExtension =
                                      extension(file).toLowerCase();
                                  if (fileExtension == ".pdf") {
                                    print(file);
                                    Navigator.push(
                                      myGlobalBuildContext,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFViewer(url: file),
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
                        ),
                      )
                    : Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.OrderDocumentUpload(quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //12
              DataCell(Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  quote.anticipatedDateVal!.isNotEmpty
                      ? Text(quote.anticipatedDateVal!)
                      : Text('mm/dd/yyyy'),
                  DateButton(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                      context: myGlobalBuildContext,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                    );

                    if (pickedDate != null) {
                      apiServices.setAnticipatedDateForAdmin(dealerData.userId, quote.id!, pickedDate);
                    }
                    },
                    icon: Icons.date_range,
                  ),
                ],
              )),
              //13
              DataCell(
                quote.invoicesDocuments!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value){
                          apiServices.setInvoiceDocumentForAdmin(quote.id!, dealerData.userId, value);
                        });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            // Create icons for each file
                            for (var file in quote.invoicesDocuments!)
                              InkWell(
                                onTap: () {
                                  String fileExtension =
                                      extension(file).toLowerCase();
                                  if (fileExtension == ".pdf") {
                                    print(file);
                                    Navigator.push(
                                      myGlobalBuildContext,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFViewer(url: file),
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
                                  (delNotesFileExtension == '.jpg' ||
                                          delNotesFileExtension == '.jpeg' ||
                                          delNotesFileExtension == '.png')
                                      ? Icons.file_open
                                      : (delNotesFileExtension == '.pdf')
                                          ? Icons.picture_as_pdf
                                          : Icons.file_present,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                              ),
                          ],
                        ),
                      )
                    : Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value){
                          apiServices.setInvoiceDocumentForAdmin(quote.id!, dealerData.userId, value);
                        });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //14
              DataCell(Text(quote.balDueBeforeDelivery ?? "")),
              //15
              DataCell(RoundButton(
                onTap: () {},
                text: "Financial History",
                color: Colors.blue,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              )),
              //16
              DataCell(
                quote.deliveryDocuments!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                          apiServices.setDeliveryDocForAdmin(dealerData.userId, quote.id!, value);
                        });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            // Create icons for each file
                            for (var file in quote.deliveryDocuments!)
                              InkWell(
                                onTap: () {
                                  String fileExtension =
                                      extension(file).toLowerCase();
                                  if (fileExtension == ".pdf") {
                                    print(file);
                                    Navigator.push(
                                      myGlobalBuildContext,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFViewer(url: file),
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
                                  (pdfUrlFileExtension == '.jpg' ||
                                          pdfUrlFileExtension == '.jpeg' ||
                                          pdfUrlFileExtension == '.png')
                                      ? Icons.file_open
                                      : (pdfUrlFileExtension == '.pdf')
                                          ? Icons.picture_as_pdf
                                          : Icons.file_present,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                              ),
                          ],
                        ),
                      )
                    : Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                          apiServices.setDeliveryDocForAdmin(dealerData.userId, quote.id!, value);
                        });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //19
              DataCell(Text(quote.marineGradeVal ?? "")),
              //20
              DataCell(Text(quote.frameSizeHeightWidth ?? "")),
              //21
              DataCell(Text(quote.lhGoalPostE44 ?? "")),
              //22
              DataCell(Text(quote.totalWeightKg ?? "")),
              //23
              DataCell(Text(quote.thresholdType ?? "")),
              //24
              DataCell(Text(quote.ekeylessAccess ?? "")),

              //25
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                    controller: facDeliveryWeek,
                    onEditingComplete: () {
                      String value = facDeliveryWeek.text;
              apiServices.setFacDeliveryWeekValue(quote.id!, dealerData.userId, value);
                    },
                  ))),
              //26
              DataCell(Text(quote.telephoneNumber ?? "")),
              //27
              DataCell(Text(quote.customerEmail ?? "")),
              //28
              DataCell(Text(quote.deliveryPostCode ?? "")),
              //29
              DataCell(Text(quote.date ?? "")),
              //30
              DataCell(Text(quote.time ?? "")),
              //31
              DataCell(Text(quote.wholeTotal ?? "")),
              //32
              DataCell(Consumer<FollowUpOrderDate>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (quote.orderDate != null)
                            ? quote.orderDate!
                            : value.getDate(quote.id!),
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
                            apiServices.setOrderDateForAdmin(dealerData.userId, quote.id!, pickedDate);
                          }
                        },
                        icon: Icons.calendar_month,
                      )
                    ],
                  );
                },
              )),
              //33
              DataCell(Center(
                    child: DropdownButton<String>(
                      value: (quote.orderFollowup == "")
                          ? "NO"
                          : quote.orderFollowup!,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        //newValue = result.orderFollowup;
                        if (newValue != null) {
                          apiServices.setFollowUpForAdmin(dealerData.userId, quote.id!, newValue);
                        } else {
                          String value = quote.orderFollowup ?? "";
                    apiServices.setFollowUpForAdmin(dealerData.userId, quote.id!, value);
                        }
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'YES', child: Text('YES')),
                        DropdownMenuItem<String>(
                            value: 'NO', child: Text('NO')),
                      ],
                    ),
                  )
),
              //34
              DataCell(Text(quote.id ?? "")),
              //35
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                    controller: ankaValue,
                    onChanged: (value) {
                      // Timer(Duration(seconds: 5), () {
                      //   apiServices.factoryDeliveryWeekSteelOrder(
                      //       dealerId, value, result.id!);
                      // });
                    },
                  ))),
              //36
              //37
              DataCell(RoundButton(
                onTap: ()  async {
                  TextEditingController notesController = TextEditingController();
                  final _formKey = GlobalKey<FormState>();
                  notesController.text = quote.notes ?? "";
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
                                      apiServices.setNotesValueForAdmin(quote.id!, dealerData.userId, notesController.text);
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
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              )),
              // custom handle file
              //38
              DataCell((RoundButton(
                onTap: () {},
                text: "Custom Handle",
                color: Colors.blue,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              ))),
              //39
              DataCell(RoundButton(
                onTap: () {},
                text: "Quote Analysis",
                color: Colors.blue,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              )),
              //40
              DataCell(RoundButton(
                onTap: () {
                  apiServices.backToQuote(dealerData.userId.toString(), quote.id!);
                },
                text: "Back To Quote",
                color: Colors.blue,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              )),
              //41
              DataCell(Text("${quote.date} ${quote.orderStatusVal}")),
              //42
              DataCell(Text("${quote.saleBonus}")),
              //43
              //45
              DataCell(Text("${dealerData.dealerName}")),
              //46
              //47
              DataCell(RoundButton(
                onTap: () {
                  apiServices.CloseOrderFromAdmin(dealerData.userId, quote.id!);
                },
                text: "Order Complete - Archive File",
                color: Colors.blue,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.55,
              )),

              DataCell(
                FutureBuilder<List<AllDealersModel>>(
                    future: NetworkApiServices().getAllDealers(),
                    builder: ((context, snapshot) {
                      return DropdownButton<String>(
                        value: enqAllocatedTo,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (newValue) {
                          enqAllocatedTo = newValue ?? "";
                        },
                        items: snapshot.data != null
                            ? snapshot.data!.map((e) {
                                return DropdownMenuItem(
                                    value: e.name ?? "",
                                    child: Center(child: Text(e.name ?? "")));
                              }).toList()
                            : [],
                      );
                    })),
              ),

              //48
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(myGlobalBuildContext, MaterialPageRoute(builder: (context) => RkDoorCalculatorView(
                        dealerId: dealerId!,
                        url: "https://www.pricelink.net/rk-door-calculator/?user_id=${dealerData.userId}&cal_order_id=${quote.id}&mobile_token=true")));

                    },
                    child: Icon(
                      Icons.edit,
                      size: 14,
                    ),
                  ),
                  Icon(
                    Icons.copy,
                    size: 14,
                  ),
                  InkWell(
                    onTap: () {
                      apiServices.DeleteOrderFromAdmin(dealerData.userId, quote.id!);
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
        currentIndex++;
      }
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRowCount;

  @override
  int get selectedRowCount => 0;

  int get totalRowCount {
    int count = 0;
    for (var dealerData in dealerDataList!) {
      count += dealerData.orders.length;
    }
    return count;
  }
}
