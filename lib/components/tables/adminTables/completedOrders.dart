import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminCompletedOrders.dart';
import 'package:path/path.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class AdminCompletedOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminCompletedOrdersTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminCompletedOrdersTable> createState() =>
      _AdminCompletedOrdersTableState();
}

class _AdminCompletedOrdersTableState extends State<AdminCompletedOrdersTable> {
  //List<DealersModel> dealers = [];

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

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
      future: apiServices.getCompletedOrdersForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompleteResponseForCompletedOrders>? list = snapshot.data ?? [];

        List<CompleteResponseForCompletedOrders> filteredList =
            Provider.of<CompletedOrdersSearchData>(context).filteredDataModel2;
        List<CompleteResponseForCompletedOrders>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        print("completed orders: ${list.length}");

        print("completed orders list: $list");
        // List<CompletedOrders> filteredList =
        //     Provider.of<CompletedOrdersSearchData>(context).filteredDataModel;
        // List<CompletedOrders>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
            showEmptyRows: false,
            headingRowHeight: 48,
            dataRowMaxHeight: 48,
            columnSpacing: 20,
            rowsPerPage: (list.length >= 5 && list.isNotEmpty)
                ? 5
                : (list.isEmpty)
                    ? 1
                    : list.length,
            columns: const <DataColumn>[
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
                'Quote ID',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Factory Order No',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Order Status',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Order Confirmation',
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
                'Delivery Note',
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
                '',
                style: TextStyle(color: Color(0xff941420)),
              )),
            ],
            source: MyData(displayData, _dateTime, widget.dealerId,
                widget.dealerName, _showDatePicker,
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
  final List<CompleteResponseForCompletedOrders>? dealerDataList;

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
      for (var quote in dealerData.completedorders) {
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

        // List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
        // String pdfImageUrlFilePath =
        //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        // String pdfImageUrlFileExtension =
        //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
              index: index,
              color: MaterialStatePropertyAll(Colors.white),
              cells: [
                DataCell(Text(
                  dealerData.displayName,
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Text(
                  quote.quotationNumber ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Text(
                  dealerData.dealerName,
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Text(
                  quote.id ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Text(
                  quote.name ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                      controller: confcode,
                      onChanged: (value) {
                        // Timer(Duration(seconds: 5), () {
                        //   apiServices.factoryDeliveryWeekSteelOrder(
                        //       dealerId, value, result.id!);
                        // });
                      },
                    ))),
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
                                                              ? Color(
                                                                  0xfffeaec9)
                                                              : quote.orderStatusVal ==
                                                                      "In RKDS Warehouse"
                                                                  ? Color(
                                                                      0xff9ad9ea)
                                                                  : Color(
                                                                      0xff7092bf),
                          borderRadius: BorderRadius.circular(5.5)),
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.30,
                      child: Center(
                          child: Text(
                        quote.orderStatusVal!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 12.5),
                      )));
                })),

                DataCell(
                  quote.documents!.isNotEmpty
                      ? Center(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  getImage();
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
                                      showImageDialog(
                                          myGlobalBuildContext, file);
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
                              Text(
                                'Add Files',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                ),
                //11
                //         DataCell(
                //   quote.manualQuickDocumentUpload!.isNotEmpty
                //       ? Center(
                //           child: Row(
                //             children: [
                //               IconButton(
                //                 onPressed: () {
                //                   getImage();
                //                 },
                //                 icon: Icon(Icons.add_circle_outline),
                //               ),
                //               SizedBox(width: 20),
                //               // Create icons for each file
                //               for (var file in quote.manualQuickDocumentUpload!)
                //                 InkWell(
                //                   onTap: () {
                //                     String fileExtension = extension(file).toLowerCase();
                //                     if (fileExtension == ".pdf") {
                //                       print(file);
                //                       Navigator.push(
                //                         myGlobalBuildContext,
                //                         MaterialPageRoute(
                //                           builder: (context) => PDFViewer(url: file),
                //                         ),
                //                       );
                //                     } else if (fileExtension == ".jpg" ||
                //                         fileExtension == ".jpeg" ||
                //                         fileExtension == ".png") {
                //                       print(file);
                //                       showImageDialog(myGlobalBuildContext, file);
                //                     } else {
                //                       print(file);
                //                       Utils().showToast(
                //                         'File Format not supported',
                //                         Color(0xff941420),
                //                         Colors.white,
                //                       );
                //                     }
                //                   },
                //                   child: Icon(
                //                     (invoiceFileExtension == '.jpg' ||
                //                             invoiceFileExtension == '.jpeg' ||
                //                             invoiceFileExtension == '.png')
                //                         ? Icons.file_open
                //                         : (invoiceFileExtension == '.pdf')
                //                             ? Icons.picture_as_pdf
                //                             : Icons.file_present,
                //                     size: 16,
                //                     color: Colors.blue,
                //                   ),
                //                 ),
                //             ],
                //           ),
                //         )
                //       : Center(
                //           child: Row(
                //             children: [
                //               IconButton(
                //                 onPressed: () {
                //                   getImage();
                //                 },
                //                 icon: Icon(Icons.add_circle_outline),
                //               ),
                //               SizedBox(width: 20),
                //               Text(
                //                 'Add Files',
                //                 style: TextStyle(color: Colors.grey),
                //               )
                //             ],
                //           ),
                //         ),
                // ),
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
                      onTap: () {},
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
                                  getImage();
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
                                      showImageDialog(
                                          myGlobalBuildContext, file);
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
                              Text(
                                'Add Files',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                ),
                //14
                //16
                DataCell(
                  quote.deliveryDocuments!.isNotEmpty
                      ? Center(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  getImage();
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
                                      showImageDialog(
                                          myGlobalBuildContext, file);
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
                              Text(
                                'Add Files',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                ),
                DataCell(Text(
                  quote.telephoneNumber ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                //18
                DataCell(Text(
                  quote.customerEmail ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                //19
                DataCell(Text(
                  quote.deliveryPostCode ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                //20
                DataCell(Text(
                  quote.date ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                //21
                DataCell(Text(
                  quote.time ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                //22
                DataCell(Text(
                  quote.wholeTotal ?? "",
                  style: TextStyle(fontSize: 12.5),
                )),
                DataCell(Consumer<FollowUpOrderDate>(
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (quote.orderDate != null)
                              ? quote.orderDate!
                              : value.getDate(quote.id!),
                          style: TextStyle(fontSize: 12.5),
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
                              // apiServices.setFollowUpOrderDate(
                              //     dealerId!, result.id!, pickedDate);
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
                        value: (quote.orderFollowup == "")
                            ? "NO"
                            : quote.orderFollowup!,
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 12.5),
                        onChanged: (String? newValue) {
                          //newValue = result.orderFollowup;
                          if (newValue != null) {
                            // Provider.of<setFollowUpOrderValue>(context, listen: false)
                            //     .changeValue(newValue: newValue, quoteId: result.id!);
                            // apiServices.setFollowUpOrderValue(
                            //     dealerId!, result.id!, newValue);
                          } else {
                            // Provider.of<setFollowUpOrderValue>(context, listen: false)
                            //     .changeValue(
                            //         newValue: result.orderFollowup, quoteId: result.id!);
                            // apiServices.setFollowUpOrderValue(
                            //     dealerId!, result.id!, result.orderFollowup!);
                          }
                        },
                        items: [
                          DropdownMenuItem<String>(
                              value: 'YES', child: Text('YES')),
                          DropdownMenuItem<String>(
                              value: 'NO', child: Text('NO')),
                        ],
                      ),
                    );
                  },
                )),

                //37
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Notes",
                  color: Colors.blue,
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.15,
                  height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
                )),
                //39
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Quote Analysis",
                  color: Colors.blue,
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.21,
                  height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
                )),
                DataCell(Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 14,
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
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 14,
                    ),
                  ],
                ))
              ]);
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
      count += dealerData.completedorders.length;
    }
    return count;
  }
}

    // return DataRow.byIndex(index: index, cells: <DataCell>[
    //   //1
    //   DataCell(Text(quote.isNotEmpty ? quote[index].name ?? "" : "")),
    //   //2
    //   DataCell(Text(displayname.displayName ?? "")),
    //   //3
    //   DataCell(Text(quote.isNotEmpty ? quote[index].quotationNumber ?? "" : "")),
    //   //4
    //   DataCell(Text(displayname.dealerName ?? "")),
    //   //5
    //   DataCell(Text(quote.isNotEmpty ? quote[index].id ?? "" : "")),
    //   //6
    //   DataCell(Text(quote.isNotEmpty ? quote[index].telephoneNumber ?? "" : "")),
    //   //7
    //   DataCell(Text(quote.isNotEmpty ? quote[index].customerEmail ?? "" : "")),
    //   //8
    //   DataCell(Text(quote.isNotEmpty ? quote[index].deliveryPostCode ?? "" : "")),
    //   //9
    //   DataCell(Text(quote.isNotEmpty ? quote[index].date ?? "" : "")),
    //   //10
    //   DataCell(Text(quote.isNotEmpty ? quote[index].time ?? "" : "")),
    //   //11
    //   DataCell(Text(quote.isNotEmpty ? quote[index].wholeTotal ?? "" : "")),
    //   //12
    //   // DataCell(Text(quote.isNotEmpty ? "${quote[index].deliveryCostForQuote ?? ""}" : "")),
    //   DataCell(Text("")),
    //   //13
    //   DataCell(Text("")),
    //   //14
    //   DataCell(Text(quote.isNotEmpty ? "${quote[index].randtSelectBox ?? ""} - ${quote[index].markupVal ?? ""}" : "")),
    //   //15
    //   DataCell(Text("")),
    //   //16
    //   DataCell(Text(quote.isNotEmpty ? quote[index].saleBonus ?? "" : "")),
    //   //17
    //   // follow up date
    //   DataCell(Text("")),
    //   //18
    //   DataCell(Consumer<setFollowUpValue>(
    //     builder: (context, value, child) {
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 8.0, top: 8),
    //         child: Container(
    //           alignment: Alignment.center,
    //           width: MediaQuery.sizeOf(context).width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(0Xff008000),
    //               border: Border.all(width: 1)),
    //           child: DropdownButton<String>(
    //             isExpanded: true,
    //             value: "NO",
    //             onChanged: (String? newValue) {
    //               // if (newValue != null) {
    //               //   apiServices.setFollowUpValue(
    //               //       dealerId!, result.id!, newValue);
    //               // } else {
    //               //   apiServices.setFollowUpValue(
    //               //       dealerId!, result.id!, result.orderFUpQVal!);
    //               // }
    //             },
    //             items: [
    //               DropdownMenuItem<String>(
    //                   value: 'YES',
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     'YES',
    //                     style: TextStyle(color: Colors.black),
    //                   )),
    //               DropdownMenuItem<String>(
    //                   value: 'NO',
    //                   alignment: Alignment.center,
    //                   child: Center(
    //                     child: Text(
    //                       'NO',
    //                       style: TextStyle(color: Colors.black),
    //                     ),
    //                   )),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   )),

    //   //19
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Quote Analysis",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //20
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Notes",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //21
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Survey Form",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //22
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Create Order",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //23
    //   DataCell(Row(
    //     children: [
    //       Icon(Icons.edit, size: 14,),
    //       Icon(Icons.copy, size: 14,),
    //       Icon(Icons.delete, color: Colors.red,size: 14,),
    //     ],
    //   )),

    // ]);
  

