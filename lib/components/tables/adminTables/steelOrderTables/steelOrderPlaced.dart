import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/steelOrderModel.dart';
import 'package:price_link/screens/adminScreens/editSteelOrder.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class AdminSteelOrdersPlaced extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminSteelOrdersPlaced(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminSteelOrdersPlaced> createState() => _AdminSteelOrdersPlacedState();
}

class _AdminSteelOrdersPlacedState extends State<AdminSteelOrdersPlaced> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<CompletedSteelOrdersResponse>? list = [];

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
      future: apiServices.getSteelOrdersForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        // List<AdminSteelOrder> filteredList = list!.where((element) => element.steelOrderStatusVal == "Order Placed").toList();

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
            showEmptyRows: false,
            columnSpacing: 20,
            headingRowHeight: 48,
            dataRowMaxHeight: 48,
            rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                ? 5
                : (list!.isEmpty)
                    ? 1
                    : list!.length,
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
                'Steel Order Status',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Payment Status',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Steel Order Confirmation',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Anticipated Delivery Date',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Steel Invoices',
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
                'Supply Type',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Frame Size',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Colour',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Factory Delivery Week',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Post Code',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Weight',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Tel No.',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Email',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Total Order Value',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Delivery Cost',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'File Upload',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quotation',
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
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Net Order Value (From Steel Order Form)',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Discount',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Sale Bonus',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Gross bonus payment',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Sale Staff Bonus',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Admin Staff Bonus',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Filter Supplier',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Supplier',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Order Date History',
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
  final List<CompletedSteelOrdersResponse>? dealerDataList;

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
      for (var quote in dealerData.steelOrders!) {
        // TextEditingController configuratorCode = TextEditingController();
        // configuratorCode.text = quote.enquiryConfCode ?? "";

        // confcode.text = quote.orderNoVal ?? "";
        // facDeliveryWeek.text = quote.facDeliveryWeeksVal ?? "";
        // ankaValue.text = quote.ankaItems ?? "";

        List<dynamic> steelOrderFile = quote.steelOrderConfFile ?? [];
        String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
        String fileExtension = extension(filePath).toLowerCase();

        List<dynamic> invoices = quote.steelInvoices ?? [];
        String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
        String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

        List<dynamic> delNotes = quote.steelDelNotes ?? [];
        String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
        String delNotesFileExtension =
            extension(delNotesFilePath).toLowerCase();

        List<dynamic> pdfUrl = quote.manualPDFImageURL ?? [];
        String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
        String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

        List<dynamic> pdfImageUrl = quote.pdfImageURL ?? [];
        String pdfImageUrlFilePath =
            pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        String pdfImageUrlFileExtension =
            extension(pdfImageUrlFilePath).toLowerCase();

        List<AdminSteelOrder> getFilteredQuotes() {
          List<AdminSteelOrder> filteredQuotes = [];
          for (var dealerData in dealerDataList!) {
            for (var quote in dealerData.steelOrders!) {
              if (quote.steelOrderStatusVal == "Order Placed") {
                filteredQuotes.add(quote);
              }
            }
          }
          return filteredQuotes;
        }

        // List<dynamic> pdfImageUrl = quote.pDFImageURL ?? [];
        // String pdfImageUrlFilePath =
        //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        // String pdfImageUrlFileExtension =
        //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          var filteredOrders = getFilteredQuotes();

          var quote = filteredOrders[index];

          TextEditingController facOrderNo = TextEditingController();
          TextEditingController facDeliveryWeek = TextEditingController();
          facDeliveryWeek.text = quote.steelFacWeekVal ?? "";
          // ankaValue.text = quote.ankaItems ?? "";

          String orderStatus = quote.steelOrderStatusVal ?? "";
          String paymentStatus = quote.steelOrderPaymentStatusVal ?? "";
          facOrderNo.text = quote.steelFacOrderNoVal ?? "";
          TextEditingController notesController = TextEditingController();
          notesController.text = quote.notes ?? "";
          final _formKey = GlobalKey<FormState>();

          return DataRow.byIndex(
            color: MaterialStatePropertyAll(Colors.white),
            index: index,
            cells: [
              DataCell(Text(
                quote.steelCustomerName ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //2
              DataCell(
                Container(
                  height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.25,
                  decoration: BoxDecoration(
                      color: quote.steelOrderStatusVal == "Deposit Received" ||
                              quote.steelOrderStatusVal ==
                                  "Preliminary Confirmation Issued" ||
                              quote.steelOrderStatusVal == "Awaiting Deposit" ||
                              quote.steelOrderStatusVal ==
                                  "Revised Confirmation Issued" ||
                              quote.steelOrderStatusVal ==
                                  "Awaiting Balance Payment" ||
                              quote.steelOrderStatusVal ==
                                  "Awaiting Survey / Dimensions"
                          ? Colors.red
                          : Color(0xffb5e51d),
                      borderRadius: BorderRadius.circular(5.5)),
                  child: Center(
                    child: Text(
                      (quote.steelOrderStatusVal == "Deposit Received" ||
                              quote.steelOrderStatusVal ==
                                  "Preliminary Confirmation Issued" ||
                              quote.steelOrderStatusVal == "Awaiting Deposit" ||
                              quote.steelOrderStatusVal ==
                                  "Revised Confirmation Issued" ||
                              quote.steelOrderStatusVal ==
                                  "Awaiting Balance Payment" ||
                              quote.steelOrderStatusVal ==
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
                style: TextStyle(fontSize: 12),
              )),
              //4
              DataCell(Text(
                quote.steelQNumber ?? "",
                style: TextStyle(fontSize: 12),
              )),
              //5
              DataCell(Text(
                dealerData.dealerName ?? "",
                style: TextStyle(fontSize: 12),
              )),
              //6
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                    controller: facOrderNo,
                    onEditingComplete: () {
                      String value = facOrderNo.text;
                      apiServices.setFactoryOrderNoForAdmin(
                          dealerData.userId!, quote.id!, value);
                    },
                  ))),
              //7
              DataCell(Text(
                quote.steelOrderStatusVal ?? "",
                style: TextStyle(fontSize: 12),
              )),
              //8
              DataCell(Builder(builder: (context) {
                return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: quote.steelOrderStatusVal ==
                                    "Awaiting Deposit" ||
                                quote.steelOrderStatusVal ==
                                    "Awaiting Balance Payment"
                            ? Colors.yellow
                            : quote.steelOrderStatusVal == "Delayed" ||
                                    quote.steelOrderStatusVal ==
                                        "Preliminary Confirmation Issued"
                                ? Colors.red
                                : quote.steelOrderStatusVal ==
                                            "In Production" ||
                                        quote.steelOrderStatusVal == "Delivered"
                                    ? Color(0xffb5e51d)
                                    : quote.steelOrderStatusVal ==
                                            "Ready For Shipping"
                                        ? Color(0xff008001)
                                        : quote.steelOrderStatusVal ==
                                                "Order Received"
                                            ? Color(0xff9ad9ea)
                                            : quote.steelOrderStatusVal ==
                                                    "Order Placed"
                                                ? Color(0xffffc90d)
                                                : quote.steelOrderStatusVal ==
                                                        "Revised Confirmation Issued"
                                                    ? Color(0xffa747a2)
                                                    : quote.steelOrderStatusVal ==
                                                            "Final Confirmation Issued"
                                                        ? Color(0xffc7bfe6)
                                                        : quote.steelOrderStatusVal ==
                                                                "In Transit To UK"
                                                            ? Color(0xfffeaec9)
                                                            : quote.steelOrderStatusVal ==
                                                                    "In RKDS Warehouse"
                                                                ? Color(
                                                                    0xff9ad9ea)
                                                                : quote.steelOrderStatusVal ==
                                                                            "Out For Delivery" ||
                                                                        quote.steelOrderStatusVal ==
                                                                            "Awaiting Survey / Dimensions"
                                                                    ? Color(
                                                                        0xff7092bf)
                                                                    : Colors
                                                                        .white,
                        borderRadius: BorderRadius.circular(5.5)),
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                      iconEnabledColor: quote.steelOrderStatusVal ==
                                  "Awaiting Deposit" ||
                              quote.steelOrderStatusVal ==
                                  "Awaiting Balance Payment"
                          ? Colors.yellow
                          : quote.steelOrderStatusVal == "Delayed" ||
                                  quote.steelOrderStatusVal ==
                                      "Preliminary Confirmation Issued"
                              ? Colors.red
                              : quote.steelOrderStatusVal == "In Production" ||
                                      quote.steelOrderStatusVal == "Delivered"
                                  ? Color(0xffb5e51d)
                                  : quote.steelOrderStatusVal ==
                                          "Ready For Shipping"
                                      ? Color(0xff008001)
                                      : quote.steelOrderStatusVal ==
                                              "Order Received"
                                          ? Color(0xff9ad9ea)
                                          : quote.steelOrderStatusVal ==
                                                  "Order Placed"
                                              ? Color(0xffffc90d)
                                              : quote.steelOrderStatusVal ==
                                                      "Revised Confirmation Issued"
                                                  ? Color(0xffa747a2)
                                                  : quote.steelOrderStatusVal ==
                                                          "Final Confirmation Issued"
                                                      ? Color(0xffc7bfe6)
                                                      : quote.steelOrderStatusVal ==
                                                              "In Transit To UK"
                                                          ? Color(0xfffeaec9)
                                                          : quote.steelOrderStatusVal ==
                                                                  "In RKDS Warehouse"
                                                              ? Color(
                                                                  0xff9ad9ea)
                                                              : quote.steelOrderStatusVal ==
                                                                          "Out For Delivery" ||
                                                                      quote.steelOrderStatusVal ==
                                                                          "Awaiting Survey / Dimensions"
                                                                  ? Color(
                                                                      0xff7092bf)
                                                                  : Colors
                                                                      .white,
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
                          //apiServices.setOrderStatus(quote.id!, dealerData.userId, newValue);
                          apiServices.setSteelOrderStatusForAdmin(
                              dealerData.userId!, quote.id!, newValue);
                        } else {
                          String value = quote.steelOrderStatusVal ?? "";
                          // Provider.of<setFollowUpOrderValue>(context, listen: false)
                          //     .changeValue(
                          //         newValue: result.orderFollowup, quoteId: result.id!);
                          apiServices.setSteelOrderStatusForAdmin(
                              dealerData.userId!, quote.id!, value);
                        }
                      },
                      items: [
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: '',
                            child: Text(
                              '',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Deposit Received',
                            child: Text(
                              'Deposit Received',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Order Received',
                            child: Text(
                              'Order Received',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Order Placed',
                            child: Text(
                              'Order Placed',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Survey / Dimensions',
                            child: Text(
                              'Awaiting Survey / Dimensions',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Deposit',
                            child: Text(
                              'Awaiting Deposit',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Preliminary Confirmation Issued',
                            child: Text(
                              'Preliminary Confirmation Issued',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Revised Confirmation Issued',
                            child: Text(
                              'Revised Confirmation Issued',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Final Confirmation Issued',
                            child: Text(
                              'Final Confirmation Issued',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In Production',
                            child: Text(
                              'In Production',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Ready For Shipping',
                            child: Text(
                              'Ready For Shipping',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In Transit To UK',
                            child: Text(
                              'In Transit To UK',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'In RKDS Warehouse',
                            child: Text(
                              'In RKDS Warehouse',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Awaiting Balance Payment',
                            child: Text(
                              'Awaiting Balance Payment',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Out For Delivery',
                            child: Text(
                              'Out For Delivery',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Delivered',
                            child: Text(
                              'Delivered',
                              textAlign: TextAlign.center,
                            )),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Delayed',
                            child: Text(
                              'Delayed',
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ));
              })),
              //9
              DataCell(Builder(builder: (context) {
                return Container(
                    decoration: BoxDecoration(
                        color: quote.steelOrderPaymentStatusVal ==
                                "Awaiting Deposit"
                            ? Colors.yellow
                            : quote.steelOrderPaymentStatusVal ==
                                    "Deposit Received"
                                ? Color(0xffffd5cd)
                                : quote.steelOrderPaymentStatusVal ==
                                        "Awaiting Survey Fee"
                                    ? Color(0xffbde2fd)
                                    : quote.steelOrderPaymentStatusVal ==
                                            "Survey Fee Received"
                                        ? Color(0xffd2ecbd)
                                        : quote.steelOrderPaymentStatusVal ==
                                                "Awaiting Balance"
                                            ? Color(0xffffe8a1)
                                            : quote.steelOrderPaymentStatusVal ==
                                                    "Balance Paid"
                                                ? Colors.orange
                                                : quote.steelOrderPaymentStatusVal ==
                                                        "Awaiting Install Payment"
                                                    ? Color(0xfffbd0ca)
                                                    : quote.steelOrderPaymentStatusVal ==
                                                            "All Invoices Paid"
                                                        ? Color(0xff0d714b)
                                                        : Colors.yellow,
                        borderRadius: BorderRadius.circular(5.5)),
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.26,
                    child: Center(
                      child: DropdownButton<String>(
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        alignment: Alignment.center,
                        iconEnabledColor: quote.steelOrderPaymentStatusVal ==
                                "Awaiting Deposit"
                            ? Colors.yellow
                            : quote.steelOrderPaymentStatusVal ==
                                    "Deposit Received"
                                ? Color(0xffffd5cd)
                                : quote.steelOrderPaymentStatusVal ==
                                        "Awaiting Survey Fee"
                                    ? Color(0xffbde2fd)
                                    : quote.steelOrderPaymentStatusVal ==
                                            "Survey Fee Received"
                                        ? Color(0xffd2ecbd)
                                        : quote.steelOrderPaymentStatusVal ==
                                                "Awaiting Balance"
                                            ? Color(0xffffe8a1)
                                            : quote.steelOrderPaymentStatusVal ==
                                                    "Balance Paid"
                                                ? Colors.orange
                                                : quote.steelOrderPaymentStatusVal ==
                                                        "Awaiting Install Payment"
                                                    ? Color(0xfffbd0ca)
                                                    : quote.steelOrderPaymentStatusVal ==
                                                            "All Invoices Paid"
                                                        ? Color(0xff0d714b)
                                                        : Colors.yellow,
                        isExpanded: true,
                        value: paymentStatus,
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          //newValue = result.orderFollowup;
                          if (newValue != null) {
                            // Provider.of<setFollowUpOrderValue>(context, listen: false)
                            //     .changeValue(newValue: newValue, quoteId: result.id!);
                            //apiServices.setOrderStatus(quote.id!, dealerData.userId, newValue);
                            apiServices.setSteelPaymentStatus(
                                dealerData.userId!, quote.id!, newValue);
                          } else {
                            String value =
                                quote.steelOrderPaymentStatusVal ?? "";
                            // Provider.of<setFollowUpOrderValue>(context, listen: false)
                            //     .changeValue(
                            //         newValue: result.orderFollowup, quoteId: result.id!);
                            //apiServices.setOrderStatus(quote.id!, dealerData.userId, orderStatus);
                            apiServices.setSteelPaymentStatus(
                                dealerData.userId!, quote.id!, value);
                          }
                        },
                        items: [
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: '',
                              child: Text(
                                '',
                                textAlign: TextAlign.center,
                              )),
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
                              child: Text(
                                'Deposit Received',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'Awaiting Survey Fee',
                              child: Text(
                                'Awaiting Survey Fee',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'Survey Fee Received',
                              child: Text(
                                'Survey Fee Received',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'Awaiting Balance',
                              child: Text(
                                'Awaiting Balance',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'Balance Paid',
                              child: Text(
                                'Balance Paid',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'Awaiting Install Payment',
                              child: Text(
                                'Awaiting Install Payment',
                                textAlign: TextAlign.center,
                              )),
                          DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: 'All Invoices Paid',
                              child: Text(
                                'All Invoices Paid',
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ));
              })),

              //10
              DataCell(
                quote.steelOrderConfFile!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setSteelOrderConfFile(
                                      quote.id!, dealerData.userId!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
                            // Create icons for each file
                            for (var file in quote.steelOrderConfFile!)
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
                                  apiServices.setSteelOrderConfFile(
                                      quote.id!, dealerData.userId!, value);
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
                  Text(
                    (quote.steelAnticipatedDate != null)
                        ? quote.steelAnticipatedDate!
                        : "mm/dd/yyyy",
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
                        apiServices.setSteelOrderAnticipatedDate(
                            dealerData.userId!, quote.id!, pickedDate);
                      }
                    },
                    icon: Icons.calendar_month,
                  )
                ],
              )),

              //12
              DataCell(
                quote.steelInvoices!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setSteelInvoicesForAdmin(
                                      dealerData.userId!, quote.id!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
                            // Create icons for each file
                            for (var file in quote.steelInvoices!)
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
                                  apiServices.setSteelInvoicesForAdmin(
                                      dealerData.userId!, quote.id!, value);
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
              DataCell(Center(
                  child: Text(
                quote.steelBalDueBeforeDelivery ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //14
              DataCell(RoundButton(
                onTap: () {},
                text: "Financial History",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.24,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),
              //15
              DataCell(
                quote.steelDelNotes!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setSteelDeliveryNotes(
                                      dealerData.userId!, quote.id!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
                            // Create icons for each file
                            for (var file in quote.steelDelNotes!)
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
                                  apiServices.setSteelDeliveryNotes(
                                      dealerData.userId!, quote.id!, value);
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
                quote.steelSupplyType ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //17
              DataCell(Text(
                quote.steelFrameSize ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //18
              DataCell(Builder(builder: (context) {
                return Container(
                    decoration: BoxDecoration(
                        color: quote.steelColor == "RAL 9003 MS" ||
                                quote.steelColor == "RAL 7021 MS" ||
                                quote.steelColor == "RAL 7039 MS" ||
                                quote.steelColor == "RAL 7022 MS" ||
                                quote.steelColor == "DB703 MS" ||
                                quote.steelColor == "CUSTOM COLOUR"
                            ? Colors.orange
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5.5)),
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.29,
                    child: Center(
                        child: Text(
                      quote.steelColor ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 12.5),
                    )));
              })),

              //19
              DataCell(Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                    controller: facDeliveryWeek,
                    onEditingComplete: () {
                      String value = facDeliveryWeek.text;
                      apiServices.setSteelFactoryDeliveryWeek(
                          dealerData.userId!, quote.id!, value);
                      // Timer(Duration(seconds: 5), () {
                      //   apiServices.factoryDeliveryWeekSteelOrder(
                      //       dealerId, value, result.id!);
                      // });
                    },
                  ))),
              //20
              DataCell(Text(
                quote.deliveryPostCode ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //21
              DataCell(Text(
                quote.steelWeight ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //22
              DataCell(Text(
                quote.steelCustomerTel ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //23
              DataCell(Text(
                quote.steelDealerEmail ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //24
              DataCell(Text(
                quote.steelTotalOrderValue ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //25
              DataCell(Text(
                quote.steelDeliveryCost ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //26
              DataCell(
                quote.manualPDFImageURL!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  apiServices.setFileUploadForAdmin(
                                      dealerData.userId!, quote.id!, value);
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                            SizedBox(width: 10),
                            // Create icons for each file
                            for (var file in quote.manualPDFImageURL!)
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
                                  apiServices.setFileUploadForAdmin(
                                      dealerData.userId!, quote.id!, value);
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

              //27
              DataCell(
                  quote.pdfImageURL!.isNotEmpty || quote.pdfImageURL != null
                      ? InkWell(
                          onTap: () {
                            pdfImageUrlFileExtension == ".pdf"
                                ? Navigator.push(
                                    myGlobalBuildContext,
                                    MaterialPageRoute(
                                        builder: (context) => PDFViewer(
                                            url: quote.pdfImageURL!
                                                        .isNotEmpty ||
                                                    quote.pdfImageURL != null
                                                ? quote.pdfImageURL![0]
                                                : [])))
                                : pdfImageUrlFileExtension == ".jpg" ||
                                        pdfImageUrlFileExtension == ".jpeg" ||
                                        pdfImageUrlFileExtension == ".png"
                                    ? showImageDialog(
                                        myGlobalBuildContext,
                                        quote.pdfImageURL![
                                            0]) // showImageDialog(context, pdfImageUrl)
                                    : Utils().showToast(
                                        'File Format not supported ${pdfImageUrlFileExtension}',
                                        Color(0xff941420),
                                        Colors.white);
                            // print(quote.steelInvoices![0]);
                          },
                          child: Center(
                            child: Icon(
                              (pdfImageUrlFileExtension == '.jpg' ||
                                      pdfImageUrlFileExtension == '.jpeg' ||
                                      pdfImageUrlFileExtension == '.png')
                                  ? Icons.file_open
                                  : (pdfImageUrlFileExtension == '.pdf')
                                      ? Icons.picture_as_pdf
                                      : Icons.file_present,
                              size: 16,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : Text("No file uploaded")),

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
                                              apiServices.setSteelOrderNotes(
                                                  dealerData.userId!,
                                                  quote.id!,
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
              //31
              DataCell(Center(
                  child: Text(
                quote.steelOrderNetVal ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //32
              DataCell(Center(
                  child: Text(
                quote.steelDiscount ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //33
              DataCell(Center(
                  child: Text(
                quote.saleBonus ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //34
              DataCell(Text("")),
              //35
              DataCell(Center(
                  child: Text(
                quote.steelOrderSaleBonus.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //36
              DataCell(Center(
                  child: Text(
                quote.steelOrderAdminStaffBonus.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //37
              DataCell(Center(
                  child: Text(
                quote.steelSupplier ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5),
              ))),
              //38
              DataCell(Text(
                quote.steelSupplier ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              //39
              DataCell(Text(
                "${quote.date} ${quote.steelOrderStatusVal}",
                style: TextStyle(fontSize: 12.5),
              )),
              //40
              DataCell(RoundButton(
                onTap: () {
                  apiServices.completeSteelOrderForAdmin(
                      dealerData.userId!, quote.id!);
                },
                text: "Order Complete - Archive File",
                color: Colors.blue,
                width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
                height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
              )),

              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          myGlobalBuildContext,
                          MaterialPageRoute(
                              builder: (context) => EditSteelOrderForAdmin(
                                  dealerId: dealerData.userId!,
                                  dealerName: dealerData.dealerName ?? "",
                                  response: quote)));
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
                    Icons.content_copy_rounded,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.delete,
                    size: 14,
                    color: Colors.red,
                  ),
                ],
              ))
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
      for (var quote in dealerData.steelOrders!) {
        if (quote.steelOrderStatusVal == 'Order Placed') {
          count++;
        }
      }
    }
    return count;
  }
}
