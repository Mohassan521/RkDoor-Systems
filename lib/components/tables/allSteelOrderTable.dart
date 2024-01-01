import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';

class AllSteelOrdersTable extends StatefulWidget {
  final String dealerId;
  const AllSteelOrdersTable({super.key, required this.dealerId});

  @override
  State<AllSteelOrdersTable> createState() => _AllSteelOrdersTableState();
}

class _AllSteelOrdersTableState extends State<AllSteelOrdersTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<SteelOrderModel>>(
      future: apiServices.allSteelOrders(widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<SteelOrderModel>? list = snapshot.data!;

        return PaginatedDataTable(
            rowsPerPage: (list.length > 10) ? 10 : list.length,
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
                'Requirement',
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
                'Color',
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
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
            ],
            source: MyData(list));
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<SteelOrderModel> data;

  MyData(this.data);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  SteelOrderModel table = SteelOrderModel();

  @override
  DataRow getRow(int index) {
    final SteelOrderModel result = data[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.steelCustomerName ?? '')),
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
        DataCell(Text(result.steelDealerEmail ?? '')),
        DataCell(Text(result.steelQNumber ?? '')),
        DataCell(Text(result.steelSaleperson ?? '')),
        DataCell(Container(
            margin: EdgeInsets.only(bottom: 10), child: TextFormField())),
        DataCell(Container(
          margin: EdgeInsets.only(bottom: 5, top: 5),
          color: Colors.lightBlue,
          child: Center(child: Text(result.steelOrderStatusVal ?? '')),
        )),
        DataCell(Text(result.steelOrderConfFile ?? 'No File Chosen')),
        DataCell(Text(result.steelAnticipatedDate ?? '')),
        DataCell(Text(result.steelInvoices ?? 'No file chosen')),
        DataCell(Text(result.steelBalDueBeforeDelivery ?? '')),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        DataCell(RoundButton(
          text: 'Financial History',
          onTap: () {},
          color: Colors.blue,
        )),
        DataCell(Text(result.steelDelNotes.toString())),
        DataCell(Text(result.steelSupplyType ?? '')),
        //DataCell(Text('')),
        DataCell(Text(result.steelFrameSize ?? "")),
        DataCell(Text(result.steelColor ?? '')),
        // factory delivery week
        //DataCell(TextFormField()),
        DataCell(Text(result.time ?? '')),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        DataCell(Text(result.steelWeight ?? '')),
        DataCell(Text(result.steelDealerTelno ?? '')),
        DataCell(Text(result.steelDealerEmail ?? '')),
        DataCell(Text(result.steelTotalOrderValue ?? '')),
        DataCell(Text(
            result.manualPDFImageURL!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.pDFImageURL!.map((e) => e.toString()).join(', '))),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(RoundButton(
          text: 'Notes',
          onTap: () {},
          color: Colors.blue,
        )),
        DataCell(Text('${result.date} ${result.time}')),

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
