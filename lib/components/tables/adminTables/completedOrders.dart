import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminCompletedOrders.dart';
import 'package:path/path.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class AdminCompletedOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminCompletedOrdersTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminCompletedOrdersTable> createState() =>
      _AdminCompletedOrdersTableState();
}

class _AdminCompletedOrdersTableState extends State<AdminCompletedOrdersTable> {
  //List<DealersModel> dealers = [];


  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder(
      future: apiServices.getCompletedOrdersForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompleteResponseForCompletedOrders>? list = snapshot.data ?? [];
        print("completed orders: ${list.length}");

        print("completed orders list: $list");
        // List<CompletedOrders> filteredList =
        //     Provider.of<CompletedOrdersSearchData>(context).filteredDataModel;
        // List<CompletedOrders>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

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
                  'Customer Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Order No',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Confirmation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anticipated Delivery Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Invoices',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Note',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No',
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
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  list, context, widget.dealerId, widget.dealerName)),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<CompleteResponseForCompletedOrders> data;
  final BuildContext context;
  final String? dealerId;
  final String? dealerName;

  MyData(this.data, this.context, this.dealerId, this.dealerName);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    print("Completed orders data in MyData class  ${data[index].quotes}");
    final quote = data[index].quotes;
    final displayName = data[index].displayName;
    final dealerName = data[index].dealerName;
    print("total weight ${data[index].quotes}");
    quote.map((e) {
      return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(displayName)),
        DataCell(Text(e.totalWeightKg ?? "")),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        DataCell(Text(dealerName)),
        
        // Add more cells as needed
      ],
    );

    });
      
  }
}

    // return DataRow.byIndex(index: index, cells: <DataCell>[
    //   //1
    //   DataCell(Text(quote.isNotEmpty ? quote[index].name ?? "" : "")),
    //   //2
    //   DataCell(Text(displayname.displayName ?? "")),
    //   //3
    //   DataCell(Text(quote.isNotEmpty ? quote[index].quotationNumber ?? "" : "")),
    //   //4
    //   DataCell(Text(displayname.dealerName ?? "")),
    //   //5
    //   DataCell(Text(quote.isNotEmpty ? quote[index].id ?? "" : "")),
    //   //6
    //   DataCell(Text(quote.isNotEmpty ? quote[index].telephoneNumber ?? "" : "")),
    //   //7
    //   DataCell(Text(quote.isNotEmpty ? quote[index].customerEmail ?? "" : "")),
    //   //8
    //   DataCell(Text(quote.isNotEmpty ? quote[index].deliveryPostCode ?? "" : "")),
    //   //9
    //   DataCell(Text(quote.isNotEmpty ? quote[index].date ?? "" : "")),
    //   //10
    //   DataCell(Text(quote.isNotEmpty ? quote[index].time ?? "" : "")),
    //   //11
    //   DataCell(Text(quote.isNotEmpty ? quote[index].wholeTotal ?? "" : "")),
    //   //12
    //   // DataCell(Text(quote.isNotEmpty ? "${quote[index].deliveryCostForQuote ?? ""}" : "")),
    //   DataCell(Text("")),
    //   //13
    //   DataCell(Text("")),
    //   //14
    //   DataCell(Text(quote.isNotEmpty ? "${quote[index].randtSelectBox ?? ""} - ${quote[index].markupVal ?? ""}" : "")),
    //   //15
    //   DataCell(Text("")),
    //   //16
    //   DataCell(Text(quote.isNotEmpty ? quote[index].saleBonus ?? "" : "")),
    //   //17
    //   // follow up date
    //   DataCell(Text("")),
    //   //18
    //   DataCell(Consumer<setFollowUpValue>(
    //     builder: (context, value, child) {
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 8.0, top: 8),
    //         child: Container(
    //           alignment: Alignment.center,
    //           width: MediaQuery.sizeOf(context).width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(0Xff008000),
    //               border: Border.all(width: 1)),
    //           child: DropdownButton<String>(
    //             isExpanded: true,
    //             value: "NO",
    //             onChanged: (String? newValue) {
    //               // if (newValue != null) {
    //               //   apiServices.setFollowUpValue(
    //               //       dealerId!, result.id!, newValue);
    //               // } else {
    //               //   apiServices.setFollowUpValue(
    //               //       dealerId!, result.id!, result.orderFUpQVal!);
    //               // }
    //             },
    //             items: [
    //               DropdownMenuItem<String>(
    //                   value: 'YES',
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     'YES',
    //                     style: TextStyle(color: Colors.black),
    //                   )),
    //               DropdownMenuItem<String>(
    //                   value: 'NO',
    //                   alignment: Alignment.center,
    //                   child: Center(
    //                     child: Text(
    //                       'NO',
    //                       style: TextStyle(color: Colors.black),
    //                     ),
    //                   )),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   )),

    //   //19
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Quote Analysis",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //20
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Notes",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //21
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Survey Form",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //22
    //   DataCell(RoundButton(onTap: (){

    //   },
    //   text: "Create Order",
    //   color: Colors.blue,
    //   width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.35,
    //   height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.04,
    //   )),
    //   //23
    //   DataCell(Row(
    //     children: [
    //       Icon(Icons.edit, size: 14,),
    //       Icon(Icons.copy, size: 14,),
    //       Icon(Icons.delete, color: Colors.red,size: 14,),
    //     ],
    //   )),

    // ]);
  

