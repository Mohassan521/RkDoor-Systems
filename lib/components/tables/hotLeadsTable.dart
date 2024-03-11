import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/ClosedEnquiryModel.dart';
import 'package:price_link/models/hotLeadsModel.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/models/ordersListModel.dart';
import 'package:price_link/screens/Enquiries/hotLeadsEdit.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotLeadsTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  const HotLeadsTable({super.key, this.dealerId, this.dealerName});

  @override
  State<HotLeadsTable> createState() => _HotLeadsTableState();
}

class _HotLeadsTableState extends State<HotLeadsTable> {
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

    return FutureBuilder(
      future: apiServices.hotLeads(widget.dealerId ?? ""),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<HotLeadsModel>? list = snapshot.data ?? [];

        print('ID in hot leads ${widget.dealerId}');

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
  final List<HotLeadsModel> data;

  MyData(this.data, this._datetime, this.dealerId, this.dealerName,
      this._showDatePicker,
      {required this.myGlobalBuildContext});

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  showImageDialog(BuildContext context, List<dynamic> imageUrl) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              insetPadding: EdgeInsets.all(9),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: imageUrl
                        .map(
                          (imageUrl) => SizedBox(
                            height: 200.0, // Set the height as needed
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ));
  }

  @override
  DataRow getRow(int index) {
    // String? prevValue =
    //print(prevNotesValue);
    // var userData = Provider.of<UserLoginData>(myGlobalBuildContext).dataModel;
    // var dealerData = Provider.of<DealerData>(myGlobalBuildContext).model;
    final HotLeadsModel? result = data[index];

    //Widget selectedTable = determineTable(result, dealerId!);

    print("result array:  ${result!.customerAddress}");
    print("dealer name $dealerName");

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.enquiryAllocatedTo ?? "")),
        DataCell(Text(result.enquiryCusName ?? "")),
        DataCell(Text(result.enquiryCompanyName ?? "")),
        DataCell(Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.15,
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
            decoration: BoxDecoration(
                color: Color(0xffFF0000),
                border: Border.all(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5)),
            child: Text(
              result.newSymbol ?? "",
              style: TextStyle(color: Colors.white),
            ))),

        DataCell(Text(result.enquiryTelNum ?? "")),
        DataCell(Text(result.enquiryType ?? "")),
        DataCell(Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
            width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
            decoration: BoxDecoration(
              color: result.enquiryPriorityLevel == "LOW"
                  ? Color(0xffffc0cb)
                  : result.enquiryPriorityLevel == "MEDIUM"
                      ? Color(0xffffa500)
                      : Color(0xffff0000),
            ),
            child: Text((result.enquiryPriorityLevel ?? "")))),
        DataCell(Text(result.enquiryRequirement ?? "")),
        // DataCell(
        //     Text(result.facConfDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.enquirySupplyType ?? "")),
        DataCell(Text(dealerName ?? "")),
        DataCell(Text('${(
          result.customerAddress ?? "",
          result.customerAddress2 ?? "",
          result.customerAddress3 ?? "",
          result.customerAddress4 ?? ""
        )}')),
        // DataCell(Text(
        //     result.invoicesDocuments!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.enquiryCusEmail ?? "")),
        // DataCell(Text(
        //     result.enquiryFileUpload!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.dileveryPostCodeC13 ?? "")),
        DataCell(Text(result.enquirySource ?? "")),
        DataCell(Text(result.enquiryConfCode ?? "")),
        DataCell(result.enquiryFileUpload!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showImageDialog(myGlobalBuildContext,
                                  result.enquiryFileUpload!);
                            },
                            child: Icon(
                              Icons.file_open,
                              color: Colors.blue,
                              size: 19,
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                'Delete',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Text("")),
        DataCell(result.enquiryOrderConfFile!.isNotEmpty
            ? Icon(Icons.file_download)
            : Text("")),
        DataCell(RoundButton(
          onTap: () {},
          text: 'Enquiry Record',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(RoundButton(
          onTap: () {
            Navigator.push(
                myGlobalBuildContext,
                MaterialPageRoute(
                    builder: (context) => RkDoorCalculatorView(
                      dealerId: dealerId!,
                        url:
                            "https://www.pricelink.net/rk-door-calulator-by-admin/?user_id=$dealerId&method=enquiryorder&cus_name=${result.enquiryCusName}&add1=${result.customerAddress}&add2=${result.customerAddress2}&add3=${result.customerAddress3}&add4=&quote_id=${result.id}&postcode=${result.dileveryPostCodeC13}&supplyType=${result.enquirySupplyType}&telno=${result.enquiryTelNum}&email=${result.enquiryCusEmail}&allocatedto=${result.enquiryAllocatedTo}&mobile_token=true")));
          },
          text: 'Create Quotation',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(Text(result.quotationNumberForEnquiry ?? "")),
        DataCell(RoundButton(
          onTap: () {
            apiServices.closeEnquiry(dealerId!, result.id!);
          },
          text: 'Close Enquiry',
          color: Color(0xff941420),
          width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.4,
          height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.05,
        )),
        DataCell(Text(result.date ?? "")),
        DataCell(Text(result.time ?? "")),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    myGlobalBuildContext,
                    MaterialPageRoute(
                        builder: (context) => EditHotLeads(
                            dealerId: dealerId ?? "",
                            dealerName: dealerName ?? "",
                            hotLeadsModel: result)));
              },
              icon: Icon(Icons.edit),
              iconSize: 16,
            ),
            IconButton(
              onPressed: () {
                apiServices.deleteEnquiry(dealerId ?? "", result.id ?? "");
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 16,
            ),
          ],
        ))
        //DataCell(Text(result.orderFinHisNoteBox ?? '')),
        //DataCell(Text(result.customNotes ?? '')),
      ],
    );
  }
}
