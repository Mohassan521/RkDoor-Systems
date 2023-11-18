import 'package:flutter/material.dart';

class ClosedEnquiryTable extends StatelessWidget {
  const ClosedEnquiryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DataRow> _datarow = [];

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
              'Enquiry Allocated To',
              style: TextStyle(color: Colors.white),
            ),
          )),
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
              'Company',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Tel Number',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Product Type',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Priority',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Requirement',
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
              'Address',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Email',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Enquiry Source',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'File Upload',
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
              'Create Quotation',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Close Enquiry',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          )),
        ],
        rows: _datarow,
      ),
    );
  }
}
