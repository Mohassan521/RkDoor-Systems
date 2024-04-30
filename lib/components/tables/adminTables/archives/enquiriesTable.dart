import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminEnquiryModel.dart';
import 'package:price_link/models/admin%20models/archiveEnquiries.dart';
import 'package:price_link/screens/adminScreens/archiveEnquiries.dart';
import 'package:price_link/screens/adminScreens/enquiryEdit.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class ArchiveEnquiriesTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const ArchiveEnquiriesTable(
      {super.key, this.dealerId, required this.dealerName, this.role});

  @override
  State<ArchiveEnquiriesTable> createState() => _ArchiveEnquiriesTableState();
}

class _ArchiveEnquiriesTableState extends State<ArchiveEnquiriesTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder(
      future: apiServices.getArchiveEnquiries(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<ArchiveEnquiriesModel> archives = snapshot.data ?? [];

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
            rowsPerPage: archives.length > 5 ? 5 : archives.length,
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
            source: MyData(archives, context, dealerId: widget.dealerId!));
      },
    );
  }
}

class MyData extends DataTableSource {
  final String dealerId;
  final List<ArchiveEnquiriesModel> archives;
  final BuildContext context;

  MyData(this.archives, this.context, {required this.dealerId});

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

    TextEditingController confCode = TextEditingController();

    confCode.text = archives[index].enquiryConfCode ?? "";
    return DataRow.byIndex(
      color: MaterialStatePropertyAll(Colors.white),
      index: index,
      cells: [
        DataCell(Text(
          archives[index].enquiryAllocatedTo ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        DataCell(Text(archives[index].enquiryCusName ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryCompanyName ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text("")),
        DataCell(RoundButton(
          onTap: () {},
          text: "Enquiry Details",
          width: MediaQuery.sizeOf(context).width * 0.20,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(Text(archives[index].enquiryTelNum ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryType ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryPriorityLevel ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryRequirement ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquirySupplyType ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryDealer ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(
            "${archives[index].customerAddress},${archives[index].customerAddress2},${archives[index].customerAddress3},${archives[index].customerAddress4}",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquiryCusEmail ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].dileveryPostCodeC13 ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(archives[index].enquirySource ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
              controller: confCode,
              onChanged: (value) {
                // value = configuratorCode.text;
                // NetworkApiServices().setEnquiryConfigCode(
                //     archives[index].id!, value, dealerData.userId);
              },
            ))),
        DataCell(Text(archives[index].quotationNumberForEnquiry ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(archives[index].date ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(archives[index].time ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(RoundButton(
          onTap: () {
            NetworkApiServices().hotLeadsOrder(
                dealerId,
                archives[index].enquiryType,
                archives[index].enquiryDealer,
                archives[index].enquiryEntered,
                archives[index].enquiryEntered,
                archives[index].enquiryCusName,
                archives[index].enquiryCompanyName,
                archives[index].enquirySupplyType,
                archives[index].customerAddress,
                archives[index].customerAddress2,
                archives[index].customerAddress3,
                archives[index].customerAddress4,
                archives[index].dileveryPostCodeC13,
                archives[index].enquiryCusEmail,
                archives[index].enquiryTelNum,
                archives[index].enquiryPriorityLevel,
                archives[index].enquiryNotes,
                archives[index].enquirySource,
                archives[index].enquiryAllocatedTo);
          },
          text: "Hot Leads",
          width: MediaQuery.sizeOf(context).width * 0.18,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(Text(archives[index].enquiryEntered ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(RoundButton(
          onTap: () {
            NetworkApiServices().closeEnquiry(dealerId, archives[index].id!);
          },
          text: "Close Enquiry",
          width: MediaQuery.sizeOf(context).width * 0.22,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (archives[index].enqDateOfClosure != null)
                    ? archives[index].enqDateOfClosure!
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
                (archives[index].enqDateOfIssue != null)
                    ? archives[index].enqDateOfIssue!
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
                                          archives[index].userId.toString(),
                                          archives[index].id!);
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRowCount;

  @override
  int get selectedRowCount => 0;

  int get totalRowCount => archives.length;
}
