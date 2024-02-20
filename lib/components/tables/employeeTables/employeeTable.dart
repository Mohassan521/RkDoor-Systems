import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/screens/editEmployee.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeDashboardTable extends StatefulWidget {
  final String dealer_id;
  const EmployeeDashboardTable({super.key, required this.dealer_id});

  @override
  State<EmployeeDashboardTable> createState() => _EmployeeDashboardTableState();
}

class _EmployeeDashboardTableState extends State<EmployeeDashboardTable> {
  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder<List<EmployeeList>>(
      future: apiServices.getEmployeeList(widget.dealer_id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Data is being loaded...');
        }

        List<EmployeeList> data = snapshot.data as List<EmployeeList>;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            child: PaginatedDataTable(
                rowsPerPage: (data.length >= 5 && data.isNotEmpty)
                    ? 5
                    : (data.isEmpty)
                        ? 1
                        : data.length,
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
                  // DataColumn(
                  //     label: Text(
                  //   'Status',
                  //   style: TextStyle(color: Colors.white),
                  // )),
                  // DataColumn(
                  //     label: Text(
                  //   '',
                  //   style: TextStyle(color: Colors.white),
                  // )),
                ],
                source: MyData(data, context, widget.dealer_id)),
          );
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final String dealerId;
  final List<EmployeeList> data;
  final BuildContext myGlobalBuildContext;
  MyData(this.data, this.myGlobalBuildContext, this.dealerId);

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    String prevValue = "Employee";
    NetworkApiServices apiServices = NetworkApiServices();
    final EmployeeList result = data[index];
    print('employee ID in employee Table ${result.id}');
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${result.id}')),
      DataCell(Text(result.display_name ?? '')),
      DataCell(Text(result.user_email ?? '')),
      DataCell(Text('${result.telephone}')),
      DataCell(Text('${result.postCode}')),
      DataCell(Text('${result.quotation_type}')),
      DataCell(Text('${result.markup}')),
      DataCell(Text('${result.maxDiscount}')),
      //DataCell(Text('${result.user_status}')),
      // DataCell(
      //   Consumer<setEmployeeStatus>(
      //     builder: (context, value, child) {
      //       return FutureBuilder<String>(
      //         future: apiServices.getEmployeeStatus(result.id.toString()),
      //         builder: (context, snapshot) {
      //           String? currentValue =
      //               snapshot.data != null ? snapshot.data : "";
      //           return DropdownButton(
      //             value: currentValue,
      //             onChanged: (String? newValue) async {
      //               value.setStatusForUser(result.id.toString(), newValue!);

      //               apiServices.setEmployeeStatus(
      //                   result.id.toString(), newValue);
      //             },
      //             items: [
      //               DropdownMenuItem(value: '', child: Text('')),
      //               DropdownMenuItem(
      //                   value: 'Employee', child: Text('Employee')),
      //               DropdownMenuItem(value: 'Admin', child: Text('Admin')),
      //             ],
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    ]);
  }
}
