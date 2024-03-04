import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminPanelOrders.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class AdminDoorPCIssued extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminDoorPCIssued(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminDoorPCIssued> createState() => _AdminDoorPCIssuedState();
}

class _AdminDoorPCIssuedState extends State<AdminDoorPCIssued> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<AdminPanelOrders>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder<List<AdminPanelOrders>>(
      future: apiServices.getAdminOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        List<AdminPanelOrders> filteredList = list!.where((result) => result.orderStatusVal == "Preliminary Confirmation Issued").toList();

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
              rowsPerPage: (filteredList.length >= 5 && filteredList.isNotEmpty)
                  ? 5
                  : (filteredList.isEmpty)
                      ? 1
                      : filteredList.length,
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
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  filteredList, context, widget.dealerId, widget.dealerName)),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<AdminPanelOrders>? data;
  final String dealerId;
  final String dealerName;

  MyData(this.data, this.context, this.dealerId, this.dealerName);

  @override
  int get rowCount => data!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  SteelOrderModel table = SteelOrderModel();

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

  showImageDialog(BuildContext context, List<dynamic> imageUrl) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              insetPadding: EdgeInsets.all(9),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: imageUrl
                        .map(
                          (imageUrl) => SizedBox(
                            height: 200.0, // Set the height as needed
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ));
  }

  @override
  DataRow getRow(int index) {
    // final SteelOrderModel result = data![index];
    // TextEditingController factoryValue = TextEditingController();
    // TextEditingController factoryDeliveryWeek = TextEditingController();
    // factoryDeliveryWeek.text = result.steelFacWeekVal ?? "";
    // factoryValue.text = result.steelFacOrderNoVal ?? "";

    // List<dynamic> steelOrderFile = result.steelOrderConfFile ?? [];
    // String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
    // String fileExtension = extension(filePath).toLowerCase();

    // List<dynamic> invoices = result.steelInvoices ?? [];
    // String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
    // String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

    // List<dynamic> delNotes = result.steelDelNotes ?? [];
    // String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
    // String delNotesFileExtension = extension(delNotesFilePath).toLowerCase();

    // List<dynamic> pdfUrl = result.manualPDFImageURL ?? [];
    // String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
    // String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

    // List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
    // String pdfImageUrlFilePath =
    //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    // String pdfImageUrlFileExtension =
    //     extension(pdfImageUrlFilePath).toLowerCase();

    // TextEditingController notesController = TextEditingController();
    // final _formKey = GlobalKey<FormState>();
    // NetworkApiServices apiServices = NetworkApiServices();
    final orders = data![index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      //1
      DataCell(Text(orders.name ?? "")),
      //2
      DataCell(Text("")),
      //3
      DataCell(Text('')),
      //4
      DataCell(Text(orders.quotationNumber ?? "")),
      //5
      DataCell(Text('')),
      //6
      DataCell(Text(orders.orderNoVal ?? "")),
      //8
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: orders.orderStatusVal == "Order Received"
                      ? Color(0xff9ad9ea)
                      : orders.orderStatusVal == "Order Placed"
                          ? Color(0xffffc90d)
                          : orders.orderStatusVal == "Awaiting Balance Payment"
                              ? Colors.yellow
                              : orders.orderStatusVal == "Delayed"
                                  ? Colors.red
                                  : orders.orderStatusVal == "In Production"
                                      ? Color(0xffb5351d)
                                      : orders.orderStatusVal ==
                                              "Ready For Shipping"
                                          ? Color(0xff0080001)
                                          : orders.orderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : orders.orderStatusVal ==
                                                      "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6)
                                                  : orders.orderStatusVal ==
                                                          "In Transit To UK"
                                                      ? Color(0xfffeaec9)
                                                      : orders.orderStatusVal ==
                                                              "In RKDS Warehouse"
                                                          ? Color(0xff9ad9ea)
                                                          : Color(0xff7092bf),
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.40,
              child: Center(
                  child: Text(
                    
                orders.orderStatusVal!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )));
        })),

      //9
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: orders.orderPaymentStatusVal == "Awaiting Deposit"
                      ? Colors.yellow
                      : orders.orderPaymentStatusVal == "Deposit Received"
                          ? Color(0xffffd5cd)
                          : orders.orderPaymentStatusVal == "Awaiting Survey Fee"
                              ? Color(0xffbde2fd)
                              : orders.orderPaymentStatusVal == "Survey Fee Received"
                                  ? Color(0xffd2ecbd)
                                  : orders.orderPaymentStatusVal == "Awaiting Balance"
                                      ? Color(0xffffe8a1)
                                      : orders.orderPaymentStatusVal ==
                                              "Balance Paid"
                                          ? Colors.orange
                                          : orders.orderPaymentStatusVal ==
                                                  "Awaiting Install Payment"
                                              ? Color(0xfffbd0ca)
                                              : orders.orderPaymentStatusVal == "All Invoices Paid"
                                                  ? Color(0xff0d714b) : Colors.yellow,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                orders.orderPaymentStatusVal!,
                style: TextStyle(color: Colors.black),
              )));
        })),

      //10
      DataCell(Row(
        children: [
          Icon(Icons.add_circle_outline),
          SizedBox(
            width: 18,
          ),
          orders.documents!.isNotEmpty ? Icon(Icons.file_copy, color: Colors.blue,size: 18,) : Text('')
        ],
      )),
      //11
      DataCell(Row(
        children: [
          Icon(Icons.add_circle_outline),
          SizedBox(
            width: 18,
          ),
          orders.manualQuickDocumentUpload!.isNotEmpty ? Icon(Icons.file_copy, color: Colors.blue,size: 18,) : Text('')
        ],
      )),
      //12
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          orders.anticipatedDateVal!.isNotEmpty ? Text(orders.anticipatedDateVal!) : Text('mm/dd/yyyy'),
          DateButton(onTap: (){

          },
          icon: Icons.date_range,
          ),
        ],
      )),
      //13
      DataCell(Row(
        children: [
          Icon(Icons.add_circle_outline),
          SizedBox(
            width: 18,
          ),
          orders.invoicesDocuments!.isNotEmpty ? Icon(Icons.file_copy, color: Colors.blue,size: 18,) : Text('')
        ],
      )),
      //14
      DataCell(Text(orders.balDueBeforeDelivery ?? "")),
      //15
      DataCell(RoundButton(onTap: (){

      },
      color: Colors.blue,
      text: "Financial History",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.4,
      )),
      //16
      DataCell(Row(
        children: [
          Icon(Icons.add_circle_outline),
          SizedBox(
            width: 18,
          ),
          orders.deliveryDocuments!.isNotEmpty ? Icon(Icons.file_copy, color: Colors.blue,size: 18,) : Text('')
        ],
      )),
      //17
      DataCell(Text(orders.profile ?? "")),
      //18
      DataCell(Text(orders.doorModel ?? "")),
      //19
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: orders.marineGradeVal == "YES" ?  Color(0xff9ad9ea) : Colors.transparent,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                orders.marineGradeVal ?? "",
                style: TextStyle(color: Colors.black),
              )));
        })),
      //20
      DataCell(Text(orders.frameSizeHeightWidth ?? "")),
      //21
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: orders.lhGoalPostE44 == "YES" ? const Color.fromARGB(255, 200, 197, 169) : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                orders.lhGoalPostE44 ?? "",
                style: TextStyle(color: Colors.black),
              )));
        })),
      //22
      DataCell(Text(orders.totalWeightKg ?? "")),
      //23
              DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: orders.thresholdType == "C - 25MM HIGH PROJECTING CILL - 85MM WIDE" || orders.thresholdType == "C - 25MM HIGH PROJECTING CILL - 150MM WIDE" || orders.thresholdType == "C - 25MM HIGH PROJECTING CILL - 190MM WIDE" || orders.thresholdType == "C - 25MM HIGH PROJECTING CILL - 225MM WIDE" ?  Color(0xff9ad9ea) : Colors.transparent,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                orders.thresholdType ?? "",
                style: TextStyle(color: Colors.black),
              )));
        })),

      //24
      DataCell(Text(orders.ekeylessAccess ?? "")),
      //25
      DataCell(Text(orders.facDeliveryWeeksVal ?? "")),
      //26
      DataCell(Text(orders.telephoneNumber ?? "")),
      //27
      DataCell(Text(orders.customerEmail ?? "")),
      //28
      DataCell(Text(orders.deliveryPostCode ?? "")),
      //29
      DataCell(Text(orders.date ?? "")),
      //30
      DataCell(Text(orders.time ?? "")),
      //31
      DataCell(Text(orders.wholeTotal ?? "")),
      //32
      DataCell(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          orders.dateOfOrder!.isNotEmpty ? Text(orders.anticipatedDateVal!) : Text('mm/dd/yyyy'),
          DateButton(onTap: (){

          },
          icon: Icons.date_range,
          ),
        ],
      )),
      //33
      DataCell(Consumer<setFollowUpOrderValue>(
          builder: (context, value, child) {
            return Center(
              child: DropdownButton<String>(
                value:
                    (orders.orderFollowup == "") ? "NO" : orders.orderFollowup!,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  //newValue = orders.orderFollowup;
                  // if (newValue != null) {
                  //   // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //   //     .changeValue(newValue: newValue, quoteId: result.id!);
                  //   apiServices.setFollowUpOrderValue(
                  //       dealerId!, result.id!, newValue);
                  // } else {
                  //   // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //   //     .changeValue(
                  //   //         newValue: result.orderFollowup, quoteId: result.id!);
                  //   apiServices.setFollowUpOrderValue(
                  //       dealerId!, result.id!, result.orderFollowup!);
                  // }
                },
                items: [
                  DropdownMenuItem<String>(value: '', child: Text('')),
                  DropdownMenuItem<String>(value: 'YES', child: Text('YES')),
                  DropdownMenuItem<String>(value: 'NO', child: Text('NO')),
                ],
              ),
            );
          },
        )),

      //34
      DataCell(Text(orders.id ?? "")),
      //35
      DataCell(Text(orders.ankaItems ?? "")),
      
      //37
      DataCell(RoundButton(onTap: (){

      },
      text: "Notes",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.4,
      color: Colors.blue,
      )),
      //38
      DataCell(RoundButton(onTap: (){

      },
      text: "Custom Handles",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.4,
      color: Colors.blue,
      )),
      //39
      DataCell(RoundButton(onTap: (){

      },
      text: "Quote Analysis",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.4,
      color: Colors.blue,
      )),
      //40
      DataCell(RoundButton(onTap: (){

      },
      text: "Back To Quote",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.4,
      color: Colors.blue,
      )),
      //41
      DataCell(Row(
        children: [
          Text(orders.date ?? ""),
          Text(orders.orderStatusVal ?? "")
        ],
      )),
      //42
      DataCell(Text(orders.saleBonus.toString())),
      //43
      //45
      // dealer support
      DataCell(Text("")),
      //46
      //47
      DataCell(RoundButton(onTap: (){

      },
      text: "Order Complete - Archive File",
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.55,
      color: Colors.blue,
      )),
      //48
      //49
      DataCell(Row(
        children: [
          Icon(
            Icons.edit,
            size: 14,
          ),
          Icon(
            Icons.content_copy_rounded,
            size: 14,
            color: Colors.greenAccent,
          ),
          Icon(
            Icons.delete,
            size: 14,
            color: Colors.red,
          ),
        ],
      )),
    ]);
  }
}
