import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/enquiriesModel.dart';

class EnquiryDetails extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final EnquiriesModel? enquiries;
  const EnquiryDetails(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.enquiries});

  @override
  State<EnquiryDetails> createState() => _EnquiryDetailsState();
}

class _EnquiryDetailsState extends State<EnquiryDetails> {
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
    String formattedDate = DateFormat('MM/dd/yyyy').format(_dateTime);
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: Text(
          'RkDoor Customer Enquiry Log',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Customer: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.enquiries!.enquiryCusName!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date: '),
                  Text(widget.enquiries!.date!),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Customer Name: '),
                  Text(widget.enquiries!.enquiryCusName!),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address: '),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width *
                            0.58), // Adjust maxWidth as needed
                    child: Text(
                      widget.enquiries!.customerAddress!,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Telephone: '),
                  Text(widget.enquiries!.enquiryTelNum!),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email: '),
                  Text(widget.enquiries!.enquiryCusEmail!),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lead Source: '),
                  Text(widget.enquiries!.enquirySource!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text('Notes'),
                  TextFormField(
                    initialValue: widget.enquiries!.enquiryNotes,
                    maxLines: 5,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            PaginatedDataTable(
                rowsPerPage: 6,
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff941420)),
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'Quote Number',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Comments',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Product',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                source: MyData(context, _showDatePicker, formattedDate)),
            SizedBox(
              height: 15,
            ),
            PaginatedDataTable(
                rowsPerPage: 6,
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Color(0xff941420)),
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'APPOINTMENT',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'COMMUNICATION LOGS',
                    style: TextStyle(color: Colors.white),
                  ))
                ],
                source: MyDataTwo(context)),
            SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('File upload From Order Folder'),
                  ],
                ),
                Text((widget.enquiries!.enquiryFileUpload != [])
                    ? widget.enquiries!.enquiryFileUpload.toString()
                    : ""),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('File upload From Quotation'),
                  ],
                ),
                Text((widget.enquiries!.enquiryFileUpload != [])
                    ? widget.enquiries!.enquiryFileUpload.toString()
                    : ""),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Design File upload From Quotation'),
                  ],
                ),
                Text((widget.enquiries!.enquiryFileUpload != [])
                    ? widget.enquiries!.enquiryFileUpload.toString()
                    : ""),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              onTap: () {},
              width: MediaQuery.sizeOf(context).width * 0.3,
              color: Colors.black,
              text: 'Print PDF',
            ),
            SizedBox(
              height: 10,
            ),
            RoundButton(
              onTap: () {},
              color: Colors.blue,
              width: MediaQuery.sizeOf(context).width * 0.57,
              text: 'Create Quotation',
            ),
            SizedBox(
              height: 10,
            ),
            RoundButton(
              onTap: () {},
              color: Colors.green,
              width: MediaQuery.sizeOf(context).width * 0.6,
              text: 'Save Enquiry Record',
            ),
            SizedBox(
              height: 10,
            ),
            RoundButton(
              onTap: () {},
              color: Colors.red,
              width: MediaQuery.sizeOf(context).width * 0.3,
              text: 'Close',
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class MyDataTwo extends DataTableSource {
  BuildContext context;

  //final List<EnquiriesModel> data;

  @override
  int get rowCount => 6;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  MyDataTwo(this.context);

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );

      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );
      case 5:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
          ],
        );

      default:
        return null;
    }
  }
}

class MyData extends DataTableSource {
  BuildContext context;
  final void Function() showDatePickerCallback;
  final String datetime;
  //final List<EnquiriesModel> data;

  @override
  int get rowCount => 6;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  MyData(this.context, this.showDatePickerCallback, this.datetime);

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );

      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );
      case 5:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField()),
            DataCell(TextField()),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: 'Choose Options',
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {},
                items: [
                  DropdownMenuItem<String>(
                      value: 'Choose Options',
                      child: Center(child: Text('Choose Options'))),
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'Survey', child: Center(child: Text('Survey'))),
                  DropdownMenuItem<String>(
                      value: 'Survey & Installation',
                      child: Center(child: Text('Survey & Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
            ),
            DataCell(Row(
              children: [
                Text(datetime.toString()),
                DateButton(
                  onTap: () {
                    showDatePickerCallback();
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
          ],
        );

      default:
        return null;
    }
  }
}
