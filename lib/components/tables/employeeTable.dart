import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/screens/editEmployee.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EmployeeTable extends StatefulWidget {
  final String dealer_id;
  const EmployeeTable({super.key, required this.dealer_id});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
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

        List<EmployeeList> data = snapshot.data ?? [];

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              headingRowHeight: 48,
              dataRowMaxHeight: 48,
              columnSpacing: 20,
              showEmptyRows: false,
              rowsPerPage: (data.length >= 5 && data.isNotEmpty)
                  ? 5
                  : (data.isEmpty)
                      ? 1
                      : data.length,
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
                DataColumn(
                    label: Text(
                  'Create Order Rights',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Color(0xff941420)),
                )),
              ],
              source: MyData(data, context, widget.dealer_id));
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
    NetworkApiServices apiServices = NetworkApiServices();
    final EmployeeList result = data[index];
    print('employee ID in employee Table ${result.id}');
    return DataRow.byIndex(
        color: MaterialStatePropertyAll(Colors.white),
        index: index,
        cells: <DataCell>[
          DataCell(Text('${result.id}', style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.display_name ?? '',
              style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text(result.user_email ?? '', style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text('${result.telephone}', style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text('${result.postCode}', style: TextStyle(fontSize: 12.5))),
          DataCell(Center(
              child: Text('${result.quotation_type}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5)))),
          DataCell(Center(
              child: Text('${result.markup}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5)))),
          DataCell(Center(
              child: Text('${result.maxDiscount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5)))),
          //DataCell(Text('${result.user_status}')),
          DataCell(
            Consumer<setEmployeeStatus>(
              builder: (context, value, child) {
                return FutureBuilder(
                  future: apiServices.getEmployeeStatus(result.id.toString()),
                  builder: (context, snapshot) {
                    String? currentValue = snapshot.data ?? '';
                    return DropdownButton(
                      style: TextStyle(fontSize: 12.5, color: Colors.black),
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

          DataCell(
            Consumer<HandlingStates>(
              builder: (context, value, child) {
                return FutureBuilder<bool>(
                  future: apiServices.getOrderRights(result.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      bool apiValue = snapshot.data == true ? true : false;
                      return Checkbox(
                        value: apiValue,
                        onChanged: (newValue) async {
                          value.toggleCheckbox(
                              result.id.toString(), newValue ?? false);
                          print(apiValue);
                          apiServices.setOrderRights(
                              result.id.toString(), newValue.toString());
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),

          DataCell(Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      myGlobalBuildContext,
                      MaterialPageRoute(
                          builder: (context) => EditEmployeePage(
                                employee: result,
                              )));
                },
                icon: Icon(Icons.edit),
                iconSize: 14,
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  apiServices.deleteEmployee(result.id.toString());
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
                iconSize: 14,
              ),
            ],
          )),
        ]);
  }
}
