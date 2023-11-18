import 'package:flutter/material.dart';

class DoorAwaitingDepositTable extends StatefulWidget {
  const DoorAwaitingDepositTable({super.key});

  @override
  State<DoorAwaitingDepositTable> createState() =>
      _DoorAwaitingDepositTableState();
}

class _DoorAwaitingDepositTableState extends State<DoorAwaitingDepositTable> {
  @override
  Widget build(BuildContext context) {
    final List<DataRow> _datarow = [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowMinHeight: MediaQuery.of(context).size.height * 0.1,
        dataRowMaxHeight: double.infinity,
        border: TableBorder.all(color: Colors.grey),
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Color(0xff941420)),
        columns: const <DataColumn>[
          DataColumn(
              label: Expanded(
            child: Text(
              'Customer Name',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Quotation Number',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Dealer',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Quote Created By',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Factory Order No.',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Order Status',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Order Confirmation',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Quick PDF Quotation',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Anticipated Delivery Date',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Invoices',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Balance Due',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Financial History',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Delivery Note',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Door Model',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Marine Grade Finish',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Frame Size',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Goalpost Construction',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Overall Weight',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Threshold Type',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Keyless access',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Customer Tel No.',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Customer Email',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Post Code',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Quote ID',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Date',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Time',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Total Quote Value (inc. VAT)',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Follow up Date',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Follow up Made',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Notes',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Quote Analysis',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Order Date History',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          )),
        ],
        rows: _datarow,
      ),
    );
  }
}
