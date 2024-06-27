import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminEnquiryModel.dart';
import 'package:price_link/screens/adminScreens/enquiryEdit.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class AdminSwindonSBCTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdminSwindonSBCTable(
      {super.key, this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminSwindonSBCTable> createState() => _AdminSwindonSBCTableState();
}

class _AdminSwindonSBCTableState extends State<AdminSwindonSBCTable> {
  NetworkApiServices apiServices = NetworkApiServices();
  String searchInput = '';
  late Future<List<CompleteResponseOfEnquiries>> futureEnquiries;

  @override
  void initState() {
    super.initState();
    futureEnquiries = apiServices.getAdminPanelEnquiries();
  }

  void searchEnquiries(String query) {
    setState(() {
      searchInput = query;
      futureEnquiries = apiServices.getAdminPanelEnquiries(searchQuery: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: TextFormField(
              onChanged: (value) {
                searchEnquiries(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                hintText: 'Search by Enq Allocated To or Email',
              ),
            )),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: apiServices.getAdminPanelEnquiries(searchQuery: searchInput),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: [
                  PaginatedDataTable(
                    showEmptyRows: false,
                    columnSpacing: 20,
                    headingRowHeight: 48,
                    dataRowMaxHeight: 48,
                    rowsPerPage: 5,
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
                        'Enquiry Status',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                          label: Text(
                        'Enquiry Details',
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
                        'Configurator Code or RK Steel Quote No',
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
                        'Quotation Number',
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
                        'Hot Leads',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                          label: Text(
                        'Enquiry Entered By',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                          label: Text(
                        'Close Enquiry',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                          label: Text(
                        'Date of Closure',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                          label: Text(
                        'Date of Issue',
                        style: TextStyle(color: Color(0xff941420)),
                      )),
                      DataColumn(
                        label: Text(
                          'Edit',
                          style: TextStyle(color: Color(0xff941420)),
                        ),
                      ),
                    ],
                    source: MyData([], context, dealerId: widget.dealerId!),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 55),
                        Text('Getting your desired result'),
                      ],
                    ),
                  ),
                ],
              );
            }

            var dealerDataList = snapshot.data ?? [];

            // List<CompleteResponseOfEnquiries> filteredList =
            //     Provider.of<AllEnquiriesSearchedDataForAdmin>(context)
            //         .filteredDataModel;
            // List<CompleteResponseOfEnquiries> displayData =
            //     filteredList.isNotEmpty ? filteredList : dealerDataList;

            return PaginatedDataTable(
                showEmptyRows: false,
                columnSpacing: 20,
                headingRowHeight: 48,
                dataRowMaxHeight: 48,
                rowsPerPage: 5,
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
                    'Enquiry Status',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Details',
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
                    'Configurator Code or RK Steel Quote No',
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
                    'Quotation Number',
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
                    'Hot Leads',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Enquiry Entered By',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Close Enquiry',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Date of Closure',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Date of Issue',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Edit',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                ],
                source: MyData(dealerDataList, context,
                    dealerId: widget.dealerId!));
          },
        ),
      ],
    );
  }
}

class MyData extends DataTableSource {
  final String dealerId;
  final List<CompleteResponseOfEnquiries> dealerDataList;
  final BuildContext context;

  MyData(this.dealerDataList, this.context, {required this.dealerId});

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
        String fileUploadPath = fileUpload.isNotEmpty ? fileUpload.first : '';
        String fileuploadExtension = extension(fileUploadPath).toLowerCase();

        List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
        String enqFormFileUpload =
            enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
        String enqFormExtension = extension(enqFormFileUpload).toLowerCase();

        List<AdminEnquiryModel> getFilteredQuotes() {
          List<AdminEnquiryModel> filteredQuotes = [];
          for (var dealerData in dealerDataList) {
            for (var quote in dealerData.quotes) {
              if (quote.enquirySource == "Swindon SBC") {
                filteredQuotes.add(quote);
              }
            }
          }
          return filteredQuotes;
        }

        if (currentIndex == index) {
          var filteredOrders = getFilteredQuotes();

          var quote = filteredOrders[index];
          return DataRow.byIndex(
            index: index,
            color: MaterialStatePropertyAll(Colors.white),
            cells: [
              DataCell(Text(dealerData.displayName,
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryCustomerName ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.enquiryCompanyName ?? "",
                  style: TextStyle(fontSize: 12.5))),
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
              DataCell(RoundButton(
                onTap: () {},
                text: "Enquiry Details",
                width: MediaQuery.sizeOf(context).width * 0.20,
                color: Colors.blue,
              )),
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
              DataCell(Text(quote.enquiryCustomerEmail ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(Text(quote.deliveryPostCodeC13 ?? "",
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
                      value = configuratorCode.text;
                      NetworkApiServices().setEnquiryConfigCode(
                          quote.id!, value, dealerData.userId);
                    },
                  ))),
              DataCell(
                quote.enquiryOrderConfFile!.isNotEmpty
                    ? Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                getImage().then((value) {
                                  NetworkApiServices().setEnquiryOrderConfFile(
                                      quote.id!, dealerData.userId, value);
                                });
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
                                getImage().then((value) {
                                  NetworkApiServices().setEnquiryOrderConfFile(
                                      quote.id!, dealerData.userId, value);
                                });
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

              DataCell(Text(quote.quotationNumberForEnquiry ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(
                  Text(quote.date ?? "", style: TextStyle(fontSize: 12.5))),
              DataCell(
                  Text(quote.time ?? "", style: TextStyle(fontSize: 12.5))),
              DataCell(RoundButton(
                onTap: () {
                  NetworkApiServices().hotLeadsOrder(
                      dealerId,
                      quote.enquiryType,
                      dealerData.dealerName,
                      quote.enquiryEntered,
                      quote.enquiryEntered,
                      quote.enquiryCustomerName,
                      quote.enquiryCompanyName,
                      quote.enquirySupplyType,
                      quote.customerAddress,
                      quote.customerAddress2,
                      quote.customerAddress3,
                      quote.customerAddress4,
                      quote.deliveryPostCodeC13,
                      quote.enquiryCustomerEmail,
                      quote.enquiryTelNum,
                      quote.enquiryPriorityLevel,
                      quote.enquiryNotes,
                      quote.enquirySource,
                      quote.enquiryAllocatedTo);
                },
                text: "Hot Leads",
                width: MediaQuery.sizeOf(context).width * 0.18,
                color: Colors.blue,
              )),
              DataCell(Text(quote.enquiryEntered ?? "",
                  style: TextStyle(fontSize: 12.5))),
              DataCell(RoundButton(
                onTap: () {
                  NetworkApiServices().closeEnquiry(dealerId, quote.id!);
                },
                text: "Close Enquiry",
                width: MediaQuery.sizeOf(context).width * 0.20,
                color: Colors.blue,
              )),
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (quote.dateOfClosure != null)
                          ? quote.dateOfClosure!
                          : "mm/dd/yyyy",
                      style: TextStyle(fontSize: 12.5),
                    ),
                    //Text(""),
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
              ),
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (quote.dateOfIssue != null)
                          ? quote.dateOfIssue!
                          : "mm/dd/yyyy",
                      style: TextStyle(fontSize: 12.5),
                    ),
                    //Text(""),
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
              ),
              DataCell(Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminEnquiryEditForm(
                                    dealerId: dealerData.userId.toString(),
                                    dealerName: dealerData.dealerName,
                                    enquiries: quote)));
                      },
                      child: Icon(
                        Icons.edit,
                        size: 14,
                      )),
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
                      )),
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
      for (var quote in dealerData.quotes) {
        if (quote.enquirySource == 'Swindon SBC') {
          count++;
        }
      }
    }
    return count;
  }
}
