import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/completedSteelOrdersModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class CompletedSteelOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  const CompletedSteelOrdersTable(
      {super.key, required this.dealerId, required this.dealerName});

  @override
  State<CompletedSteelOrdersTable> createState() =>
      _CompletedSteelOrdersTableState();
}

class _CompletedSteelOrdersTableState extends State<CompletedSteelOrdersTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<CompletedSteelOrdersModel>>(
      future: apiServices.getCompletedSteelOrders(widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompletedSteelOrdersModel>? list = snapshot.data ?? [];

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (list.length > 5 && list.isNotEmpty)
                  ? 5
                  : list.isEmpty
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
                  'Action Status',
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
                  'Factory Order No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Order Confirmation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anticipated Delivery Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Steel Invoices',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Balance Due',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Financial History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Supply Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Frame Size',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Delivery Week',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Weight',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Total Order Value (including VAT)',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'File Upload',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation',
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
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Date History',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(list, context)),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<CompletedSteelOrdersModel>? data;
  BuildContext context;

  MyData(this.data, this.context);

  @override
  int get rowCount => data!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final CompletedSteelOrdersModel result = data![index];
    print(data);
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        //1
        DataCell(Text(result.steelCustomerName ?? '')),
        //2
        DataCell(
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: result.steelOrderStatusVal == "Deposit Received" ||
                      result.steelOrderStatusVal ==
                          "Preliminary Confirmation Issued" ||
                      result.steelOrderStatusVal == "Awaiting Deposit" ||
                      result.steelOrderStatusVal ==
                          "Revised Confirmation Issued" ||
                      result.steelOrderStatusVal ==
                          "Awaiting Balance Payment" ||
                      result.steelOrderStatusVal ==
                          "Awaiting Survey / Dimensions"
                  ? Colors.red
                  : Color(0xffb5e51d),
            ),
            child: Text(
              (result.steelOrderStatusVal == "Deposit Received" ||
                      result.steelOrderStatusVal ==
                          "Preliminary Confirmation Issued" ||
                      result.steelOrderStatusVal == "Awaiting Deposit" ||
                      result.steelOrderStatusVal ==
                          "Revised Confirmation Issued" ||
                      result.steelOrderStatusVal ==
                          "Awaiting Balance Payment" ||
                      result.steelOrderStatusVal ==
                          "Awaiting Survey / Dimensions")
                  ? 'Action Required'
                  : "No Action Required",
            ),
          ),
        ),
        //3
        DataCell(Text(result.steelDealerEmail ?? '')),
        //4
        DataCell(Text(result.steelQNumber ?? '')),
        //5
        DataCell(Text(result.steelSaleperson ?? '')),
        //6
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10), child: TextFormField())),
        //7
        DataCell(Container(
          margin: EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.lightBlue,
          child: Center(child: Text(result.steelOrderStatusVal ?? '')),
        )),
        //DataCell(Text(result.steelOrderConfFile ?? 'No File Chosen')),
        // DataCell(result.steelOrderConfFile!.isNotEmpty
        //     ? Icon(Icons.file_open)
        //     : Text("")),
        //8
        DataCell(Text("")),
        //9
        DataCell(Text(result.steelAnticipatedDate ?? '')),
        //DataCell(Text(result.steelInvoices ?? 'No file chosen')),
        // DataCell(result.steelInvoices!.isNotEmpty
        //     ? Center(
        //         child: Icon(
        //         Icons.file_open,
        //         size: 16,
        //         color: Colors.blue,
        //       ))
        //     : Text("")),
        //10
        DataCell(Text("")),
        //11
        DataCell(Text(result.steelBalDueBeforeDelivery ?? '')),
        //12
        DataCell(RoundButton(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             SteelOrderFinancialHistory(steelOrdersModel: result)));
          },
          text: 'Financial History',
          color: Colors.blue,
          height: MediaQuery.sizeOf(context).height * 0.06,
          width: MediaQuery.sizeOf(context).width * 0.4,
        )),
        //13
        DataCell(result.steelDelNotes!.isNotEmpty
            ? Center(
                child: Icon(
                Icons.file_open,
                size: 16,
                color: Colors.blue,
              ))
            : Text("")),
        //14
        DataCell(Text(result.steelSupplyType ?? '')),
        //15
        DataCell(Text(result.steelFrameSize ?? "")),
        //16
        DataCell(Text(result.steelFacWeekVal ?? '')),
        //17
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        //18
        DataCell(Text(result.steelWeight ?? '')),
        //19
        DataCell(Text(result.steelDealerTelno ?? '')),
        //20
        DataCell(Text(result.steelDealerEmail ?? '')),
        //21
        DataCell(Text(result.steelTotalOrderValue ?? '')),
        //22
        //DataCell(Text(result.steelFacWeekVal ?? "")),
        DataCell(result.manualPDFImageURL!.isNotEmpty
            ? Icon(Icons.file_open)
            : Text('No file found')),
        //23
        DataCell(result.pDFImageURL!.isNotEmpty
            ? Icon(Icons.file_open)
            : Text('No file found')),
        //DataCell(Text(result.dileveryPostCodeC13 ?? "")),
        //24
        DataCell(Text(result.date ?? "")),
        //25
        DataCell(Text(result.time ?? "")),
        //26
        DataCell(RoundButton(
          onTap: () {},
          color: Colors.blue,
          text: 'Notes',
          width: MediaQuery.sizeOf(context).width * 0.28,
          height: MediaQuery.sizeOf(context).height * 0.05,
        )),
        //27
        DataCell(Text('${result.date} ${result.time}')),
        //28
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 16,
            ),
          ],
        )),
        //29
        // DataCell(result.manualPDFImageURL!.isNotEmpty
        //     ? Icon(Icons.file_open)
        //     : Text('No file found')),
        // //30
        // DataCell(result.pDFImageURL!.isNotEmpty
        //     ? Icon(Icons.file_open)
        //     : Text('No file found')),
        // //31
        // DataCell(Text(result.date ?? '')),
        //32
        // DataCell(Text(result.time ?? '')),
        // //33
        // DataCell(RoundButton(
        //   text: 'Notes',
        //   onTap: () {},
        //   color: Colors.blue,
        // )),
        // //34
        // DataCell(Text('${result.date} ${result.time}')),
        // //35
        // DataCell(Row(
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.delete),
        //       color: Colors.red,
        //       iconSize: 16,
        //     ),
        //   ],
        // )),
      ],
    );
  }
}
