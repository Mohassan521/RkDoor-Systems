import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/screens/Enquiries/editEnquiry.dart';
import 'package:price_link/screens/Enquiries/enquiryDetails.dart';
import 'package:price_link/services/services.dart';

class SwindonSBCTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const SwindonSBCTable({super.key, this.dealerId, required this.dealerName});

  @override
  State<SwindonSBCTable> createState() => _SwindonSBCTableState();
}

class _SwindonSBCTableState extends State<SwindonSBCTable> {
  String searchInput = "";

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

    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchInput = value;
                });
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
                hintText: 'Search by Customer Name',
              ),
            )),
        SizedBox(
          height: 20,
        ),
        FutureBuilder<List<EnquiriesModel>>(
          future: apiServices.getAllEnquiries(widget.dealerId!,
              searchQuery: searchInput),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return PaginatedDataTable(
                  columnSpacing: 20,
                  headingRowHeight: 48,
                  dataRowMaxHeight: 48,
                  rowsPerPage: 1,
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
                      'Notes',
                      style: TextStyle(color: Color(0xff941420)),
                    )),
                    DataColumn(
                        label: Text(
                      'Close Enquiry',
                      style: TextStyle(color: Color(0xff941420)),
                    )),
                    DataColumn(
                        label: Text(
                      'Edit',
                      style: TextStyle(color: Color(0xff941420)),
                    )),
                  ],
                  source: MyData(
                      swindonSBCList: [],
                      dealer_id: widget.dealerId!,
                      dealer_name: widget.dealerName!,
                      context: context));
            }

            List<EnquiriesModel>? list = snapshot.data ?? [];
            List<EnquiriesModel>? swindonSBCList = list
                .where((result) => result.enquirySource == "Swindon SBC")
                .toList();

            return PaginatedDataTable(
                columnSpacing: 20,
                headingRowHeight: 48,
                dataRowMaxHeight: 48,
                rowsPerPage:
                    (swindonSBCList.length >= 5 && swindonSBCList.isNotEmpty)
                        ? 5
                        : (swindonSBCList.isEmpty)
                            ? 1
                            : swindonSBCList.length,
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
                    'Notes',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Close Enquiry',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Edit',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                ],
                source: MyData(
                    swindonSBCList: swindonSBCList,
                    dealer_id: widget.dealerId!,
                    dealer_name: widget.dealerName!,
                    context: context));
          },
        ),
      ],
    );
  }
}

class MyData extends DataTableSource {
  final String dealer_id;
  final String dealer_name;
  List<EnquiriesModel> swindonSBCList;
  final BuildContext context;

  MyData(
      {required this.swindonSBCList,
      required this.dealer_id,
      required this.dealer_name,
      required this.context});

  @override
  int get rowCount => swindonSBCList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final EnquiriesModel result = swindonSBCList[index];
    return DataRow.byIndex(
      color: MaterialStatePropertyAll(Colors.white),
      index: index,
      cells: <DataCell>[
        DataCell(Text(
          result.enquiryAllocatedTo ?? '',
          style: TextStyle(fontSize: 12.5),
        )),
        DataCell(Text(result.enquiryCusName ?? '',
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.enquiryCompanyName ?? '',
            style: TextStyle(fontSize: 12.5))),
        DataCell((result.newSymbol != "")
            ? Container(
                width: MediaQuery.sizeOf(context).height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.5),
                  color: Color(0xffff0000),
                ),
                height: MediaQuery.sizeOf(context).height * 0.04,
                child: Center(
                    child: Text(
                  result.newSymbol!,
                  style: TextStyle(color: Colors.white),
                )))
            : Text("")),
        DataCell(RoundButton(
          text: 'Enquiry Details',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnquiryDetails(
                          dealerId: dealer_id,
                          dealerName: dealer_name,
                          enquiries: result,
                        )));
          },
          color: Colors.blue,
          width: MediaQuery.sizeOf(context).width * 0.18,
          height: MediaQuery.sizeOf(context).height * 0.05,
        )),
        DataCell(
            Text(result.enquiryType ?? '', style: TextStyle(fontSize: 12.5))),
        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.enquiryPriorityLevel == "LOW"
                      ? Color(0xffffc0cb)
                      : result.enquiryPriorityLevel == "MEDIUM"
                          ? Color(0xffffa500)
                          : Color(0xffff0000),
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.24,
              child: Center(
                  child: Text(
                result.enquiryPriorityLevel ?? '',
                style: TextStyle(color: Colors.black, fontSize: 12.5),
              )));
        })),
        DataCell(Text(result.enquiryRequirement ?? '',
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.enquirySupplyType ?? '',
            style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(result.enquiryDealer ?? '', style: TextStyle(fontSize: 12.5))),
        DataCell(Text(
            '${result.customerAddress ?? ""}, ${result.customerAddress2 ?? ''}, ${result.customerAddress3 ?? ''}, ${result.customerAddress4 ?? ''}',
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.dileveryPostCodeC13 ?? '',
            style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(result.enquirySource ?? '', style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.enquiryConfCode ?? '',
            style: TextStyle(fontSize: 12.5))),
        // DataCell(Text(
        //     result.enquiryFileUpload!.map((e) => e.toString()).join(', '))),
        //DataCell(Text('')),
        DataCell(Center(
            child: Text(result.quotationNumberForEnquiry ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5)))),
        //DataCell(Text('')),
        DataCell(Text(result.date ?? '', style: TextStyle(fontSize: 12.5))),
        DataCell(Text(result.time ?? '', style: TextStyle(fontSize: 12.5))),
        DataCell(RoundButton(
          text: 'Hot Leads',
          onTap: () {
            NetworkApiServices().hotLeadsOrder(
                dealer_id,
                result.enquiryType,
                dealer_name,
                result.enquiryEntered,
                result.enquiryRequirement,
                result.enquiryCusName,
                result.enquiryCompanyName,
                result.enquirySupplyType,
                result.customerAddress,
                result.customerAddress2,
                result.customerAddress3,
                result.customerAddress4,
                result.dileveryPostCodeC13,
                result.enquiryCusEmail,
                result.enquiryTelNum,
                result.enquiryPriorityLevel,
                result.enquiryNotes,
                result.enquirySource,
                result.enquiryAllocatedTo);
          },
          color: Colors.blue,
          width: MediaQuery.sizeOf(context).width * 0.18,
          height: MediaQuery.sizeOf(context).height * 0.05,
        )),
        DataCell(Center(
            child: Text(result.enquiryEntered ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.5)))),
        DataCell(RoundButton(
          text: 'Close Enquiry',
          onTap: () {
            NetworkApiServices().closeEnquiry(dealer_id, result.id!);
          },
          color: Colors.blue,
          width: MediaQuery.sizeOf(context).width * 0.19,
          height: MediaQuery.sizeOf(context).height * 0.05,
        )),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditFormPage(
                              dealerId: dealer_id,
                              dealerName: dealer_name,
                              enquiriesModel: result,
                            )));
              },
              icon: Icon(Icons.edit),
              iconSize: 14,
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Icon(Icons.warning),
                        content:
                            Text('Are u sure you want to delete this Enquiry'),
                        actions: [
                          Center(
                            child: Column(
                              children: [
                                RoundButton(
                                  text: 'Delete',
                                  onTap: () {
                                    NetworkApiServices()
                                        .deleteEnquiry(dealer_id, result.id!);
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
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 14,
            ),
          ],
        )),
      ],
    );
  }
}
