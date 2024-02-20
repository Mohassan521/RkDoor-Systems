import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminClosedEnquiryTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdminClosedEnquiryTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AdminClosedEnquiryTable> createState() =>
      _AdminClosedEnquiryTableState();
}

class _AdminClosedEnquiryTableState extends State<AdminClosedEnquiryTable> {
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
                    'Telephone',
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
                    'Enquiry Allocated To',
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
                    'Enquiry Source',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'File Upload',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Notes',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Create Quotation',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Close Enquiry',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Back To Enquiry',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                source: MyData(displayData, _dateTime, widget.dealerId,
                    widget.dealerName, _showDatePicker,
                    myGlobalBuildContext: context)),
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
    var userData = Provider.of<UserLoginData>(myGlobalBuildContext).dataModel;
    var dealerData = Provider.of<DealerData>(myGlobalBuildContext).model;
    final ClosedEnquiryModel result = data[index];

    //Widget selectedTable = determineTable(result, dealerId!);

    return DataRow.byIndex(
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
                    Icons.file_download,
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
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Create Quotation',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Close Enquiry',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Back To Enquiry',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(Text("")),

        //DataCell(Text(result.orderFinHisNoteBox ?? '')),
        //DataCell(Text(result.customNotes ?? '')),
      ],
    );
  }
}
