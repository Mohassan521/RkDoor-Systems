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
            return Text('Data is being loaded...');
          }

          List<DealersModel> data = snapshot.data ?? [];

          return Consumer<PaginationProvider>(builder: (context, value, child) {
            return PaginatedDataTable(
                headingRowHeight: 48,
                dataRowMaxHeight: 48,
                columnSpacing: 20,
                rowsPerPage: 1,
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'Dealer ID',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer Name',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Email',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Tel',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Post Code',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Quotation Type',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'Dealer Type',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'License Type',
                    style: TextStyle(color: Color(0xff941420)),
                  )),
                  DataColumn(
                      label: Text(
                    'License Expiry Date',
                    style: TextStyle(color: Color(0xff941420)),
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
    return DataRow.byIndex(
        color: MaterialStatePropertyAll(Colors.white),
        index: index,
        cells: <DataCell>[
          DataCell(Text(
            '${result.iD}',
            style: TextStyle(fontSize: 12.5),
          )),
          DataCell(
              Text(result.displayName ?? '', style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text(result.userEmail ?? '', style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text('${result.telephone}', style: TextStyle(fontSize: 12.5))),
          DataCell(Text('${result.postCodeRegister}',
              style: TextStyle(fontSize: 12.5))),
          DataCell(Text('${result.quotationType}',
              style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text('${result.dealerType}', style: TextStyle(fontSize: 12.5))),
          DataCell(Text('${result.lDealer}', style: TextStyle(fontSize: 12.5))),
          DataCell(Text('${result.lDate}', style: TextStyle(fontSize: 12.5))),
          DataCell(Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditDealerPage(dealers: result)));
                },
                icon: Icon(Icons.edit),
                iconSize: 14,
              ),
            ],
          )),
        ]);
  }
}
