import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:price_link/models/enquiriesModel.dart';
import 'package:http/http.dart' as http;

class PdfService {
  Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Widget enquiryDetailsTable(EnquiriesModel model) {
    final Headers = ["Quote Number", "Comments", "Product", "Date"];

    return TableHelper.fromTextArray(
        headers: Headers,
        data: [
          ['123456789', 'Test', 'Coffee', '12/12/2023'],
          ['789654321', 'Tested', 'Tea', '20/12/2023'],
        ],
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        headerDecoration: BoxDecoration(color: PdfColors.grey300),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.center,
          1: Alignment.center,
          2: Alignment.center,
          3: Alignment.center,
        });
  }

  static Widget enquiryDetailsTableTwo(EnquiriesModel model) {
    final Headers = ["Appointment", "Communication Logs"];

    return TableHelper.fromTextArray(
        headers: Headers,
        data: [
          ['123456789', 'Test'],
          ['789654321', 'Tested'],
        ],
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        headerDecoration: BoxDecoration(color: PdfColors.grey300),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.center,
          1: Alignment.center,
          2: Alignment.center,
          3: Alignment.center,
        });
  }

  Future<File> generateEnquiryDetailsPDF(EnquiriesModel model) async {
    final pdf = Document();

    final font = await rootBundle.load("assets/fonts/Montserrat-Regular.ttf");
    final ttf = Font.ttf(font);
    // Add a page to the document
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Center(
                  child: Text('RK Door Customer Enquiry Log',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              SizedBox(height: 35),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Date: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.date!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Customer Name: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.enquiryCusName!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Address',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    '${model.customerAddress} ${model.customerAddress2} ${model.customerAddress3} ${model.customerAddress4}')
              ]),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Telephone: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.enquiryTelNum ?? "",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.enquiryCusEmail ?? "",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lead Source: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.enquirySource ?? "",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Notes: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextField(name: model.enquiryNotes ?? "", maxLength: 6),
                ],
              ),
              SizedBox(height: 25),
              enquiryDetailsTable(model),
              SizedBox(height: 25),
              enquiryDetailsTableTwo(model)
            ],
          ); // Center
        }));
    return saveDocument(name: 'Rk-Door-Systems.pdf', pdf: pdf);
  }
}
