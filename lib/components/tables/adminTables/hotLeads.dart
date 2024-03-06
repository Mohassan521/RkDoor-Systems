import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/models/admin%20models/adminHotleads.dart';
import 'package:price_link/models/hotLeadsModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/Enquiries/hotLeadsEdit.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHotLeads extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const AdminHotLeads({super.key, this.dealerId, this.dealerName});

  @override
  State<AdminHotLeads> createState() => _AdminHotLeadsState();
}

class _AdminHotLeadsState extends State<AdminHotLeads> {
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
      future: apiServices.getHotLeadsForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Admin Hot Leads Data is being loaded...'));
        }

        List<CompleteResponseOfHotLeads> list = snapshot.data ?? [];
        //print("admin hot leads data: $list ");

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
                      label: Expanded(
                    child: Text(
                      'Enquiry Allocated To',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Customer Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Company',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      '',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Tel Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Product Type',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Priority',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Requirement',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Supply Type',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Dealer',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Address',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Post Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Enquiry Source',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Configurator Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'File Upload',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'File Upload (From Enquiry Form)',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Enquiry Record',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Create Quotation',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Quotation Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Close Enquiry',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Enquiry Date',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  DataColumn(
                      label: Expanded(
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ],
                source: MyData(list, _dateTime, widget.dealerId,
                    widget.dealerName, _showDatePicker,
                    context: context)),
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
  DateTime _datetime = DateTime.now();
  //final String? prevNotesValue;
  void Function()? _showDatePicker;
  final BuildContext context;
  TextEditingController orderNotesController = TextEditingController();
  final List<CompleteResponseOfHotLeads> dealerDataList;

  MyData(this.dealerDataList, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.context});

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
      for (var quote in dealerData.hotleads) {
        TextEditingController configuratorCode = TextEditingController();
        configuratorCode.text = quote.enquiryConfCode ?? "";

        List<dynamic> fileUpload = quote.enquiryOrderConfFile ?? [];
        String fileUploadPath = fileUpload.isNotEmpty ? fileUpload.first : '';
        String fileuploadExtension = extension(fileUploadPath).toLowerCase();

        List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
        String enqFormFileUpload =
            enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
        String enqFormExtension = extension(enqFormFileUpload).toLowerCase();

        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              DataCell(Text(quote.enquiryAllocatedTo ?? "")),
              DataCell(Text(quote.enquiryCusName ?? "")),
              DataCell(Text(quote.enquiryCompanyName ?? "")),
              //DataCell(Text("")),
              DataCell((quote != "")
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Color(0xffff0000),
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Center(
                          child: Text(
                        quote.newSymbol!,
                        style: TextStyle(color: Colors.white),
                      )))
                  : Text("")),
              DataCell(Text(quote.enquiryTelNum ?? "")),
              DataCell(Text(quote.enquiryType ?? "")),
              DataCell(Text(quote.enquiryPriorityLevel ?? "")),
              DataCell(Text(quote.enquiryRequirement ?? "")),
              DataCell(Text(quote.enquirySupplyType ?? "")),
              DataCell(Text(dealerData.dealerName)),
              DataCell(Text(
                  "${quote.customerAddress},${quote.customerAddress2},${quote.customerAddress3},${quote.customerAddress4}")),
              DataCell(Text(quote.enquiryCusEmail ?? "")),
              DataCell(Text(quote.dileveryPostCodeC13 ?? "")),
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
                                  String fileExtension =
                                      extension(file).toLowerCase();
                                  if (fileExtension == ".pdf") {
                                    print(file);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFViewer(url: file),
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
                                  String fileExtension =
                                      extension(file).toLowerCase();
                                  if (fileExtension == ".pdf") {
                                    print(file);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFViewer(url: file),
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

              DataCell(RoundButton(
                onTap: () {},
                text: "Enquiry Record",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(RoundButton(
                onTap: () {},
                text: "Create Quotation",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(Text(quote.quotationNumberForEnquiry ?? "")),
              DataCell(RoundButton(
                onTap: () {},
                text: "Close Enquiry",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(Text(quote.date ?? "")),
              DataCell(Text(quote.time ?? "")),

              DataCell(Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 14,
                  ),
                  Icon(
                    Icons.copy,
                    size: 14,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 14,
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
    for (var dealerData in dealerDataList) {
      count += dealerData.hotleads.length;
    }
    return count;
  }
}
