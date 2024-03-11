import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/ClosedEnquiries.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminClosedEnquiryTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdminClosedEnquiryTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AdminClosedEnquiryTable> createState() =>
      _AdminClosedEnquiryTableState();
}

class _AdminClosedEnquiryTableState extends State<AdminClosedEnquiryTable> {
  DateTime _dateTime = DateTime.now();
  String? prevValue;
  void _showDatePicker() {
    showDatePicker(
            context: context as BuildContext,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder(
      future: apiServices.getAdminClosedEnquiries(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<ClosedResponseOfEnquiries>? list = snapshot.data ?? [];

        // List<ClosedEnquiryModel> filteredList =
        //     Provider.of<ClosedEnquiriesSearchedData>(context).filteredDataModel;
        // List<ClosedEnquiryModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            child: PaginatedDataTable(
                rowsPerPage: (list.length >= 5 && list.isNotEmpty)
                    ? 5
                    : (list.isEmpty)
                        ? 1
                        : list.length,
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
                    'Company',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Telephone',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Product Type',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Priority',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Requirement',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Allocated To',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Address',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Source',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'File Upload',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Notes',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Create Quotation',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Close Enquiry',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Back To Enquiry',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                source: MyData(
                  list, context, widget.dealerId, widget.dealerName)),
          );
        });
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
  final List<ClosedResponseOfEnquiries>? dealerDataList;

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

    int currentIndex = 0;
    for (var dealerData in dealerDataList!) {
      for (var quote in dealerData.quotes) {
        // TextEditingController configuratorCode = TextEditingController();
        // configuratorCode.text = quote.enquiryConfCode ?? "";

        // TextEditingController facDeliveryWeek = TextEditingController();

TextEditingController configuratorCode = TextEditingController();
        configuratorCode.text = quote.enquiryConfCode ?? "";

        List<dynamic> fileUpload = quote.enquiryOrderConfFile ?? [];
    String fileUploadPath= fileUpload.isNotEmpty ? fileUpload.first : '';
    String fileuploadExtension= extension(fileUploadPath).toLowerCase();

    List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
    String enqFormFileUpload = enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
    String enqFormExtension= extension(enqFormFileUpload).toLowerCase();

   

    // List<dynamic> pdfImageUrl = quote.pDFImageURL ?? [];
    // String pdfImageUrlFilePath =
    //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    // String pdfImageUrlFileExtension =
    //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              DataCell(Text(quote.enquiryCustomerName ?? "")),
              DataCell(Text(quote.enquiryCompanyName ?? "")),
              
              DataCell(Text(quote.enquiryTelNum ?? "")),
              DataCell(Text(quote.enquiryType ?? "")),
              DataCell(Text(quote.enquiryPriorityLevel ?? "")),
              DataCell(Text(quote.enquiryRequirement ?? "")),
                            DataCell(Text(dealerData.displayName)),
              DataCell(Text(dealerData.dealerName)),
              DataCell(Text("${quote.customerAddress},${quote.customerAddress2},${quote.customerAddress3},${quote.customerAddress4}")),
              DataCell(Text(quote.enquiryCustomerEmail ?? "")),
              DataCell(Text(quote.enquirySource ?? "")),
              DataCell(
        quote.enquiryFileUpload!.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    // Create icons for each file
                    for (var file in quote.enquiryFileUpload!)
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
                          (enqFormExtension == '.jpg' ||
                                  enqFormExtension == '.jpeg' ||
                                  enqFormExtension == '.png')
                              ? Icons.file_open
                              : (enqFormExtension == '.pdf')
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
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
      ),

              DataCell(RoundButton(onTap: (){

              },
              text: "Notes",
              height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
              width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
              color: Colors.blue,
              )),
              DataCell(RoundButton(onTap: (){

              },
              text: "Create Quotation",
              height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
              width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.5,
              color: Colors.blue,
              )),
              DataCell(RoundButton(onTap: (){

              },
              text: "Close Enquiry",
              height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
              width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.5,
              color: Colors.blue,
              )),
              DataCell(RoundButton(onTap: (){

              },
              text: "Back To Enquiry",
              height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
              width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.5,
              color: Colors.blue,
              )),
              DataCell(Text(""))]);
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
      count += dealerData.quotes.length;
    }
    return count;
  }
}
