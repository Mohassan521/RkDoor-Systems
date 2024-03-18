import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class SteelDeliveredTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const SteelDeliveredTable(
      {super.key, required this.dealerId, required this.dealerName, this.empId, this.role});

  @override
  State<SteelDeliveredTable> createState() => _SteelDeliveredTableState();
}

class _SteelDeliveredTableState extends State<SteelDeliveredTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<SteelOrderModel>>(
      future: apiServices.allSteelOrders(context, widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<SteelOrderModel>? list = snapshot.data ?? [];
        var delivered = list
            .where((result) => result.steelOrderStatusVal == "Delivered")
            .toList();

        List<SteelOrderModel> filteredList =
            Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        List<SteelOrderModel>? displayData =
            filteredList.isNotEmpty ? filteredList : delivered;

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (delivered.length > 5 && delivered.isNotEmpty)
                  ? 5
                  : delivered.isEmpty
                      ? 1
                      : delivered.length,
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
                  'Requirement',
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
                  'Color',
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
                  'Total Order Value (including VAT)',
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
                  'Order Date History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  displayData, context, widget.dealerId, widget.dealerName, widget.role!, widget.empId ?? "")),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<SteelOrderModel>? data;
  final String dealerId;
  final String dealerName;
  final String role;
  final String empId;

  MyData(this.data, this.context, this.dealerId, this.dealerName, this.role, this.empId);

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

  @override
  DataRow getRow(int index) {
    final SteelOrderModel result = data![index];
    TextEditingController factoryValue = TextEditingController();
    TextEditingController factoryDeliveryWeek = TextEditingController();
    factoryDeliveryWeek.text = result.steelFacWeekVal ?? "";
    factoryValue.text = result.steelFacOrderNoVal ?? "";

    List<dynamic> steelOrderFile = result.steelOrderConfFile ?? [];
    String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
    String fileExtension = extension(filePath).toLowerCase();

    List<dynamic> invoices = result.steelInvoices ?? [];
    String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
    String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

    List<dynamic> delNotes = result.steelDelNotes ?? [];
    String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
    String delNotesFileExtension = extension(delNotesFilePath).toLowerCase();

    List<dynamic> pdfUrl = result.manualPDFImageURL ?? [];
    String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
    String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

    List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
    String pdfImageUrlFilePath =
        pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    String pdfImageUrlFileExtension =
        extension(pdfImageUrlFilePath).toLowerCase();

    TextEditingController notesController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    NetworkApiServices apiServices = NetworkApiServices();
    return DataRow.byIndex(index: index, cells: <DataCell>[
      //1
      DataCell(Text(result.steelCustomerName ?? "")),
      //2
      DataCell(
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: result.steelOrderStatusVal == "Deposit Received" ||
                    result.steelOrderStatusVal ==
                        "Preliminary Confirmation Issued" ||
                    result.steelOrderStatusVal == "Awaiting Deposit" ||
                    result.steelOrderStatusVal ==
                        "Revised Confirmation Issued" ||
                    result.steelOrderStatusVal == "Awaiting Balance Payment" ||
                    result.steelOrderStatusVal == "Awaiting Survey / Dimensions"
                ? Colors.red
                : Color(0xffb5e51d),
          ),
          child: Text(
            (result.steelOrderStatusVal == "Deposit Received" ||
                    result.steelOrderStatusVal ==
                        "Preliminary Confirmation Issued" ||
                    result.steelOrderStatusVal == "Awaiting Deposit" ||
                    result.steelOrderStatusVal ==
                        "Revised Confirmation Issued" ||
                    result.steelOrderStatusVal == "Awaiting Balance Payment" ||
                    result.steelOrderStatusVal ==
                        "Awaiting Survey / Dimensions")
                ? 'Action Required'
                : "No Action Required",
          ),
        ),
      ),
      //3
      DataCell(Text(dealerName)),
      //4
      DataCell(Text(result.steelQNumber ?? '')),
      //5
      DataCell(Text(result.steelSaleperson ?? '')),
      //6
      DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
            controller: factoryValue,
            onEditingComplete: () {
              apiServices.setSteelFactoryOrderNo(
                  result.id!, factoryValue.text, dealerId);
            },
          ))),
      //7
      DataCell(Container(
        margin: EdgeInsets.only(bottom: 5, top: 5),
        color: Colors.lightBlue,
        child: Center(child: Text(result.steelOrderStatusVal ?? '')),
      )),
      //8
      DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: InputDecoration(fillColor: Colors.yellow, filled: true),
            readOnly: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
            //controller: factoryValue,
            onEditingComplete: () {},
          ))),
      //9

      DataCell(
        result.steelOrderConfFile!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage().then((value) {
                          apiServices.setSteelConfFile(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in result.steelOrderConfFile!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
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
                          apiServices.setSteelConfFile(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
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

      // DataCell(
      //   result.steelOrderConfFile!.isNotEmpty
      //       ? InkWell(
      //           onTap: () {
      //             fileExtension == ".pdf"
      //                 ? Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => PDFViewer(
      //                             url: result.steelOrderConfFile!.isNotEmpty
      //                                 ? result.steelOrderConfFile![0]
      //                                 : [])))
      //                 : fileExtension == ".jpg" ||
      //                         fileExtension == ".jpeg" ||
      //                         fileExtension == ".png"
      //                     ? showImageDialog(context, steelOrderFile)
      //                     : Utils().showToast('File Format not supported',
      //                         Color(0xff941420), Colors.white);
      //             print(result.steelInvoices![0]);
      //           },
      //           child: Center(
      //             child: Row(
      //               children: [
      //                 IconButton(
      //                     onPressed: () {
      //                       getImage().then((value) {
      //                         apiServices.setSteelConfFile(
      //                             result.id!, dealerId, value);
      //                         print('Value in steel order file: $value');
      //                       });
      //                     },
      //                     icon: Icon(Icons.add_circle_outline)),
      //                 SizedBox(
      //                   width: 20,
      //                 ),
      //                 Icon(
      //                   (fileExtension == '.jpg' ||
      //                           fileExtension == '.jpeg' ||
      //                           fileExtension == '.png')
      //                       ? Icons.file_open
      //                       : (fileExtension == '.pdf')
      //                           ? Icons.picture_as_pdf
      //                           : Icons.file_present,
      //                   size: 16,
      //                   color: Colors.blue,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )
      //       : Center(
      //           child: Row(
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     getImage().then((value) {
      //                       apiServices.setSteelConfFile(
      //                           result.id!, dealerId, value);
      //                       print('Value in steel order file: $value');
      //                     });
      //                   },
      //                   icon: Icon(Icons.add_circle_outline)),
      //               Text(
      //                 'Add Files',
      //                 style: TextStyle(color: Colors.grey),
      //               )
      //             ],
      //           ),
      //         ),
      // ),
      //10
      DataCell(Container(
            height: MediaQuery.sizeOf(context).height * 0.045,
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(width: 1, color: Colors.transparent)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (result.steelAnticipatedDate != null)
                      ? result.steelAnticipatedDate!
                      : "mm/dd/yyyy",
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
                      apiServices.setAnticipatedDate(
                          dealerId, result.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ],
            ),
          )),
      //11

      DataCell(
        result.steelInvoices!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage().then((value) {
                          apiServices.setInvoicesSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in result.steelInvoices!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
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
                          apiServices.setInvoicesSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
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

      // DataCell(
      //   result.steelInvoices!.isNotEmpty
      //       ? InkWell(
      //           onTap: () {
      //             invoiceFileExtension == ".pdf"
      //                 ? Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => PDFViewer(
      //                             url: result.steelInvoices!.isNotEmpty
      //                                 ? result.steelInvoices![0]
      //                                 : [])))
      //                 : invoiceFileExtension == ".jpg" ||
      //                         invoiceFileExtension == ".jpeg" ||
      //                         invoiceFileExtension == ".png"
      //                     ? Text('data') //showImageDialog(context, invoices)
      //                     : Utils().showToast('File Format not supported',
      //                         Color(0xff941420), Colors.white);
      //             print(result.steelInvoices![0]);
      //           },
      //           child: Row(
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     getImage().then((value) {
      //                       apiServices.setInvoicesSteelOrder(
      //                           result.id!, dealerId, value);
      //                     });
      //                   },
      //                   icon: Icon(Icons.add_circle_outline)),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Center(
      //                 child: Icon(
      //                   (invoiceFileExtension == '.jpg' ||
      //                           invoiceFileExtension == '.jpeg' ||
      //                           invoiceFileExtension == '.png')
      //                       ? Icons.file_open
      //                       : (invoiceFileExtension == '.pdf')
      //                           ? Icons.picture_as_pdf
      //                           : Icons.file_present,
      //                   size: 16,
      //                   color: Colors.blue,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       : Row(
      //           children: [
      //             IconButton(
      //                 onPressed: () {
      //                   getImage().then((value) {
      //                     apiServices.setInvoicesSteelOrder(
      //                         result.id!, dealerId, value);
      //                   });
      //                 },
      //                 icon: Icon(Icons.add_circle_outline)),
      //             Text(
      //               'Add Files',
      //               style: TextStyle(color: Colors.grey),
      //             )
      //           ],
      //         ),
      // ),
      //12
      DataCell(Text(result.steelBalDueBeforeDelivery ?? "")),
      //13
      DataCell(RoundButton(
        text: 'Financial History',
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SteelOrderFinancialHistory(
                        steelOrdersModel: result,
                        dealerId: dealerId,
                        dealerName: dealerName,
                        role: role
                      )));
        },
        color: Colors.blue,
      )),
      //14

      DataCell(
        result.steelDelNotes!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage().then((value) {
                          apiServices.setDelNotesSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in result.steelDelNotes!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
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
                          apiServices.setDelNotesSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
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

      // DataCell(
      //   result.steelDelNotes!.isNotEmpty
      //       ? InkWell(
      //           onTap: () {
      //             delNotesFileExtension == ".pdf"
      //                 ? Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => PDFViewer(
      //                             url: result.steelDelNotes!.isNotEmpty
      //                                 ? result.steelDelNotes![0]
      //                                 : [])))
      //                 : delNotesFileExtension == ".jpg" ||
      //                         delNotesFileExtension == ".jpeg" ||
      //                         delNotesFileExtension == ".png"
      //                     ? Text('data') // showImageDialog(context, delNotes)
      //                     : Utils().showToast('File Format not supported',
      //                         Color(0xff941420), Colors.white);
      //             //print(result.steelInvoices![0]);
      //           },
      //           child: Row(
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     getImage().then((value) {
      //                       apiServices.setDelNotesSteelOrder(
      //                           result.id!, dealerId, value);
      //                       print('Value in steel order file: $value');
      //                     });
      //                   },
      //                   icon: Icon(Icons.add_circle_outline)),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Center(
      //                 child: Icon(
      //                   (delNotesFileExtension == '.jpg' ||
      //                           delNotesFileExtension == '.jpeg' ||
      //                           delNotesFileExtension == '.png')
      //                       ? Icons.file_open
      //                       : (delNotesFileExtension == '.pdf')
      //                           ? Icons.picture_as_pdf
      //                           : Icons.file_present,
      //                   size: 16,
      //                   color: Colors.blue,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       : Row(
      //           children: [
      //             IconButton(
      //                 onPressed: () {
      //                   getImage().then((value) {
      //                     apiServices.setDelNotesSteelOrder(
      //                         result.id!, dealerId, value);
      //                     print('Value in steel order file: $value');
      //                   });
      //                 },
      //                 icon: Icon(Icons.add_circle_outline)),
      //             Text(
      //               'Add Files',
      //               style: TextStyle(color: Colors.grey),
      //             )
      //           ],
      //         ),
      // ),
      //15
      DataCell(Text(result.steelSupplyType ?? '')),
      //16
      DataCell(Text(result.steelFrameSize ?? "")),
      //17
      DataCell(Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width * 0.45,
          height: MediaQuery.sizeOf(context).height * 0.055,
          decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(width: 1, color: Colors.transparent)),
          child: Text(result.steelColor ?? ''))),
      // 18
      DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
            controller: factoryDeliveryWeek,
            onChanged: (value) {
              Timer(Duration(seconds: 5), () {
                apiServices.factoryDeliveryWeekSteelOrder(
                    dealerId, value, result.id!);
              });
            },
          ))),
      //19
      DataCell(Text(result.dileveryPostCodeC13 ?? '')),
      //20
      DataCell(Text(result.steelWeight ?? '')),
      //21
      DataCell(Text(result.steelCustomerTel ?? '')),
      //22
      DataCell(Text(result.steelDealerEmail ?? '')),
      //23
      DataCell(Text(result.steelTotalOrderValue ?? '')),
      //24

      DataCell(
        result.manualPDFImageURL!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        getImage().then((value) {
                          apiServices.ManualFileUploadSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    SizedBox(width: 20),
                    // Create icons for each file
                    for (var file in result.manualPDFImageURL!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
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
                          apiServices.ManualFileUploadSteelOrder(
                              result.id!, dealerId, value);
                          print('Value in steel order file: $value');
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

      // DataCell(
      //   result.manualPDFImageURL!.isNotEmpty
      //       ? InkWell(
      //           onTap: () async {
      //             for (int i = 0; i < result.manualPDFImageURL!.length; i++) {
      //               String currentUrl = result.manualPDFImageURL![i];
      //               pdfUrlFileExtension == ".pdf"
      //                   ? await Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => PDFViewer(
      //                               url: currentUrl.isNotEmpty
      //                                   ? currentUrl
      //                                   : "")))
      //                   : pdfUrlFileExtension == ".jpg" ||
      //                           pdfUrlFileExtension == ".jpeg" ||
      //                           pdfUrlFileExtension == ".png"
      //                       ? showImageDialog(context, pdfUrl[i])
      //                       : Utils().showToast('File Format not supported',
      //                           Color(0xff941420), Colors.white);
      //               print(result.steelInvoices![0]);
      //             }
      //           },
      //           child: Row(
      //             children: [
      //               IconButton(
      //                   onPressed: () {
      //                     getImage().then((value) {
      //                       apiServices.ManualFileUploadSteelOrder(
      //                           result.id!, dealerId, value);
      //                       print('Value in steel order file: $value');
      //                     });
      //                   },
      //                   icon: Icon(Icons.add_circle_outline)),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               for (int i = 0; i < result.manualPDFImageURL!.length; i++)
      //                 Center(
      //                     child: Icon(
      //                   ((pdfUrlFileExtension == '.jpg' ||
      //                           pdfUrlFileExtension == '.jpeg' ||
      //                           pdfUrlFileExtension == '.png')
      //                       ? Icons.file_open
      //                       : Icons.picture_as_pdf),
      //                   size: 15,
      //                   color: Colors.blue,
      //                 )),
      //               SizedBox(
      //                 width: 150,
      //               )
      //             ],
      //           ),
      //         )
      //       : Row(
      //           children: [
      //             IconButton(
      //                 onPressed: () {
      //                   getImage().then((value) {
      //                     apiServices.ManualFileUploadSteelOrder(
      //                         result.id!, dealerId, value);
      //                     print('Value in steel order file: $value');
      //                   });
      //                 },
      //                 icon: Icon(Icons.add_circle_outline)),
      //             Text(
      //               'Add Files',
      //               style: TextStyle(color: Colors.grey),
      //             )
      //           ],
      //         ),
      // ),

      //25
      DataCell(result.pDFImageURL!.isNotEmpty
          ? InkWell(
              onTap: () {
                pdfImageUrlFileExtension == ".pdf"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDFViewer(
                                url: result.pDFImageURL!.isNotEmpty
                                    ? result.pDFImageURL![0]
                                    : [])))
                    : pdfImageUrlFileExtension == ".jpg" ||
                            pdfImageUrlFileExtension == ".jpeg" ||
                            pdfImageUrlFileExtension == ".png"
                        ? Text('data') // showImageDialog(context, pdfImageUrl)
                        : Utils().showToast(
                            'File Format not supported ${pdfImageUrlFileExtension}',
                            Color(0xff941420),
                            Colors.white);
                print(result.steelInvoices![0]);
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
      //26
      DataCell(Text(result.date ?? '')),
      //27
      DataCell(Text(result.time ?? '')),
      //28
      DataCell(RoundButton(
        text: 'Notes',
        onTap: () async {
          notesController.text = result.notes!;
          await showDialog(
              context: context,
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
                                      apiServices.setNotesValue(dealerId,
                                          result.id!, notesController.text);
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
        color: Colors.blue,
      )),
      //29
      DataCell(Text('${result.date} ${result.time}')),
      //30
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditSteelOrder(
                          dealerId: dealerId,
                          dealerName: dealerName,
                          model: result)));
            },
            icon: Icon(Icons.edit),
            iconSize: 16,
          ),
          IconButton(
            onPressed: () {
              apiServices.deleteSteelOrder(dealerId, result.id!);
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
            iconSize: 16,
          ),
        ],
      )),
    ]);
  }
}
