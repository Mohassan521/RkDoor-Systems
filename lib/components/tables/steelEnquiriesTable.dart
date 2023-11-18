import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';

class SteelEnquiriesTable extends StatefulWidget {
  const SteelEnquiriesTable({super.key});

  @override
  State<SteelEnquiriesTable> createState() => _SteelEnquiriesTableState();
}

class _SteelEnquiriesTableState extends State<SteelEnquiriesTable> {
  String? _filePath;
  String selectedValue = "";

  List<String> enquiryStatus = [
    'VIEWED',
    'QUOTATION ISSUED',
    'REVISED QUOTATION ISSUED',
    '1ST FOLLOW UP MADE',
    '2ND FOLLOW UP MADE',
    'POTENTIAL ORDER',
    'ORDERED',
    'CLOSED'
  ];

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking file: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DataRow> _datarow = [
      DataRow(cells: <DataCell>[
        DataCell(Text('newdealerupdate 2')),
        DataCell(Text('another one')),
        DataCell(Text('Hassan')),
        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Opened'),
            Text('2023-11-10'),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
              width: MediaQuery.of(context).size.width * 0.35,
              child: ReusableDropdown(
                  items: enquiryStatus,
                  value: enquiryStatus.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
            ),
            SizedBox(
              height: 5,
            )
          ],
        )),
        DataCell(Text('66456 456456')),
        DataCell(Text('Internal Steel')),
        DataCell(Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Text('Medium'))),
        DataCell(Text('Others')),
        DataCell(Text('Supply Only')),
        DataCell(Text('abcd')),
        DataCell(Text('Gulshan e Iqbal block 11')),
        DataCell(Text('')),
        DataCell(Text('Other')),
        DataCell(TextFormField(
          decoration: InputDecoration(hintText: 'Enter Configurator'),
        )),
        DataCell(
          Row(
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Pick File'),
              ),
              SizedBox(width: 20),
              _filePath != null
                  ? Flexible(child: Text('$_filePath'))
                  : const Text('No file selected'),
              IconButton(
                  onPressed: () {},
                  icon: _filePath != null ? Icon(Icons.delete) : Text(''))
            ],
          ),
        ),
        DataCell(Center(
            child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)))),
        DataCell(RoundButton(
          text: 'Enquiry Record',
          onTap: () {},
          color: Color(0xff941420),
        )),
        DataCell(Text('')),
        DataCell(RoundButton(
          text: 'Close Enquiry',
          onTap: () {},
          color: Color(0xff941420),
        )),
        DataCell(Text('2023-11-10')),
        DataCell(Text('12:02 PM')),
        DataCell(RoundButton(
          text: 'Hot Leads',
          onTap: () {},
          color: Color(0xff941420),
        )),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        )),
      ])
    ];

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
              'Enquiry Status',
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
              'Supply Type',
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
              'Post Code',
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
              'Configuration Code',
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
              'File Upload (From Enquiry Form)',
              style: TextStyle(color: Colors.white),
            ),
          )),
          DataColumn(
              label: Expanded(
            child: Text(
              'Enquiry Record',
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
              'Enquiry Date',
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
              'Hot Leads',
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
