import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class ClosedEnquiryTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const ClosedEnquiryTable({super.key, this.dealerId, this.dealerName});

  @override
  State<ClosedEnquiryTable> createState() => _ClosedEnquiryTableState();
}

class _ClosedEnquiryTableState extends State<ClosedEnquiryTable> {
  DateTime _dateTime = DateTime.now();
  String? prevValue;
  void _showDatePicker() {
    showDatePicker(
            context: context,
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

    return FutureBuilder<List<ClosedEnquiryModel>>(
      future: apiServices.closedEnquiries(widget.dealerId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<ClosedEnquiryModel>? list = snapshot.data ?? [];

        List<ClosedEnquiryModel> filteredList =
            Provider.of<ClosedEnquiriesSearchedData>(context).filteredDataModel;
        List<ClosedEnquiryModel>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
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
                  'Edit',
                  style: TextStyle(color: Color(0xff941420)),
                )),
              ],
              source: MyData(displayData, _dateTime, widget.dealerId,
                  widget.dealerName, _showDatePicker,
                  myGlobalBuildContext: context));
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
  final BuildContext myGlobalBuildContext;
  TextEditingController orderNotesController = TextEditingController();
  final List<ClosedEnquiryModel> data;

  MyData(this.data, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.myGlobalBuildContext});

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    // String? prevValue =
    //print(prevNotesValue);
    var dealerData = Provider.of<DealerData>(myGlobalBuildContext).model;
    final ClosedEnquiryModel result = data[index];

    //Widget selectedTable = determineTable(result, dealerId!);

    return DataRow.byIndex(
      color: MaterialStatePropertyAll(Colors.white),
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.enquiryCusName ?? "")),
        DataCell(Text(result.enquiryCompanyName ?? "")),
        DataCell(Text(result.enquiryTelNum ?? "")),
        DataCell(Text(result.enquiryType ?? "")),
        DataCell(Text(result.enquiryPriorityLevel ?? "")),
        DataCell(Text((result.enquiryRequirement ?? ""))),
        DataCell(Text(result.enquiryAllocatedTo ?? '')),
        // DataCell(
        //     Text(result.facConfDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(dealerData.displayName ?? '')),
        DataCell(Text(result.customerAddress ?? "")),
        DataCell(Text(result.enquiryCusEmail ?? '')),
        // DataCell(Text(
        //     result.invoicesDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.enquirySource ?? '')),
        // DataCell(Text(
        //     result.enquiryFileUpload!.map((e) => e.toString()).join(', '))),
        DataCell((result.enquiryFileUpload!.isNotEmpty)
            ? Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.file_open,
                    size: 15,
                  ),
                ),
              )
            : Text("")),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Notes',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.2,
        )),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Create Quotation',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
        )),
        DataCell(Text("")),

        //DataCell(Text(result.orderFinHisNoteBox ?? '')),
        //DataCell(Text(result.customNotes ?? '')),
      ],
    );
  }
}
