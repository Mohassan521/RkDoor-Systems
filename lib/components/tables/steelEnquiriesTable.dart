import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class SteelEnquiriesTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const SteelEnquiriesTable(
      {super.key, this.dealerId, required this.dealerName});

  @override
  State<SteelEnquiriesTable> createState() => _SteelEnquiriesTableState();
}

class _SteelEnquiriesTableState extends State<SteelEnquiriesTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<EnquiriesModel>>(
      future: apiServices.getAllEnquiries(widget.dealerId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<EnquiriesModel>? list = snapshot.data ?? [];
        List<EnquiriesModel>? steelEnquiriesList = list
            .where((result) =>
                result.enquiryType == "Internal Steel" ||
                result.enquiryType == "External Steel")
            .toList();

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              columnSpacing: 20,
              headingRowHeight: 48,
              dataRowMaxHeight: 48,
              rowsPerPage: (steelEnquiriesList.length >= 5 &&
                      steelEnquiriesList.isNotEmpty)
                  ? 5
                  : (steelEnquiriesList.isEmpty)
                      ? 1
                      : steelEnquiriesList.length,
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Enquiry Allocated To',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Customer Name',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Company',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Status',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Details',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Product Type',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Priority',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Requirement',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Supply Type',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Address',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Source',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Configurator Code',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                // DataColumn(
                //     label: Text(
                //   'File Upload',
                //   style: TextStyle(color: Color(0XFF941420)),
                // )),
                // DataColumn(
                //     label: Text(
                //   'File Upload (From Enquiry Form)',
                //   style: TextStyle(color: Color(0XFF941420)),
                // )),
                // DataColumn(
                //     label: Text(
                //   'Quotation Number',
                //   style: TextStyle(color: Color(0XFF941420)),
                // )),
                DataColumn(
                    label: Text(
                  'Enquiry Date',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Hot Leads',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Enquiry Entered By',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Close Enquiry',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
                DataColumn(
                    label: Text(
                  'Edit',
                  style: TextStyle(color: Color(0XFF941420)),
                )),
              ],
              source: MyData(list, context,
                  steelEnquiriesList: steelEnquiriesList));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  List<EnquiriesModel> steelEnquiriesList;
  final BuildContext context;
  final List<EnquiriesModel> data;

  MyData(this.data, this.context, {required this.steelEnquiriesList});

  @override
  int get rowCount => steelEnquiriesList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  EnquiriesModel table = EnquiriesModel();

  @override
  DataRow getRow(int index) {
    final EnquiriesModel result = steelEnquiriesList[index];
    return DataRow.byIndex(
      index: index,
      color: MaterialStatePropertyAll(Colors.white),
      cells: <DataCell>[
        DataCell(Text(result.enquiryAllocatedTo ?? '')),
        DataCell(Text(result.enquiryCusName ?? '')),
        DataCell(Text(result.enquiryCompanyName ?? '')),
        DataCell((result.newSymbol != "")
            ? Container(
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
          onTap: () {},
          color: Colors.blue,
        )),
        DataCell(Text(result.enquiryType ?? '')),
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
              width: MediaQuery.sizeOf(context).width * 0.35,
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
        // DataCell(Text(result.quotationNumberForEnquiry ?? "")),
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
