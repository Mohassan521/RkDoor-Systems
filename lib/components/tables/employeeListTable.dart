import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EmployeeListTable extends StatelessWidget {
  final String dealer_id;
  const EmployeeListTable({super.key, required this.dealer_id});

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<EmployeeList>>(
      future: apiServices.getEmployeeList(dealer_id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<EmployeeList>? list = snapshot.data!;
        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              rowsPerPage: (list.length >= 5) ? 5 : list.length,
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff941420)),
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Employee ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Employee Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Employee Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Telephone',
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
                  'Minimum markup',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Maximum Discount',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Status',
                  style: TextStyle(color: Colors.white),
                )),
                // DataColumn(
                //     label: Text(
                //   'Create Order Rights',
                //   style: TextStyle(color: Colors.white),
                // )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(list));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<EmployeeList> data;
  MyData(this.data);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final EmployeeList result = data[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${result.id}')),
      DataCell(Text(result.display_name ?? '')),
      DataCell(Text(result.user_email ?? '')),
      DataCell(Text('${result.telephone}')),
      DataCell(Text('${result.postCode}')),
      DataCell(Text('${result.quotation_type}')),
      DataCell(Text('${result.markup}')),
      DataCell(Text('${result.maxDiscount}')),
      DataCell(Text('${result.user_status}')),
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
    ]);
  }
}
