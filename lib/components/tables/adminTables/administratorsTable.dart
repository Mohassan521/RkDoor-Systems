import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/admin%20models/administratorsModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AdministratorsTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdministratorsTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdministratorsTable> createState() => _AdministratorsTableState();
}

class _AdministratorsTableState extends State<AdministratorsTable> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<AdminModel>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder(
      future: apiServices.getAllAdmins(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data!;

        List<AdminModel> filteredList =
            Provider.of<AllAdministratorsSearchedData>(context)
                .filteredDataModel;
        List<AdminModel>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
            columnSpacing: 20,
            showEmptyRows: false,
            dataRowMaxHeight: 48,
            headingRowHeight: 48,
            rowsPerPage: (list!.length >= 5 && list!.isNotEmpty)
                ? 5
                : (list!.isEmpty)
                    ? 1
                    : list!.length,
            columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'ID',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'Name',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'Post Code',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'Tel No.',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Center(
                child: Text(
                  'Email',
                  style: TextStyle(color: Color(0xff941420)),
                ),
              )),
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'Date & Time Administrator Created',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                textAlign: TextAlign.center,
                'Actions',
                style: TextStyle(color: Color(0xff941420)),
              )),
            ],
            source: MyData(
                displayData, context, widget.dealerId, widget.dealerName));
      },
    );
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<AdminModel>? data;
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
    final result = data![index];
    return DataRow.byIndex(
        color: MaterialStatePropertyAll(Colors.white),
        index: index,
        cells: <DataCell>[
          //1
          DataCell(Text(
            result.iD.toString(),
            style: TextStyle(fontSize: 12.5),
          )),
          //2
          DataCell(Text(
            result.name ?? "",
            style: TextStyle(fontSize: 12.5),
          )),
          //3
          DataCell(Center(
              child: Text(
            result.postCode ?? "",
            style: TextStyle(fontSize: 12.5),
          ))),
          //4
          DataCell(Text(
            result.tel ?? "",
            style: TextStyle(fontSize: 12.5),
          )),
          //5
          DataCell(Text(
            result.email ?? "",
            style: TextStyle(fontSize: 12.5),
          )),
          //6
          DataCell(Center(
              child: Text(
            result.registeredUser ?? "",
            style: TextStyle(fontSize: 12.5),
          ))),
          //7
          DataCell(Center(
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 12.5,
            ),
          )),
        ]);
  }
}
