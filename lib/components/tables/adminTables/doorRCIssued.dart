import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminPanelOrders.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class AdminDoorRCIssued extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminDoorRCIssued(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminDoorRCIssued> createState() => _AdminDoorRCIssuedState();
}

class _AdminDoorRCIssuedState extends State<AdminDoorRCIssued> {
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

        list = snapshot.data ?? [];

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
            columnSpacing: 20,
            dataRowMaxHeight: 48,
            headingRowHeight: 48,
            showEmptyRows: false,
            rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                ? 5
                : (list!.isEmpty)
                    ? 1
                    : list!.length,
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
                'Sales Bonus',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Dealer Support',
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
            source: MyData(list!, _dateTime, widget.dealerId, widget.dealerName,
                _showDatePicker,
                myGlobalBuildContext: context));
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

        List<AdminPanelOrders> getFilteredQuotes() {
          List<AdminPanelOrders> filteredQuotes = [];
          for (var dealerData in dealerDataList!) {
            for (var quote in dealerData.orders) {
              if (quote.orderStatusVal == "Revised Confirmation Issued") {
                filteredQuotes.add(quote);
              }
            }
          }
          return filteredQuotes;
        }

        // List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
        // String pdfImageUrlFilePath =
        //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        // String pdfImageUrlFileExtension =
        //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          var filteredOrders = getFilteredQuotes();

          var quote = filteredOrders[index];
          String orderStatus = quote.orderStatusVal ?? "";
          String paymentStatus = quote.orderPaymentStatusVal ?? "";
          TextEditingController notesController = TextEditingController();
          final _formKey = GlobalKey<FormState>();
          return DataRow.byIndex(
            color: MaterialStatePropertyAll(Colors.white),
            index: index,
            cells: [
              //1
              DataCell(Text(
                quote.name ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //2
              DataCell(
                Container(
                  height:
                      MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.24,
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
                      borderRadius: BorderRadius.circular(19)),
                  child: Center(
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
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              //3
              DataCell(Text(
                dealerData.displayName ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //4
              DataCell(Text(
                quote.quotationNumber ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //5
              DataCell(Text(
                dealerData.dealerName ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //6
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                    controller: confcode,
                    onEditingComplete: () {
                      String value = confcode.text;
                      apiServices.setOrderNum(
                          quote.id!, dealerData.userId, value);
                    },
                  ))),

              //7
              DataCell(Builder(builder: (context) {
                return Container(
                    height: MediaQuery.sizeOf(context).height * 0.042,
                    width: MediaQuery.sizeOf(context).width * 0.33,
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
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      iconEnabledColor: quote.orderStatusVal == "Order Received"
                          ? Color(0xff9ad9ea)
                          : quote.orderStatusVal == "Order Placed"
                              ? Color(0xffffc90d)
                              : quote.orderStatusVal ==
                                      "Awaiting Balance Payment"
                                  ? Colors.yellow
                                  : quote.orderStatusVal == "Delayed"
                                      ? Colors.red
                                      : quote.orderStatusVal == "In Production"
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
                      isExpanded: true,
                      value: orderStatus,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        //newValue = result.orderFollowup;
                        if (newValue != null) {
                          // Provider.of<setFollowUpOrderValue>(context, listen: false)
                          //     .changeValue(newValue: newValue, quoteId: result.id!);
                          apiServices.setOrderStatus(
                              quote.id!, dealerData.userId, newValue);
                        } else {
                          // Provider.of<setFollowUpOrderValue>(context, listen: false)
                          //     .changeValue(
                          //         newValue: result.orderFollowup, quoteId: result.id!);
                          apiServices.setOrderStatus(
                              quote.id!, dealerData.userId, orderStatus);
                        }
                      },
                      items: [
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Order Received',
                            child: Text('Order Received')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Order Placed',
                            child: Text('Order Placed')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Survey / Dimensions',
                            child: Text('Awaiting Survey / Dimensions')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Deposit',
                            child: Text('Awaiting Deposit')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Deposit Received',
                            child: Text('Deposit Received')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Preliminary Confirmation Issued',
                            child: Text('Preliminary Confirmation Issued')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Revised Confirmation Issued',
                            child: Text('Revised Confirmation Issued')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Final Confirmation Issued',
                            child: Text('Final Confirmation Issued')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In Production',
                            child: Text('In Production')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Ready For Shipping',
                            child: Text('Ready For Shipping')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In Transit To UK',
                            child: Text('In Transit To UK')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In RKDS Warehouse',
                            child: Text('In RKDS Warehouse')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Balance Payment',
                            child: Text('Awaiting Balance Payment')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Out For Delivery',
                            child: Text('Out For Delivery')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Delivered',
                            child: Text('Delivered')),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Delayed',
                            child: Text('Delayed')),
                      ],
                    ));
              })),

              //9
              DataCell(Builder(builder: (context) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * 0.042,
                  width: MediaQuery.sizeOf(context).width * 0.40,
                  decoration: BoxDecoration(
                      color: quote.orderPaymentStatusVal == "Awaiting Deposit"
                          ? Colors.yellow
                          : quote.orderPaymentStatusVal == "Deposit Received"
                              ? Color(0xffffd5cd)
                              : quote.orderPaymentStatusVal ==
                                      "Awaiting Survey Fee"
                                  ? Color(0xffbde2fd)
                                  : quote.orderPaymentStatusVal ==
                                          "Survey Fee Received"
                                      ? Color(0xffd2ecbd)
                                      : quote.orderPaymentStatusVal ==
                                              "Awaiting Balance"
                                          ? Color(0xffffe8a1)
                                          : quote.orderPaymentStatusVal ==
                                                  "Balance Paid"
                                              ? Colors.orange
                                              : quote.orderPaymentStatusVal ==
                                                      "Awaiting Install Payment"
                                                  ? Color(0xfffbd0ca)
                                                  : quote.orderPaymentStatusVal ==
                                                          "All Invoices Paid"
                                                      ? Color(0xff0d714b)
                                                      : Colors.yellow,
                      borderRadius: BorderRadius.circular(5.5)),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    iconEnabledColor: quote.orderPaymentStatusVal ==
                            "Awaiting Deposit"
                        ? Colors.yellow
                        : quote.orderPaymentStatusVal == "Deposit Received"
                            ? Color(0xffffd5cd)
                            : quote.orderPaymentStatusVal ==
                                    "Awaiting Survey Fee"
                                ? Color(0xffbde2fd)
                                : quote.orderPaymentStatusVal ==
                                        "Survey Fee Received"
                                    ? Color(0xffd2ecbd)
                                    : quote.orderPaymentStatusVal ==
                                            "Awaiting Balance"
                                        ? Color(0xffffe8a1)
                                        : quote.orderPaymentStatusVal ==
                                                "Balance Paid"
                                            ? Colors.orange
                                            : quote.orderPaymentStatusVal ==
                                                    "Awaiting Install Payment"
                                                ? Color(0xfffbd0ca)
                                                : quote.orderPaymentStatusVal ==
                                                        "All Invoices Paid"
                                                    ? Color(0xff0d714b)
                                                    : Colors.yellow,
                    isExpanded: true,
                    value: paymentStatus,
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      //newValue = result.orderFollowup;
                      if (newValue != null) {
                        // Provider.of<setFollowUpOrderValue>(context, listen: false)
                        //     .changeValue(newValue: newValue, quoteId: result.id!);
                        apiServices.setPaymentStatus(
                            quote.id!, dealerData.userId, newValue);
                      } else {
                        // Provider.of<setFollowUpOrderValue>(context, listen: false)
                        //     .changeValue(
                        //         newValue: result.orderFollowup, quoteId: result.id!);
                        apiServices.setPaymentStatus(
                            quote.id!, dealerData.userId, paymentStatus);
                      }
                    },
                    items: [
                      DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: '',
                          child: Text('')),
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
                          child: Text('Deposit Received',
                              textAlign: TextAlign.center)),
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
                          child: Text('Awaiting Balance',
                              textAlign: TextAlign.center)),
                      DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: 'Balance Paid',
                          child: Text('Balance Paid',
                              textAlign: TextAlign.center)),
                      DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: 'Awaiting Install Payment',
                          child: Text('Awaiting Install Payment',
                              textAlign: TextAlign.center)),
                      DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: 'All Invoices Paid',
                          child: Text('All Invoices Paid',
                              textAlign: TextAlign.center)),
                    ],
                  ),
                );
              })),
              //9
              DataCell(
                quote.documents!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.OrderDocumentUpload(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
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
                                  apiServices.OrderDocumentUpload(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //10
              DataCell(
                quote.manualQuickDocumentUpload!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.manualQuickDocUpload(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
                            // Create icons for each file
                            for (var file in quote.manualQuickDocumentUpload!)
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
                        ),
                      )
                    : Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.manualQuickDocUpload(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //11
              DataCell(Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  quote.anticipatedDateVal!.isNotEmpty
                      ? Text(
                          quote.anticipatedDateVal!,
                          style: TextStyle(fontSize: 12.5),
                        )
                      : Text(
                          'mm/dd/yyyy',
                          style: TextStyle(fontSize: 12.5),
                        ),
                  DateButton(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: myGlobalBuildContext,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      );

                      if (pickedDate != null) {
                        apiServices.setAnticipatedDateForAdmin(
                            dealerData.userId, quote.id!, pickedDate);
                      }
                    },
                    icon: Icons.date_range,
                  ),
                ],
              )),
              //12
              DataCell(
                quote.invoicesDocuments!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setInvoiceDocumentForAdmin(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
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
                                getImage().then((value) {
                                  apiServices.setInvoiceDocumentForAdmin(
                                      quote.id!, dealerData.userId, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //13
              DataCell(Text(
                quote.balDueBeforeDelivery ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //14
              DataCell(RoundButton(
                onTap: () {},
                text: "Financial History",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.25,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),
              //15
              DataCell(
                quote.deliveryDocuments!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setDeliveryDocForAdmin(
                                      dealerData.userId, quote.id!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
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
                                  apiServices.setDeliveryDocForAdmin(
                                      dealerData.userId, quote.id!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            Text(
                              'Add Files',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
              ),
              //16
              DataCell(Text(
                quote.profile ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //17
              DataCell(Text(
                quote.doorModel ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //18
              DataCell(Text(
                quote.marineGradeVal ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //19
              DataCell(Text(
                quote.frameSizeHeightWidth ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //20
              DataCell(Text(
                quote.lhGoalPostE44 ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //21
              DataCell(Text(
                quote.totalWeightKg ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //22
              DataCell(Text(
                quote.thresholdType ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //23
              DataCell(Text(
                quote.ekeylessAccess ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //25
              //24

              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                    controller: facDeliveryWeek,
                    onEditingComplete: () {
                      String value = facDeliveryWeek.text;
                      apiServices.setFacDeliveryWeekValue(
                          quote.id!, dealerData.userId, value);
                      // Timer(Duration(seconds: 5), () {
                      //   apiServices.factoryDeliveryWeekSteelOrder(
                      //       dealerId, value, result.id!);
                      // });
                    },
                  ))),
              //25
              DataCell(Text(
                quote.telephoneNumber ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //26
              DataCell(Text(
                quote.customerEmail ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //27
              DataCell(Text(
                quote.deliveryPostCode ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //28
              DataCell(Text(
                quote.date ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //29
              DataCell(Text(
                quote.time ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //30
              DataCell(Text(
                quote.wholeTotal ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //31
              DataCell(Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (quote.orderDate != null) ? quote.orderDate! : "mm/dd/yyyy",
                    style: TextStyle(fontSize: 12.5),
                  ),
                  DateButton(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: myGlobalBuildContext,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      );

                      if (pickedDate != null) {
                        apiServices.setOrderDateForAdmin(
                            dealerData.userId, quote.id!, pickedDate);
                      }
                    },
                    icon: Icons.calendar_month,
                  )
                ],
              )),
              //33
              DataCell(Center(
                child: DropdownButton<String>(
                  value:
                      (quote.orderFollowup == "") ? "NO" : quote.orderFollowup!,
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    //newValue = result.orderFollowup;
                    if (newValue != null) {
                      apiServices.setFollowUpForAdmin(
                          dealerData.userId, quote.id!, newValue);
                    } else {
                      String value = quote.orderFollowup ?? "";
                      apiServices.setFollowUpForAdmin(
                          dealerData.userId, quote.id!, value);
                    }
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
              //33
              DataCell(Text(
                quote.id ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //34
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

              //35
              DataCell(RoundButton(
                onTap: () async {
                  notesController.text = quote.notes ?? "";
                  await showDialog(
                      context: myGlobalBuildContext,
                      builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
                                                    fontWeight:
                                                        FontWeight.w600))),
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
                                                        color:
                                                            Color(0xff941420))),
                                                hintText: 'Notes'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RoundButton(
                                          text: 'Save',
                                          onTap: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              apiServices.setNotesValueForAdmin(
                                                  quote.id!,
                                                  dealerData.userId,
                                                  notesController.text);
                                            }

                                            Navigator.of(context,
                                                    rootNavigator: true)
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
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.15,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),
              // custom handle file
              //36
              DataCell(Text("")),
              //37
              DataCell(RoundButton(
                onTap: () {},
                text: "Quote Analysis",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.18,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),
              //38
              DataCell(RoundButton(
                onTap: () {
                  apiServices.backToQuote(
                      dealerData.userId.toString(), quote.id!);
                },
                text: "Back To Quote",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.21,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),
              //39
              DataCell(Text(
                "${quote.date} ${quote.orderStatusVal}",
                style: TextStyle(fontSize: 12.5),
              )),
              //40
              DataCell(Text(
                "${quote.saleBonus}",
                style: TextStyle(fontSize: 12.5),
              )),

              //41
              DataCell(Text(
                "${dealerData.dealerName}",
                style: TextStyle(fontSize: 12.5),
              )),
              //42
              DataCell(RoundButton(
                onTap: () {
                  apiServices.CloseOrderFromAdmin(dealerData.userId, quote.id!);
                },
                text: "Order Complete - Archive File",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),

              // DataCell(RoundButton(
              //   onTap: () {},
              //   text: "Enquiry Record",
              //   height: MediaQuery.sizeOf(context).height * 0.045,
              //   width: MediaQuery.sizeOf(context).width * 0.4,
              //   color: Colors.blue,
              // )),
              // DataCell(RoundButton(
              //   onTap: () {},
              //   text: "Create Quotation",
              //   height: MediaQuery.sizeOf(context).height * 0.045,
              //   width: MediaQuery.sizeOf(context).width * 0.4,
              //   color: Colors.blue,
              // )),
              // DataCell(Text(quote.quotationNumberForEnquiry ?? "")),
              // DataCell(RoundButton(
              //   onTap: () {},
              //   text: "Close Enquiry",
              //   height: MediaQuery.sizeOf(context).height * 0.045,
              //   width: MediaQuery.sizeOf(context).width * 0.4,
              //   color: Colors.blue,
              // )),
              // DataCell(Text(quote.date ?? "")),
              // DataCell(Text(quote.time ?? "")),
//43
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          myGlobalBuildContext,
                          MaterialPageRoute(
                              builder: (context) => RkDoorCalculatorView(
                                  dealerId: dealerId!,
                                  url:
                                      "https://www.pricelink.net/rk-door-calculator/?user_id=${dealerData.userId}&cal_order_id=${quote.id}&mobile_token=true")));
                    },
                    child: Icon(
                      Icons.edit,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.copy,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      apiServices.DeleteOrderFromAdmin(
                          dealerData.userId, quote.id!);
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
      for (var quote in dealerData.orders) {
        if (quote.orderStatusVal == 'Revised Confirmation Issued') {
          count++;
        }
      }
    }
    return count;
  }
}
