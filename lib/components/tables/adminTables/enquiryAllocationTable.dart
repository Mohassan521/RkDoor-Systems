import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminEnquiryModel.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/screens/Enquiries/editEnquiry.dart';
import 'package:price_link/screens/Enquiries/enquiryDetails.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class EnquiryAllocationTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const EnquiryAllocationTable(
      {super.key, this.dealerId, required this.dealerName, this.role});

  @override
  State<EnquiryAllocationTable> createState() => _EnquiryAllocationTableState();
}

class _EnquiryAllocationTableState extends State<EnquiryAllocationTable> {
  // String? _filePath;
  // String selectedValue = "";

  // List<String> enquiryStatus = [
  //   'VIEWED',
  //   'QUOTATION ISSUED',
  //   'REVISED QUOTATION ISSUED',
  //   '1ST FOLLOW UP MADE',
  //   '2ND FOLLOW UP MADE',
  //   'POTENTIAL ORDER',
  //   'ORDERED',
  //   'CLOSED'
  // ];

  // Future<void> _pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();

  //     if (result != null) {
  //       setState(() {
  //         _filePath = result.files.single.path;
  //       });
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error picking file: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder(
      future: apiServices.getAdminPanelEnquiries(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompleteResponseOfEnquiries>? list = snapshot.data!;

        // List<EnquiriesModel> filteredList =
        //     Provider.of<AllEnquiriesSearchedData>(context).filteredDataModel;
        // List<EnquiriesModel>? displayData =
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
                    'Enquiry Allocated To',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Original Enquiry Allocation',
                    style: TextStyle(color: Colors.white),
                  )),
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
                    '',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Tel Number',
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
                    'Supply Type',
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
                    'Post Code',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Source',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Configurator Code or RK Steel Quote No',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'File Upload',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'File Upload (From Enquiry Form)',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Record',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Create Quotation',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Quotation Number',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Close Enquiry',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Date',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Time',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Hot Leads',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Allocation',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                source: MyData(list, context)),
          );
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<CompleteResponseOfEnquiries> dealerDataList;
  final BuildContext context;

  MyData(this.dealerDataList, this.context);


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
    for (var dealerData in dealerDataList) {
      for (var quote in dealerData.quotes) {
        
        TextEditingController configuratorCode = TextEditingController();
        configuratorCode.text = quote.enquiryConfCode ?? "";

        List<dynamic> fileUpload = quote.enquiryOrderConfFile ?? [];
    String fileUploadPath= fileUpload.isNotEmpty ? fileUpload.first : '';
    String fileuploadExtension= extension(fileUploadPath).toLowerCase();

    List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
    String enqFormFileUpload = enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
    String enqFormExtension= extension(enqFormFileUpload).toLowerCase();

    var enqAllocatedTo;

        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              DataCell(Text(dealerData.displayName)),
              DataCell(Text(dealerData.dealerName)),
              DataCell(Text(quote.enquiryCustomerName ?? "")),
              DataCell(Text(quote.enquiryCompanyName ?? "")),
              DataCell(Text("")),
            //   DataCell((quote != "")
            // ? Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5.5),
            //       color: Color(0xffff0000),
            //     ),
            //     height: MediaQuery.sizeOf(context).height * 0.04,
            //     child: Center(
            //         child: Text(
            //       result.newSymbol!,
            //       style: TextStyle(color: Colors.white),
            //     )))
            // : Text("")),
              DataCell(Text(quote.enquiryTelNum ?? "")),
              DataCell(Text(quote.enquiryType ?? "")),
              DataCell(Text(quote.enquiryPriorityLevel ?? "")),
              DataCell(Text(quote.enquiryRequirement ?? "")),
              DataCell(Text(quote.enquirySupplyType ?? "")),
              DataCell(Text(dealerData.dealerName)),
              DataCell(Text("${quote.customerAddress},${quote.customerAddress2},${quote.customerAddress3},${quote.customerAddress4}")),
              DataCell(Text(quote.enquiryCustomerEmail ?? "")),
              DataCell(Text(quote.deliveryPostCodeC13 ?? "")),
              DataCell(Text(quote.enquirySource ?? "")),
              DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: configuratorCode,
            onChanged: (value) {
              // Timer(Duration(seconds: 5), () {
              //   apiServices.factoryDeliveryWeekSteelOrder(
              //       dealerId, value, result.id!);
              // });
            },
          ))),
                DataCell(
        quote.enquiryOrderConfFile!.isNotEmpty
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
                    for (var file in quote.enquiryOrderConfFile!)
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
                          (fileuploadExtension == '.jpg' ||
                                  fileuploadExtension == '.jpeg' ||
                                  fileuploadExtension == '.png')
                              ? Icons.file_open
                              : (fileuploadExtension == '.pdf')
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
              text: "Enquiry Record",
              color: Colors.blue,
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.4,
              )),
              DataCell(RoundButton(onTap: (){

              },
              text: "Create Quotation",
              color: Colors.blue,
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.4,
              )),
              DataCell(Text(quote.quotationNumberForEnquiry ?? "")),
              DataCell(RoundButton(onTap: (){

              },
              text: "Close Enquiry",
              color: Colors.blue,
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.4,
              )),
              DataCell(Text(quote.date ?? "")),
              DataCell(Text(quote.time ?? "")),
              DataCell(RoundButton(onTap: (){

              },
              text: "Hot Leads",
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.4,
              color: Colors.blue,
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

              DataCell(Row(
        children: [
          Icon(Icons.edit, size: 14,),
          Icon(Icons.copy, size: 14,),
          Icon(Icons.delete, color: Colors.red,size: 14,),
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
    for (var dealerData in dealerDataList) {
      count += dealerData.quotes.length;
    }
    return count;
  }
}
