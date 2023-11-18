import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

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
        rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('234')),
            DataCell(Text('Muhammad Hassan')),
            DataCell(Text('mh14021999@gmail.com')),
            DataCell(Text('09007 8601')),
            DataCell(Text('74600')),
            DataCell(Text('R&T')),
            DataCell(Text('RKDS DEALER')),
            DataCell(Text('10 user')),
            DataCell(Text('')),
            DataCell(Icon(Icons.edit)),
          ]),
        ],
      ),
    );
  }
}
