import 'package:flutter/material.dart';

class EmployeeListTable extends StatelessWidget {
  const EmployeeListTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Color(0xff941420)),
        border: TableBorder.all(color: Colors.grey),
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
            'Minimum Markup',
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
            style: TextStyle(fontStyle: FontStyle.italic),
          )),
        ],
        rows: const <DataRow>[],
      ),
    );
  }
}
