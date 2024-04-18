import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminHotleads.dart';
import 'package:price_link/screens/adminScreens/enquiryRecord.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

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
                  'Enquiry Allocated To',
                  style: TextStyle(color: Color(0xff941420)),
                )),
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
                  '',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Tel Number',
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
                  'Supply Type',
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
                  'Post Code',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Source',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Configurator Code',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'File Upload',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'File Upload (From Enquiry Form)',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Record',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Create Quotation',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Number',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Close Enquiry',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Date',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Edit',
                  style: TextStyle(color: Color(0xff941420)),
                )),
              ],
              source: MyData(list, _dateTime, widget.dealerId,
                  widget.dealerName, _showDatePicker,
                  context: context));
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
            color: MaterialStatePropertyAll(Colors.white),
            cells: [
              DataCell(Text(
                quote.enquiryAllocatedTo ?? "",
                style: TextStyle(fontSize: 12.5),
              )),
              DataCell(Text(quote.enquiryCusName ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryCompanyName ?? "",
                  style: TextStyle(fontSize: 12.5))),
              //DataCell(Text("")),
              DataCell((quote != "")
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Color(0xffff0000),
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Center(
                          child: Text(
                        quote.newSymbol!,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )))
                  : Text("")),
              DataCell(Text(quote.enquiryTelNum ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryType ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryPriorityLevel ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryRequirement ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquirySupplyType ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(dealerData.dealerName,
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(
                  "${quote.customerAddress},${quote.customerAddress2},${quote.customerAddress3},${quote.customerAddress4}",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryCusEmail ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.dileveryPostCodeC13 ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquirySource ?? "",
                  style: TextStyle(fontSize: 12.5))),
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
                            SizedBox(width: 10),
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnquiryRecordForAdmin(
                                enquiries: quote,
                              )));
                },
                text: "Enquiry Record",
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: MediaQuery.sizeOf(context).height * 0.05,
                color: Colors.blue,
              )),
              DataCell(RoundButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalculatorWebView(
                                url:
                                    'https://www.pricelink.net/rk-door-calulator-by-admin/?user_id=${dealerData.userId}&method=enquiryorder&cus_name=${quote.enquiryCusName}&add1=${quote.customerAddress}&add2=${quote.customerAddress2}&add3=${quote.customerAddress3}&add4=${quote.customerAddress4}&quote_id=${quote.id}&postcode=${quote.dileveryPostCodeC13}&supplyType=${quote.enquirySupplyType}&telno=${quote.enquiryTelNum}&email=${quote.enquiryCusEmail}&allocatedto=${quote.enquiryAllocatedTo}&mobile_token=true',
                                dealerId: dealerId!,
                              )));
                },
                text: "Create Quotation",
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: MediaQuery.sizeOf(context).height * 0.05,
                color: Colors.blue,
              )),
              DataCell(Text(quote.quotationNumberForEnquiry ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(RoundButton(
                onTap: () {
                  NetworkApiServices()
                      .closeEnquiry(dealerData.userId.toString(), quote.id!);
                },
                text: "Close Enquiry",
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: MediaQuery.sizeOf(context).height * 0.05,
                color: Colors.blue,
              )),
              DataCell(
                  Text(quote.date ?? "", style: TextStyle(fontSize: 12.5))),
              DataCell(
                  Text(quote.time ?? "", style: TextStyle(fontSize: 12.5))),

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
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Icon(Icons.warning),
                              content: Text(
                                  'Are u sure you want to delete this enquiry'),
                              actions: [
                                Center(
                                  child: Column(
                                    children: [
                                      RoundButton(
                                        text: 'Delete',
                                        onTap: () {
                                          NetworkApiServices().deleteEnquiry(
                                              dealerData.userId.toString(),
                                              quote.id!);
                                          Navigator.pop(context);
                                        },
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      RoundButton(
                                        text: 'Cancel',
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 14,
                    ),
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
