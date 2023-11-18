import 'package:flutter/material.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
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
              'Quote Created By',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Factory Order No',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Order status',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Order confirmation',
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
              'Delivery Note',
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
              'Threshold type',
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
              'Back to Quote',
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
              'Action Status',
              style: TextStyle(color: Colors.white),
            ),
          )),
        ],
        rows: const <DataRow>[],
      ),
    );
  }
}
