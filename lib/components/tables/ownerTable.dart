import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/screens/editDealer.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class TablePage extends StatefulWidget {
  final String dealer_id;
  const TablePage({super.key, required this.dealer_id});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiServices.getDealersList(context, widget.dealer_id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<DealersModel> data = snapshot.data as List<DealersModel>;

          return Consumer<PaginationProvider>(builder: (context, value, child) {
            return PaginatedDataTable(
                rowsPerPage: value.rowsPerPage,
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff941420)),
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'Dealer ID',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer Name',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Tel',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Post Code',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Quotation Type',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer Type',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'License Type',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'License Expiry Date',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    '',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
                ],
                source: MyData(data, context));
          });
        });
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<DealersModel> data;
  MyData(this.data, this.context);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final DealersModel result = data[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${result.iD}')),
      DataCell(Text(result.displayName ?? '')),
      DataCell(Text(result.userEmail ?? '')),
      DataCell(Text('${result.telephone}')),
      DataCell(Text('${result.postCodeRegister}')),
      DataCell(Text('${result.quotationType}')),
      DataCell(Text('${result.dealerType}')),
      DataCell(Text('${result.lDealer}')),
      DataCell(Text('${result.lDate}')),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditDealerPage(dealers: result)));
            },
            icon: Icon(Icons.edit),
            iconSize: 16,
          ),
        ],
      )),
    ]);
  }
}
