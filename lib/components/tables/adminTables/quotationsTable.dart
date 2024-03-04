import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminQuotesModel.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AdminQuotationsTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdminQuotationsTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AdminQuotationsTable> createState() => _AdminQuotationsTableState();
}

class _AdminQuotationsTableState extends State<AdminQuotationsTable> {
  DateTime _dateTime = DateTime.now();
  NetworkApiServices apiServices = NetworkApiServices();

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
    print(widget.dealerName);
    return FutureBuilder<List<CompleteResponse>>(
      future: apiServices.getAdminQuotes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        }

        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompleteResponse> list = snapshot.data ?? [];
        

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
            rowsPerPage: (list.length > 5 && list.isNotEmpty) ? 5 : list.isEmpty ? 1 : list.length,
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
                  'Username',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Number',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Total Quote Value (inc. VAT)',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Installation Cost',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Cost',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Level of Discount',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sale Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Made',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Survey Form',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Action',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(

                list,
                widget.dealerId,
                dealerName: widget.dealerName!,
                                myGlobalBuildContext: context,
                                datetime: _dateTime,
                showDatePickerCallback: _showDatePicker,
                
              )),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  NetworkApiServices apiServices = NetworkApiServices();
  final List<CompleteResponse> data;
  final String? dealerId;
  final String dealerName;
  final DateTime datetime;
  final BuildContext myGlobalBuildContext;
  final void Function() showDatePickerCallback;
  //final void Function() getSavedValue;
  MyData(
    this.data,
    this.dealerId, {
    required this.dealerName,
    required this.datetime,
    required this.myGlobalBuildContext,
    required this.showDatePickerCallback,
    //required this.getSavedValue
  });

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    //print('Dealer ID in quotation table my data class $dealerId');
    final quote = data[index].quotes;
    final displayname = data[index];
    
    //print(displayname.displayName);
    print("quote length: ${quote!.length}");
    return DataRow.byIndex(index: index, cells: <DataCell>[
      //1
      DataCell(Text(quote.isNotEmpty ? quote[index].name! : "")),
      //2
      DataCell(Text(displayname.displayName ?? "")),
      //3
      DataCell(Text(quote.isNotEmpty ? quote[index].quotationNumber! : "")),
      //4
      DataCell(Text(displayname.dealerName ?? "")),
      //5
      DataCell(Text(quote.isNotEmpty ? quote[index].id! : "")),
      //6
      DataCell(Text(quote.isNotEmpty ? quote[index].telephoneNumber! : "")),
      //7
      DataCell(Text(quote.isNotEmpty ? quote[index].customerEmail! : "")),
      //8
      DataCell(Text(quote.isNotEmpty ? quote[index].deliveryPostCode! : "")),
      //9
      DataCell(Text(quote.isNotEmpty ? quote[index].date! : "")),
      //10
      DataCell(Text(quote.isNotEmpty ? quote[index].time! : "")),
      //11
      DataCell(Text(quote.isNotEmpty ? quote[index].wholeTotal! : "")),
      //12
      DataCell(Text("")),
      //13
      DataCell(Text("")),
      //14
      DataCell(Text(quote.isNotEmpty ? "${quote[index].randtSelectBox} - ${quote[index].markupVal}" : "")),
      //15
      DataCell(Text("")),
      //16
      DataCell(Text(quote.isNotEmpty ? quote[index].saleBonus! : "")),
      //17
      // follow up date
      DataCell(Text("")),
      //18
      DataCell(Consumer<setFollowUpValue>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width * 0.4,
              decoration: BoxDecoration(
                  color: Color(0Xff008000),
                  border: Border.all(width: 1)),
              child: DropdownButton<String>(
                isExpanded: true,
                value: "NO",
                onChanged: (String? newValue) {
                  // if (newValue != null) {
                  //   apiServices.setFollowUpValue(
                  //       dealerId!, result.id!, newValue);
                  // } else {
                  //   apiServices.setFollowUpValue(
                  //       dealerId!, result.id!, result.orderFUpQVal!);
                  // }
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'YES',
                      alignment: Alignment.center,
                      child: Text(
                        'YES',
                        style: TextStyle(color: Colors.black),
                      )),
                  DropdownMenuItem<String>(
                      value: 'NO',
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'NO',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      )),

      //19
      DataCell(RoundButton(onTap: (){

      },
      text: "Quote Analysis",
      color: Colors.blue,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
      )),
      //20
      DataCell(RoundButton(onTap: (){

      },
      text: "Notes",
      color: Colors.blue,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
      )),
      //21
      DataCell(RoundButton(onTap: (){

      },
      text: "Survey Form",
      color: Colors.blue,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
      )),
      //22
      DataCell(RoundButton(onTap: (){

      },
      text: "Create Order",
      color: Colors.blue,
      width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
      height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
      )),
      //23
      DataCell(Row(
        children: [
          Icon(Icons.edit, size: 14,),
          Icon(Icons.copy, size: 14,),
          Icon(Icons.delete, color: Colors.red,size: 14,),
        ],
      )),

    ]);
  }
}
