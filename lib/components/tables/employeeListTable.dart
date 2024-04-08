import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EmployeeListTable extends StatelessWidget {
  final String dealer_id;
  final String dealer_name;
  const EmployeeListTable(
      {super.key, required this.dealer_id, required this.dealer_name});

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
          return Center(child: Text('Data is being loaded...'));
        }

        List<EmployeeList>? list = snapshot.data ?? [];

        List<EmployeeList> filteredList =
            Provider.of<EmployeeListSearchedData>(context).filteredDataModel;
        List<EmployeeList>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              columnSpacing: 20,
              headingRowHeight: 48,
              dataRowMaxHeight: 48,
              rowsPerPage: (list.length >= 5) ? 5 : list.length,
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Employee ID',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Employee Name',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Employee Email',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Telephone',
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
                  'Minimum markup',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Maximum Discount',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Status',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                // DataColumn(
                //     label: Text(
                //   'Create Order Rights',
                //   style: TextStyle(color: Color(0xff941420)),
                // )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(displayData));
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
    NetworkApiServices apiServices = NetworkApiServices();
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${result.id}')),
      DataCell(Text(result.display_name ?? '')),
      DataCell(Text(result.user_email ?? '')),
      DataCell(Text('${result.telephone}')),
      DataCell(Text('${result.postCode}')),
      DataCell(Text('${result.quotation_type}')),
      DataCell(Text('${result.markup}')),
      DataCell(Text('${result.maxDiscount}')),
      DataCell(
        Consumer<setEmployeeStatus>(
          builder: (context, value, child) {
            return FutureBuilder(
              future: apiServices.getEmployeeStatus(result.id.toString()),
              builder: (context, snapshot) {
                String? currentValue = snapshot.data ?? "";
                return DropdownButton(
                  value: currentValue,
                  onChanged: (String? newValue) async {
                    value.setStatusForUser(result.id.toString(), newValue!);

                    apiServices.setEmployeeStatus(
                        result.id.toString(), newValue);
                  },
                  items: [
                    DropdownMenuItem(value: '', child: Text('')),
                    DropdownMenuItem(
                        value: 'Employee', child: Text('Employee')),
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                  ],
                );
              },
            );
          },
        ),
      ),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            iconSize: 14,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            color: Colors.red,
            iconSize: 14,
          ),
        ],
      )),
    ]);
  }
}
