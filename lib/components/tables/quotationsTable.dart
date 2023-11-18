import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/components/round_button.dart';

class QuotationsTable extends StatefulWidget {
  const QuotationsTable({super.key});

  @override
  State<QuotationsTable> createState() => _QuotationsTableState();
}

class _QuotationsTableState extends State<QuotationsTable> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

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
              'Quote ID',
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
              'Quote Analysis',
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
              'Action',
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
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('Muhammad Hassan')),
            DataCell(Text('RK231179664')),
            DataCell(Text('Muhammad Hassan')),
            DataCell(Text('01234 56789')),
            DataCell(Text('mh14021999@gmail.com')),
            DataCell(Text('74600')),
            DataCell(Text('2023-11-07')),
            DataCell(Text('11:25 AM')),
            DataCell(Text('2,825.52')),
            DataCell(Text('654a1ec299fa7')),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy-MM-dd').format(_dateTime)),
                IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            )),
            DataCell(RoundButton(
              text: 'NO',
              onTap: () {},
              color: Color(0xffFF0000),
            )),
            DataCell(RoundButton(
              text: 'Quote Analysis',
              onTap: () {},
              color: Color(0xff941420),
            )),
            DataCell(RoundButton(
              text: 'Notes',
              onTap: () {},
              color: Color(0xff941420),
            )),
            DataCell(RoundButton(
              text: 'Create Order',
              onTap: () {},
              color: Color(0xff941420),
            )),
            DataCell(Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            )),
          ])
        ],
      ),
    );
  }
}
