import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/ClosedEnquiries.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

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

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              showEmptyRows: false,
              columnSpacing: 20,
              headingRowHeight: 48,
              dataRowMaxHeight: 48,
              rowsPerPage: (list.length >= 5 && list.isNotEmpty)
                  ? 5
                  : (list.isEmpty)
                      ? 1
                      : list.length,
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Customer Name',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Company',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Telephone',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Product Type',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Priority',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Requirement',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Allocated To',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Address',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Email',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Source',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'File Upload',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Notes',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Create Quotation',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Close Enquiry',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Back To Enquiry',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Color(0xff941420)),
                )),
              ],
              source:
                  MyData(list, context, widget.dealerId, widget.dealerName));
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

  MyData(
    this.dealerDataList,
    this.myGlobalBuildContext,
    this.dealerId,
    this.dealerName,
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

        // List<dynamic> fileUpload = quote.enquiryOrderConfFile ?? [];
        // String fileUploadPath = fileUpload.isNotEmpty ? fileUpload.first : '';
        // String fileuploadExtension = extension(fileUploadPath).toLowerCase();

        List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
        String enqFormFileUpload =
            enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
        String enqFormExtension = extension(enqFormFileUpload).toLowerCase();

        // List<dynamic> pdfImageUrl = quote.pDFImageURL ?? [];
        // String pdfImageUrlFilePath =
        //     pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
        // String pdfImageUrlFileExtension =
        //     extension(pdfImageUrlFilePath).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
              color: MaterialStatePropertyAll(Colors.white),
              index: index,
              cells: [
                DataCell(Text(quote.enquiryCustomerName ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryCompanyName ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryTelNum ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryType ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryPriorityLevel ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryRequirement ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(dealerData.displayName,
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(dealerData.dealerName,
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(
                    "${quote.customerAddress},${quote.customerAddress2},${quote.customerAddress3},${quote.customerAddress4}",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquiryCustomerEmail ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(Text(quote.enquirySource ?? "",
                    style: TextStyle(fontSize: 12.5))),
                DataCell(
                  quote.enquiryFileUpload!.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Create icons for each file
                            for (var file in quote.enquiryFileUpload!)
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
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Notes",
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.16,
                  color: Colors.blue,
                )),
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Create Quotation",
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.23,
                  color: Colors.blue,
                )),
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Close Enquiry",
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.23,
                  color: Colors.blue,
                )),
                DataCell(RoundButton(
                  onTap: () {},
                  text: "Back To Enquiry",
                  width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.24,
                  color: Colors.blue,
                )),
                DataCell(Text(""))
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
      count += dealerData.quotes.length;
    }
    return count;
  }
}
