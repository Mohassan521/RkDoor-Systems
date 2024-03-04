import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/steelOrderModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class AdminSteelRCIssued extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminSteelRCIssued(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminSteelRCIssued> createState() => _AdminSteelRCIssuedState();
}

class _AdminSteelRCIssuedState extends State<AdminSteelRCIssued> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<AdminSteelOrder>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder(
      future: apiServices.getSteelOrdersForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        List<AdminSteelOrder> filteredList = list!.where((element) => element.steelOrderStatusVal == "Revised Confirmation Issued").toList();

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
                  'Filter Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Payment Status',
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
                  'Colour',
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
                  'Net Order Value (From Steel Order Form)',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Discount',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sale Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Gross bonus payment',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sale Staff Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Admin Staff Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Filter Supplier',
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
  final List<AdminSteelOrder>? data;
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
    final result = data![index];
    // TextEditingController factoryValue = TextEditingController();
    // TextEditingController factoryDeliveryWeek = TextEditingController();
    // factoryDeliveryWeek.text = result.steelFacWeekVal ?? "";
    // factoryValue.text = result.steelFacOrderNoVal ?? "";

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

    List<dynamic> pdfImageUrl = result.pdfImageURL ?? [];
    String pdfImageUrlFilePath =
        pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    String pdfImageUrlFileExtension =
        extension(pdfImageUrlFilePath).toLowerCase();

    // TextEditingController notesController = TextEditingController();
    // final _formKey = GlobalKey<FormState>();
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
      DataCell(Text('')),
      //4
      DataCell(Text(result.steelQNumber ?? "")),
      //5
      DataCell(Text('')),
      //6
      DataCell(Text(result.steelFacOrderNoVal ?? "")),
      //7
      DataCell(Text(result.steelOrderStatusVal ?? "")),
      //8
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.steelOrderStatusVal == "Awaiting Deposit" || result.steelOrderStatusVal == "Awaiting Balance Payment"
                      ? Colors.yellow
                      : result.steelOrderStatusVal == "Delayed" || result.steelOrderStatusVal == "Preliminary Confirmation Issued"
                          ? Colors.red
                          : result.steelOrderStatusVal == "In Production" || result.steelOrderStatusVal == "Delivered"
                              ? Color(0xffb5e51d)
                              : result.steelOrderStatusVal == "Ready For Shipping"
                                  ? Color(0xff008001)
                                  : result.steelOrderStatusVal == "Order Received"
                                      ? Color(0xff9ad9ea)
                                      : result.steelOrderStatusVal ==
                                              "Order Placed"
                                          ? Color(0xffffc90d)
                                          : result.steelOrderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : result.steelOrderStatusVal == "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6) : result.steelOrderStatusVal == "In Transit To UK" ? Color(0xfffeaec9) : result.steelOrderStatusVal == "In RKDS Warehouse" ?  Color(0xff9ad9ea)
                                                  : result.steelOrderStatusVal == "Out For Delivery" || result.steelOrderStatusVal == "Awaiting Survey / Dimensions" ? Color(0xff7092bf) : Colors.white,
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                result.steelOrderStatusVal ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )));
        })),
      //9
      DataCell(Text(result.steelOrderPaymentStatusVal ?? "")),
      //10
      DataCell(
        result.steelOrderConfFile!.isNotEmpty
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
      DataCell(Consumer<AnticipatedDeliveryDateSteelOrder>(
        builder: (context, value, child) {
          return Container(
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
                      // apiServices.setAnticipatedDate(
                      //     dealerId, result.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ],
            ),
          );
        },
      )),

      //12
      DataCell(
        result.steelInvoices!.isNotEmpty
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

      //13
      DataCell(Text(result.steelBalDueBeforeDelivery ?? "")),
      //14
      DataCell(RoundButton(onTap: (){

      },
      text: "Financial History",
      color: Colors.blue,
      height: MediaQuery.sizeOf(context).height * 0.045,
      width: MediaQuery.sizeOf(context).width * 0.4,
      )),
      //15
      DataCell(
        result.steelDelNotes!.isNotEmpty
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

      //16
      DataCell(Text(result.steelSupplyType ?? "")),
      //17
      DataCell(Text(result.steelFrameSize ?? "")),
      //18
      DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.steelColor == "RAL 9003 MS" || result.steelColor == "RAL 7021 MS" || result.steelColor == "RAL 7039 MS" || result.steelColor == "RAL 7022 MS" || result.steelColor == "DB703 MS" || result.steelColor == "CUSTOM COLOUR" ? Colors.orange : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Center(
                  child: Text(
                result.steelColor ?? "",
                style: TextStyle(color: Colors.black),
              )));
        })),

      //19
      DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
            //controller: factoryDeliveryWeek,
            onChanged: (value) {
              // Timer(Duration(seconds: 5), () {
              //   apiServices.factoryDeliveryWeekSteelOrder(
              //       dealerId, value, result.id!);
              // });
            },
          ))),
      //20
      DataCell(Text(result.deliveryPostCode ?? "")),
      //21
      DataCell(Text(result.steelWeight ?? "")),
      //22
      DataCell(Text(result.steelCustomerTel ?? "")),
      //23
      DataCell(Text(result.steelDealerEmail ?? "")),
      //24
      DataCell(Text(result.steelTotalOrderValue ?? "")),
      //25
      DataCell(Text(result.steelDeliveryCost ?? "")),
      //26
      DataCell(
        result.manualPDFImageURL!.isNotEmpty
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
      DataCell(result.pdfImageURL!.isNotEmpty || result.pdfImageURL != null
          ? InkWell(
              onTap: () {
                pdfImageUrlFileExtension == ".pdf"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDFViewer(
                                url: result.pdfImageURL!.isNotEmpty || result.pdfImageURL != null
                                    ? result.pdfImageURL![0]
                                    : [])))
                    : pdfImageUrlFileExtension == ".jpg" ||
                            pdfImageUrlFileExtension == ".jpeg" ||
                            pdfImageUrlFileExtension == ".png"
                        ? showImageDialog(context, result.pdfImageURL![0]) // showImageDialog(context, pdfImageUrl)
                        : Utils().showToast(
                            'File Format not supported ${pdfImageUrlFileExtension}',
                            Color(0xff941420),
                            Colors.white);
                // print(result.steelInvoices![0]);
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
      DataCell(Text(result.date ?? "")),
      //29
      DataCell(Text(result.time ?? "")),
      //30
      DataCell(RoundButton(onTap: (){

      },
      text: "Notes",
      color: Colors.blue,
      height: MediaQuery.sizeOf(context).height * 0.045,
      width: MediaQuery.sizeOf(context).width * 0.4,
      )),
      //31
      DataCell(Text(result.steelOrderNetVal ?? "")),
      //32
      DataCell(Text(result.steelDiscount ?? "")),
      //33
      DataCell(Text(result.saleBonus ?? "")),
      //34
      DataCell(Text("")),
      //35
      DataCell(Text(result.steelOrderSaleBonus.toString())),
      //36
      DataCell(Text(result.steelOrderAdminStaffBonus.toString())),
      //37
      DataCell(Text(result.steelSupplier ?? "")),
      //38
      DataCell(Text(result.steelSupplier ?? "")),
      //39
      DataCell(Text("${result.date} ${result.steelOrderStatusVal}")),
      //40
      DataCell(RoundButton(onTap: (){

      },
      text: "Order Complete - Archive File",
      color: Colors.blue,
      height: MediaQuery.sizeOf(context).height * 0.045,
      width: MediaQuery.sizeOf(context).width * 0.55,
      )),
    
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
      ))
    ]);
  }
}
