import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminHotleads.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:price_link/services/pdfService.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class EnquiryRecordForAdmin extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final AdminHotLeadsModel? enquiries;
  const EnquiryRecordForAdmin(
      {super.key,
       this.dealerId,
       this.dealerName,
      this.enquiries});

  @override
  State<EnquiryRecordForAdmin> createState() => _EnquiryRecordForAdminState();
}

class _EnquiryRecordForAdminState extends State<EnquiryRecordForAdmin> {
  @override
  Widget build(BuildContext context) {
    showImageDialog(BuildContext context, List<dynamic> imageUrl) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                insetPadding: EdgeInsets.all(9),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: imageUrl
                          .map(
                            (imageUrl) => SizedBox(
                              height: 200.0, // Set the height as needed
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ));
    }

    final TextEditingController app1 = TextEditingController();
    final TextEditingController app2 = TextEditingController();
    final TextEditingController app3 = TextEditingController();
    final TextEditingController app4 = TextEditingController();
    final TextEditingController app5 = TextEditingController();
    final TextEditingController app6 = TextEditingController();
    final TextEditingController app7 = TextEditingController();
    final TextEditingController app8 = TextEditingController();
    final TextEditingController app9 = TextEditingController();
    final TextEditingController app10 = TextEditingController();
    final TextEditingController rkdsTop = TextEditingController();
    final TextEditingController rkds1 = TextEditingController();
    final TextEditingController rkds2 = TextEditingController();
    final TextEditingController rkds3 = TextEditingController();
    final TextEditingController rkds4 = TextEditingController();
    final TextEditingController rkds5PartTwo = TextEditingController();
    final TextEditingController rkds5 = TextEditingController();
    final TextEditingController rkds6 = TextEditingController();
    final TextEditingController rkds7 = TextEditingController();
    final TextEditingController rkds8 = TextEditingController();
    final TextEditingController survey = TextEditingController();
    final TextEditingController rkds9 = TextEditingController();
    NetworkApiServices apiServices = NetworkApiServices();

    return Scaffold(
      
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
                  widget.enquiries != null ? widget.enquiries!.enquiryCusName! : "",
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
                  Text(widget.enquiries != null ? widget.enquiries!.date! : ""),
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
                  Text(widget.enquiries != null ? widget.enquiries!.enquiryCusName! : ""),
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
                            0.7), // Adjust maxWidth as needed
                    child: Text(
                      '${widget.enquiries != null ? widget.enquiries!.customerAddress : ""} ${widget.enquiries != null ? widget.enquiries!.customerAddress2 : ""} ${widget.enquiries != null ? widget.enquiries!.customerAddress3 : ""} ${widget.enquiries != null ? widget.enquiries!.customerAddress4 : ""}',
                      textAlign: TextAlign.end,
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
                  Text(widget.enquiries != null ? widget.enquiries!.enquiryTelNum! : ""),
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
                  Text(widget.enquiries != null ? widget.enquiries!.enquiryCusEmail! : ""),
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
                  Text(widget.enquiries != null ? widget.enquiries!.enquirySource! : ""),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text('Notes'),
                  TextFormField(
                    initialValue: widget.enquiries != null ? widget.enquiries!.enquiryNotes : "",
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
                source: MyData(context, rkds1, rkds2, rkds3, rkds4,
                    rkds5PartTwo, rkds5, rkds6, rkds7, rkds8, survey, rkds9)),
            SizedBox(
              height: 15,
            ),
            PaginatedDataTable(
                rowsPerPage: 5,
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
                source: MyDataTwo(context, app1, app2, app3, app4, app5, app6,
                    app7, app8, app9, app10)),
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
                widget.enquiries != null && widget.enquiries!.enquiryOrderConfFile!.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          List<dynamic> imageUrl =
                              widget.enquiries!.enquiryOrderConfFile!;
                          showImageDialog(context, imageUrl);
                        },
                        child: Center(
                            child: Icon(
                          Icons.file_download,
                          size: 18,
                        )),
                      )
                    : Text(""),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('File upload From Quotation'),
                  ],
                ),
                widget.enquiries != null && widget.enquiries!.enquiryFileUpload!.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          List<dynamic> imageUrl =
                              widget.enquiries!.enquiryFileUpload!;
                          showImageDialog(context, imageUrl);
                        },
                        child: Center(
                            child: Icon(
                          Icons.file_open,
                          size: 18,
                          color: Colors.blue,
                        )),
                      )
                    : Text(""),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Design File upload From Quotation'),
                  ],
                ),
                widget.enquiries != null && widget.enquiries!.enquiryDoorsedignfileToUpload!.isNotEmpty
                    ? Center(
                        child: Icon(
                        Icons.file_open,
                        size: 18,
                      ))
                    : Text(""),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              onTap: () async {
                //PdfService().createPDF(widget.enquiries!);
                // final pdfFile = await PdfService()
                //     .generateEnquiryDetailsPDF(widget.enquiries);
                // PdfService().openFile(pdfFile);
              },
              width: MediaQuery.sizeOf(context).width * 0.3,
              color: Colors.black,
              text: 'Create PDF',
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
              onTap: () {
                apiServices.saveEnquiryRecord(
                    widget.enquiries != null ? widget.enquiries!.id! : "",
                    widget.dealerId ?? "",
                    "",
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate1,
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate2,
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate3,
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate4,
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate5,
                    Provider.of<EnquiryDetailsDate>(context, listen: false)
                        .formattedDate6,
                    rkds1.text,
                    rkds2.text,
                    rkds3.text,
                    rkds4.text,
                    rkds5PartTwo.text,
                    rkds5.text,
                    rkds6.text,
                    rkds7.text,
                    rkds8.text,
                    survey.text,
                    rkds9.text,
                    app1.text,
                    app2.text,
                    app3.text,
                    app4.text,
                    app5.text,
                    app6.text,
                    app7.text,
                    app8.text,
                    app9.text,
                    app10.text,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue2,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue3,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue4,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue5,
                    Provider.of<EnquiryDropdown>(context, listen: false)
                        .defaultValue6);
              },
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
  TextEditingController app1 = TextEditingController();
  TextEditingController app2 = TextEditingController();
  TextEditingController app3 = TextEditingController();
  TextEditingController app4 = TextEditingController();
  TextEditingController app5 = TextEditingController();
  TextEditingController app6 = TextEditingController();
  TextEditingController app7 = TextEditingController();
  TextEditingController app8 = TextEditingController();
  TextEditingController app9 = TextEditingController();
  TextEditingController app10 = TextEditingController();

  BuildContext context;

  //final List<EnquiriesModel> data;

  @override
  int get rowCount => 5;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  MyDataTwo(this.context, this.app1, this.app2, this.app3, this.app4, this.app5,
      this.app6, this.app7, this.app8, this.app9, this.app10);

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(
              controller: app1,
            )),
            DataCell(TextField(
              controller: app2,
            )),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(
              controller: app3,
            )),
            DataCell(TextField(
              controller: app4,
            )),
          ],
        );

      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(
              controller: app5,
            )),
            DataCell(TextField(
              controller: app6,
            )),
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(
              controller: app7,
            )),
            DataCell(TextField(
              controller: app8,
            )),
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(
              controller: app9,
            )),
            DataCell(TextField(
              controller: app10,
            )),
          ],
        );

      default:
        return null;
    }
  }
}

class MyData extends DataTableSource {
  TextEditingController rkds1 = TextEditingController();
  TextEditingController rkds2 = TextEditingController();
  TextEditingController rkds3 = TextEditingController();
  TextEditingController rkds4 = TextEditingController();
  TextEditingController rkds5Part2 = TextEditingController();
  TextEditingController rkds5 = TextEditingController();
  TextEditingController rkds6 = TextEditingController();
  TextEditingController rkds7 = TextEditingController();
  TextEditingController rkds8 = TextEditingController();
  TextEditingController survey = TextEditingController();
  TextEditingController rkds9 = TextEditingController();
  BuildContext context;
  //final List<EnquiriesModel> data;

  @override
  int get rowCount => 6;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  MyData(
      this.context,
      this.rkds1,
      this.rkds2,
      this.rkds3,
      this.rkds4,
      this.rkds5,
      this.rkds5Part2,
      this.rkds6,
      this.rkds7,
      this.rkds8,
      this.survey,
      this.rkds9);

  _showDatePicker(String initialDate, Function(DateTime)? onDateSelected) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      if (value != null) {
        onDateSelected!(value);
      }
    });
  }

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            //controller: confcode,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds1,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  Provider.of<EnquiryDropdown>(context, listen: false)
                      .updateSelectedValueOne(newValue!);
                },
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
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    _showDatePicker(DateTime.now().toString(), (value) {

                    });
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
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds2,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds3,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue2,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {

                },
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
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    DateButton(
                      onTap: () {
                        _showDatePicker(DateTime.now().toString(), (value) {

                        });
                      },
                      icon: Icons.calendar_month,
                    );
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
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds4,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds5Part2,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue3,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Provider.of<EnquiryDropdown>(context, listen: false)
                    //     .updateSelectedValueThree(newValue);
                  }
                },
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
                // Text(Provider.of<EnquiryDetailsDate>(context, listen: false)
                //     .formattedDate3
                //     .toString()),
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    _showDatePicker(
                      DateTime.now().toString(),
                    (value){

                    }
                    );
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
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds5,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds6,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue4,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Provider.of<EnquiryDropdown>(context, listen: false)
                    //     .updateSelectedValueFour(newValue);
                    // print('Dropdown Value: $newValue');
                  }
                },
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
                // Text(Provider.of<EnquiryDetailsDate>(context, listen: false)
                //     .formattedDate4
                //     .toString()),
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    DateButton(
                      onTap: () {
                        _showDatePicker(
                          Provider.of<EnquiryDetailsDate>(context,
                                  listen: false)
                              .formattedDate4,
                          (newDateTime) {
                            Provider.of<EnquiryDetailsDate>(context,
                                    listen: false)
                                .updateDateTime4(newDateTime);
                          },
                        );
                      },
                      icon: Icons.calendar_month,
                    );
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
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds7,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds8,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue5,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Provider.of<EnquiryDropdown>(context, listen: false)
                    //     .updateSelectedValueFive(newValue);
                    // print('Dropdown Value: $newValue');
                  }
                },
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
                // Text(Provider.of<EnquiryDetailsDate>(context, listen: false)
                //     .formattedDate5
                //     .toString()),
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    DateButton(
                      onTap: () {
                        _showDatePicker(
                          Provider.of<EnquiryDetailsDate>(context,
                                  listen: false)
                              .formattedDate5,
                          (newDateTime) {
                            Provider.of<EnquiryDetailsDate>(context,
                                    listen: false)
                                .updateDateTime5(newDateTime);
                          },
                        );
                      },
                      icon: Icons.calendar_month,
                    );
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
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: survey,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(Container(
          margin: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
            controller: rkds9,
            onEditingComplete: () {
              // String value = confcode.text;
              // apiServices.setOrderNum(
              //       quote.id!, dealerData.userId, value);
            },
          ))),
            DataCell(
              DropdownButton<String>(
                isExpanded: true,
                value: Provider.of<EnquiryDropdown>(context, listen: false)
                    .defaultValue6,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  Provider.of<EnquiryDropdown>(context, listen: false)
                      .updateSelectedValueSixth(newValue!);
                },
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
                Text(DateFormat('yyyy-MM-dd').format(DateTime.now()) ),
                DateButton(
                  onTap: () {
                    _showDatePicker(
                      Provider.of<EnquiryDetailsDate>(context, listen: false)
                          .formattedDate6,
                      (newDateTime) {
                        Provider.of<EnquiryDetailsDate>(context, listen: false)
                            .updateDateTime6(newDateTime);
                      },
                    );
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
