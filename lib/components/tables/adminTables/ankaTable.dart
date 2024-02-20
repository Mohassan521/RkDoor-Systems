import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class AdminAnkaTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminAnkaTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminAnkaTable> createState() => _AdminAnkaTableState();
}

class _AdminAnkaTableState extends State<AdminAnkaTable> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<SteelOrderModel>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder<List<SteelOrderModel>>(
      future: apiServices.allSteelOrders(context, widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        List<SteelOrderModel> filteredList =
            Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        List<SteelOrderModel>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                  ? 5
                  : (list!.isEmpty)
                      ? 1
                      : list!.length,
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff941420)),
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'Customer Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Date Added',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anka Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Order No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Factory Delivery Week',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Production Start Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Details',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anka Items',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'File Upload',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Support',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Completed Orders',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  displayData, context, widget.dealerId, widget.dealerName)),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<SteelOrderModel>? data;
  final String dealerId;
  final String dealerName;

  MyData(this.data, this.context, this.dealerId, this.dealerName);

  @override
  int get rowCount => data!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  SteelOrderModel table = SteelOrderModel();

  File? _image;
  List<File> filesToUpload = [];
  Future<List<File>> getImage() async {
    final _picker = ImagePicker();

    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      filesToUpload.clear();
      filesToUpload.add(_image!);
      return filesToUpload;
    } else {
      print('no image selected');
      return [];
    }
  }

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

  @override
  DataRow getRow(int index) {
    final SteelOrderModel result = data![index];
    TextEditingController factoryValue = TextEditingController();
    TextEditingController factoryDeliveryWeek = TextEditingController();
    factoryDeliveryWeek.text = result.steelFacWeekVal ?? "";
    factoryValue.text = result.steelFacOrderNoVal ?? "";

    List<dynamic> steelOrderFile = result.steelOrderConfFile ?? [];
    String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.first : '';
    String fileExtension = extension(filePath).toLowerCase();

    List<dynamic> invoices = result.steelInvoices ?? [];
    String invoicesFilePath = invoices.isNotEmpty ? invoices.first : '';
    String invoiceFileExtension = extension(invoicesFilePath).toLowerCase();

    List<dynamic> delNotes = result.steelDelNotes ?? [];
    String delNotesFilePath = delNotes.isNotEmpty ? delNotes.first : '';
    String delNotesFileExtension = extension(delNotesFilePath).toLowerCase();

    List<dynamic> pdfUrl = result.manualPDFImageURL ?? [];
    String pdfUrlFilePath = pdfUrl.isNotEmpty ? pdfUrl.first : '';
    String pdfUrlFileExtension = extension(pdfUrlFilePath).toLowerCase();

    List<dynamic> pdfImageUrl = result.pDFImageURL ?? [];
    String pdfImageUrlFilePath =
        pdfImageUrl.isNotEmpty ? pdfImageUrl.first : '';
    String pdfImageUrlFileExtension =
        extension(pdfImageUrlFilePath).toLowerCase();

    TextEditingController notesController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    NetworkApiServices apiServices = NetworkApiServices();
    return DataRow.byIndex(index: index, cells: <DataCell>[
      //1
      DataCell(Text("")),
      //2
      DataCell(Text("")),
      //3
      DataCell(Text('')),
      //4
      DataCell(Text('')),
      //5
      DataCell(Text('')),
      //6
      DataCell(Text("")),
      //7
      DataCell(Text("")),
      //8
      DataCell(Text("")),
      //9
      DataCell(Text("")),
      //10
      DataCell(Text("")),
      //11
      DataCell(Text('')),
      //12
      DataCell(Text('')),
      //13
      DataCell(Text('')),
      //14
    ]);
  }
}
