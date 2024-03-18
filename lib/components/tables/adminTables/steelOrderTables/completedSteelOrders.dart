import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/CompletedSteelOrders.dart';
import 'package:price_link/models/admin%20models/steelOrderModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class AdminCompletedSteelOrders extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminCompletedSteelOrders(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminCompletedSteelOrders> createState() =>
      _AdminCompletedSteelOrdersState();
}

class _AdminCompletedSteelOrdersState extends State<AdminCompletedSteelOrders> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<ClosedSteelOrders>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder(
      future: apiServices.getAllCompletedSteelOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        List<ClosedSteelOrders> filteredList =
            Provider.of<CompleteSteelOrderSearchData>(context).filteredDataModel;
        List<ClosedSteelOrders>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

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
                  'Steel Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Order Confirmation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anticipated Delivery Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Invoices',
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
                  'Supply Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Frame Size',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Delivery Week',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Weight',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Total Order Value',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Discount',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Cost',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'File Upload',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation',
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
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sale Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Supplier',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Date History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  displayData, context, widget.dealerId, widget.dealerName)),
        );
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
  final List<ClosedSteelOrders>? dealerDataList;

  MyData(this.dealerDataList, this.myGlobalBuildContext, this.dealerId, this.dealerName,
      );

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
      for (var quote in dealerData.completesteelOrders!) {
        // TextEditingController configuratorCode = TextEditingController();
        // configuratorCode.text = quote.enquiryConfCode ?? "";

        TextEditingController facDeliveryWeek = TextEditingController();

        // confcode.text = quote.orderNoVal ?? "";
        facDeliveryWeek.text = quote.steelFacWeekVal ?? "";
        // ankaValue.text = quote.ankaItems ?? "";

          List<dynamic> steelOrderFile = quote.steelOrderConfFile ?? [];
    String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
    String fileExtension = extension(filePath).toLowerCase();

    List<dynamic> invoices = quote.steelInvoices ?? [];
    String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
    String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

    List<dynamic> delNotes = quote.steelDelNotes ?? [];
    String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
    String delNotesFileExtension = extension(delNotesFilePath).toLowerCase();

    List<dynamic> pdfUrl = quote.manualPDFImageURL ?? [];
    String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
    String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

    List<dynamic> pdfImageUrl = quote.pdfImageURL ?? [];
    String pdfImageUrlFilePath =
        pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    String pdfImageUrlFileExtension =
        extension(pdfImageUrlFilePath).toLowerCase();

   

    // List<dynamic> pdfImageUrl = quote.pDFImageURL ?? [];
    // String pdfImageUrlFilePath =
    //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    // String pdfImageUrlFileExtension =
    //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              DataCell(Text(quote.steelCustomerName ?? "")),
      //2
      DataCell(
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: quote.steelOrderStatusVal == "Deposit Received" ||
                    quote.steelOrderStatusVal ==
                        "Preliminary Confirmation Issued" ||
                    quote.steelOrderStatusVal == "Awaiting Deposit" ||
                    quote.steelOrderStatusVal ==
                        "Revised Confirmation Issued" ||
                    quote.steelOrderStatusVal == "Awaiting Balance Payment" ||
                    quote.steelOrderStatusVal == "Awaiting Survey / Dimensions"
                ? Colors.red
                : Color(0xffb5e51d),
          ),
          child: Text(
            (quote.steelOrderStatusVal == "Deposit Received" ||
                    quote.steelOrderStatusVal ==
                        "Preliminary Confirmation Issued" ||
                    quote.steelOrderStatusVal == "Awaiting Deposit" ||
                    quote.steelOrderStatusVal ==
                        "Revised Confirmation Issued" ||
                    quote.steelOrderStatusVal == "Awaiting Balance Payment" ||
                    quote.steelOrderStatusVal ==
                        "Awaiting Survey / Dimensions")
                ? 'Action Required'
                : "No Action Required",
          ),
        ),
      ),
      //3
      DataCell(Text(dealerData.displayName ?? "")),
      //4
      DataCell(Text(quote.steelQNumber ?? "")),
      //5
      DataCell(Text(dealerData.dealerName ?? "")),
      //6
      DataCell(Text(quote.steelFacOrderNoVal ?? "")),

      //8
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: quote.steelOrderStatusVal == "Awaiting Deposit" || quote.steelOrderStatusVal == "Awaiting Balance Payment"
                      ? Colors.yellow
                      : quote.steelOrderStatusVal == "Delayed" || quote.steelOrderStatusVal == "Preliminary Confirmation Issued"
                          ? Colors.red
                          : quote.steelOrderStatusVal == "In Production" || quote.steelOrderStatusVal == "Delivered"
                              ? Color(0xffb5e51d)
                              : quote.steelOrderStatusVal == "Ready For Shipping"
                                  ? Color(0xff008001)
                                  : quote.steelOrderStatusVal == "Order Received"
                                      ? Color(0xff9ad9ea)
                                      : quote.steelOrderStatusVal ==
                                              "Order Placed"
                                          ? Color(0xffffc90d)
                                          : quote.steelOrderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : quote.steelOrderStatusVal == "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6) : quote.steelOrderStatusVal == "In Transit To UK" ? Color(0xfffeaec9) : quote.steelOrderStatusVal == "In RKDS Warehouse" ?  Color(0xff9ad9ea)
                                                  : quote.steelOrderStatusVal == "Out For Delivery" || quote.steelOrderStatusVal == "Awaiting Survey / Dimensions" ? Color(0xff7092bf) : Colors.white,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                quote.steelOrderStatusVal ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )));
        })),
      //9
      //10
      DataCell(
        quote.steelOrderConfFile!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in quote.steelOrderConfFile!)
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
                ),
              )
            : Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();
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

      //11
      DataCell(Container(
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 1, color: Colors.transparent)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (quote.steelAnticipatedDate != null)
                      ? quote.steelAnticipatedDate!
                      : "mm/dd/yyyy",
                  style: TextStyle(fontSize: 12),
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
                      // value.setDate(quote.id!, pickedDate);
                      // apiServices.setAnticipatedDate(
                      //     dealerId, quote.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ],
            ),
          )
),

      //12
      DataCell(
        quote.steelInvoices!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();;
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in quote.steelInvoices!)
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
                ),
              )
            : Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();
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

      //13
      DataCell(Text(quote.steelBalDueBeforeDelivery ?? "")),
      //14
      DataCell(RoundButton(onTap: (){

      },
      text: "Financial History",
      color: Colors.blue,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
      )),
      //15
      DataCell(
        quote.steelDelNotes!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in quote.steelDelNotes!)
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
                        getImage();
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

      //16
      DataCell(Text(quote.steelSupplyType ?? "")),
      //17
      DataCell(Text(quote.steelFrameSize ?? "")),
      //18
      // DataCell(Builder(builder: (context) {
      //     return Container(
      //         decoration: BoxDecoration(
      //             color: quote.steelColor == "RAL 9003 MS" || quote.steelColor == "RAL 7021 MS" || quote.steelColor == "RAL 7039 MS" || quote.steelColor == "RAL 7022 MS" || quote.steelColor == "DB703 MS" || quote.steelColor == "CUSTOM COLOUR" ? Colors.orange : Colors.transparent,
      //                               borderRadius: BorderRadius.circular(5.5)),
      //         height: MediaQuery.sizeOf(context).height * 0.05,
      //         width: MediaQuery.sizeOf(context).width * 0.35,
      //         child: Center(
      //             child: Text(
      //           quote.steelColor ?? "",
      //           style: TextStyle(color: Colors.black),
      //         )));
      //   })),

      //19
      DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
            controller: facDeliveryWeek,
            onChanged: (value) {
              // Timer(Duration(seconds: 5), () {
              //   apiServices.factoryDeliveryWeekSteelOrder(
              //       dealerId, value, result.id!);
              // });
            },
          ))),
      //20
      DataCell(Text(quote.deliveryPostCode ?? "")),
      //21
      DataCell(Text(quote.steelWeight ?? "")),
      //22
      DataCell(Text(quote.steelCustomerTel ?? "")),
      //23
      DataCell(Text(quote.steelDealerEmail ?? "")),
      //24
      DataCell(Text(quote.steelTotalOrderValue ?? "")),


      // discount
      DataCell(Text(quote.steelDiscount ?? "")),
      //25
      DataCell(Text(quote.steelDeliveryCost ?? "")),
      //26
      DataCell(
        quote.manualPDFImageURL!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in quote.manualPDFImageURL!)
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
                        getImage();
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

      //27
      DataCell(Text(quote.steelQNumber ?? "")),
      //28
      DataCell(Text(quote.date ?? "")),
      //29
      DataCell(Text(quote.time ?? "")),
      //30
      DataCell(RoundButton(onTap: (){

      },
      text: "Notes",
      color: Colors.blue,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.045,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
      )),
      //31
      DataCell(Text(quote.saleBonus ?? "")),
      //32
      
      //34
      DataCell(Text("")),
      //39
      DataCell(Text("${quote.date} ${quote.steelOrderStatusVal}")),
    
      DataCell(Row(
        children: [
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
      count += dealerData.completesteelOrders!.length;
    }
    return count;
  }
}
