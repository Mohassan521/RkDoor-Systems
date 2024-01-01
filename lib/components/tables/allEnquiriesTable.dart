import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/screens/Enquiries/editEnquiry.dart';
import 'package:price_link/screens/Enquiries/enquiryDetails.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AllEnquiriesTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const AllEnquiriesTable({super.key, this.dealerId, required this.dealerName});

  @override
  State<AllEnquiriesTable> createState() => _AllEnquiriesTableState();
}

class _AllEnquiriesTableState extends State<AllEnquiriesTable> {
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

    return FutureBuilder<List<EnquiriesModel>>(
      future: apiServices.getAllEnquiries(widget.dealerId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<EnquiriesModel>? list = snapshot.data!;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
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
                  'Enquiry Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Details',
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
                // DataColumn(
                //     label: Text(
                //   'File Upload',
                //   style: TextStyle(color: Colors.white),
                // )),
                // DataColumn(
                //     label: Text(
                //   'File Upload (From Enquiry Form)',
                //   style: TextStyle(color: Colors.white),
                // )),
                DataColumn(
                    label: Text(
                  'Quotation Number',
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
                  'Enquiry Entered By',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Close Enquiry',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source:
                  MyData(list, context, widget.dealerId!, widget.dealerName!));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final String dealer_id;
  final String dealer_name;
  BuildContext context;
  final List<EnquiriesModel> data;

  MyData(this.data, this.context, this.dealer_id, this.dealer_name);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  EnquiriesModel table = EnquiriesModel();

  @override
  DataRow getRow(int index) {
    final EnquiriesModel result = data[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.enquiryAllocatedTo ?? '')),
        DataCell(Text(result.enquiryCusName ?? '')),
        DataCell(Text(result.enquiryCompanyName ?? '')),
        DataCell((result.newSymbol != "")
            ? Container(
                color: Colors.red,
                height: MediaQuery.sizeOf(context).height * 0.04,
                child: Center(child: Text(result.newSymbol!)))
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
        )),
        DataCell(Text(result.enquiryType ?? '')),
        DataCell(Builder(builder: (context) {
          return Container(
              color: Colors.orange,
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.22,
              child: Center(child: Text(result.enquiryPriorityLevel ?? '')));
        })),
        DataCell(Text(result.enquiryRequirement ?? '')),
        DataCell(Text(result.enquirySupplyType ?? '')),
        DataCell(Text(result.enquiryDealer ?? '')),
        DataCell(Text(
            '${result.customerAddress}, ${result.customerAddress2 ?? ''}, ${result.customerAddress3 ?? ''}, ${result.customerAddress4 ?? ''}')),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        DataCell(Text(result.enquirySource ?? '')),
        DataCell(Text(result.enquiryConfCode ?? '')),
        // DataCell(Text(
        //     result.enquiryFileUpload!.map((e) => e.toString()).join(', '))),
        //DataCell(Text('')),
        DataCell(Text(result.quotationNumberForEnquiry ?? "")),
        //DataCell(Text('')),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(RoundButton(
          text: 'Hot Leads',
          onTap: () {},
          color: Colors.blue,
        )),
        DataCell(Text(result.enquiryEntered ?? '')),
        DataCell(RoundButton(
          text: 'Close Enquiry',
          onTap: () {},
          color: Colors.blue,
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
              iconSize: 16,
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
              iconSize: 16,
            ),
          ],
        )),
      ],
    );
  }
}
