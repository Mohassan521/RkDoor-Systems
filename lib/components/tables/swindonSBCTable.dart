import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class SwindonSBCTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const SwindonSBCTable({super.key, this.dealerId, required this.dealerName});

  @override
  State<SwindonSBCTable> createState() => _SwindonSBCTableState();
}

class _SwindonSBCTableState extends State<SwindonSBCTable> {
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
        List<EnquiriesModel>? swindonSBCList = list
            .where((result) => result.enquirySource == "Swindon SBC")
            .toList();

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              rowsPerPage:
                  (swindonSBCList.length >= 5 && swindonSBCList.isNotEmpty)
                      ? 5
                      : (swindonSBCList.isEmpty)
                          ? 1
                          : swindonSBCList.length,
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
                  'Configurator Code',
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
                  'Notes',
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
              source: MyData(list, swindonSBCList: swindonSBCList));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  List<EnquiriesModel> swindonSBCList;
  final List<EnquiriesModel> data;

  MyData(this.data, {required this.swindonSBCList});

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
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.enquiryAllocatedTo ?? '')),
        DataCell(Text(result.enquiryCusName ?? '')),
        DataCell(Text(result.enquiryCompanyName ?? '')),
        DataCell(Center(child: Text(result.enquiryTelNum ?? ''))),
        DataCell(Text(result.enquiryType ?? "")),
        DataCell(Text(result.enquiryPriorityLevel ?? '')),
        DataCell(Text(result.enquiryRequirement ?? "")),
        DataCell(Text(result.enquirySupplyType ?? '')),
        DataCell(Text(result.enquiryDealer ?? '')),
        DataCell(Center(
          child: Text(
              '${result.customerAddress}, ${result.customerAddress2 ?? ''}, ${result.customerAddress3 ?? ''}, ${result.customerAddress4 ?? ''}'),
        )),
        DataCell(Text(result.enquiryCusEmail ?? '')),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        DataCell(Text(result.enquirySource ?? '')),
        DataCell(Text(result.enquiryConfCode ?? '')),
        // DataCell(Text('')),
        //DataCell(Text('')),
        DataCell(Text('')),
        // DataCell(Text(
        //     result.enquiryFileUpload!.map((e) => e.toString()).join(', '))),
        DataCell(
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (result.enquiryFileUpload!.isNotEmpty)
                  Column(
                    children: [
                      Icon(
                        Icons.file_present,
                        size: 25,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      )
                    ],
                  ),
                if (result.enquiryFileUpload!.isEmpty)
                  Text(""), // Or any other text for empty state
              ],
            ),
          ),
        ),
        //DataCell(Text('')),
        DataCell(Text(result.quotationNumberForEnquiry ?? '')),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(Text(result.enquiryNotes ?? '')),
        // DataCell(Text(result.enquiryEntered ?? '')),
        // DataCell(Text(result.enquiryEntered ?? '')),
        DataCell(RoundButton(
          text: 'Close Enquiry',
          onTap: () {},
          color: Colors.blue,
        )),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              iconSize: 16,
            ),
            IconButton(
              onPressed: () {},
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
