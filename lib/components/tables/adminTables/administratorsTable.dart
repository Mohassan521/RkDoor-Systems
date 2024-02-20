import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
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
                  'ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Date & Time Administrator Created',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Actions',
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

    //NetworkApiServices apiServices = NetworkApiServices();
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
    ]);
  }
}
