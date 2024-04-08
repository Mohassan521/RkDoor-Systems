import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/models/admin%20models/dealersList.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class DealerListTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const DealerListTable({super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<DealerListTable> createState() => _DealerListTableState();
}

class _DealerListTableState extends State<DealerListTable> {
  DateTime _dateTime = DateTime.now();
  String? prevValue;
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
    NetworkApiServices apiServices = NetworkApiServices();

    return FutureBuilder(
      future: apiServices.getDealersListForAdmin(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<DealersList>? list = snapshot.data ?? [];

        List<DealersList> filteredList =
            Provider.of<allDealersList>(context).filteredDataModel;
        List<DealersList>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        // List<ClosedEnquiryModel> filteredList =
        //     Provider.of<ClosedEnquiriesSearchedData>(context).filteredDataModel;
        // List<ClosedEnquiryModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return Consumer<PaginationProvider>(builder: (context, value, child) {
          return PaginatedDataTable(
              showEmptyRows: false,
              columnSpacing: 20,
              headingRowHeight: 48,
              dataRowMaxHeight: 48,
              rowsPerPage: (list.length >= 5 && list.isNotEmpty)
                  ? 5
                  : (list.isEmpty)
                      ? 1
                      : list.length,
              columns: const <DataColumn>[
                DataColumn(
                    label: Text(
                  'ID',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Name',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Company Details',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Address (Line 1)',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Address (Line 2)',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Address (Line 3)',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Post Code',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Tel',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Email',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Date & Time Quote Created',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Type',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'License Type',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'License Status',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'License Expiry Date',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Support Member',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Marketing Images',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Marketing Images User Record',
                  style: TextStyle(color: Color(0xff941420)),
                )),
                DataColumn(
                    label: Text(
                  'Actions',
                  style: TextStyle(color: Color(0xff941420)),
                )),
              ],
              source: MyData(displayData, context, widget.dealerId ?? "",
                  widget.dealerName ?? ""));
        });
      },
    );
  }
}

class MyData extends DataTableSource {
  final BuildContext context;
  final List<DealersList>? data;
  final String dealerId;
  final String dealerName;

  MyData(this.data, this.context, this.dealerId, this.dealerName);

  @override
  int get rowCount => data!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  // File? _image;
  // List<File> filesToUpload = [];
  // Future<List<File>> getImage() async {
  //   final _picker = ImagePicker();

  //   final pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

  //   if (pickedFile != null) {
  //     _image = File(pickedFile.path);
  //     filesToUpload.clear();
  //     filesToUpload.add(_image!);
  //     return filesToUpload;
  //   } else {
  //     print('no image selected');
  //     return [];
  //   }
  // }

  // showImageDialog(BuildContext context, List<dynamic> imageUrl) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10))),
  //             insetPadding: EdgeInsets.all(9),
  //             content: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Stack(
  //                   children: imageUrl
  //                       .map(
  //                         (imageUrl) => SizedBox(
  //                           height: 200.0, // Set the height as needed
  //                           child: Image.network(
  //                             imageUrl,
  //                             fit: BoxFit.fill,
  //                           ),
  //                         ),
  //                       )
  //                       .toList(),
  //                 ),
  //               ],
  //             ),
  //           ));
  // }

  @override
  DataRow getRow(int index) {
    final result = data![index];
    // TextEditingController factoryValue = TextEditingController();
    // TextEditingController factoryDeliveryWeek = TextEditingController();
    // factoryDeliveryWeek.text = result.steelFacWeekVal ?? "";
    // factoryValue.text = result.steelFacOrderNoVal ?? "";

    //NetworkApiServices apiServices = NetworkApiServices();

    TextEditingController supportMember = TextEditingController();
    supportMember.text = result.supportMember ?? "";

    String status = result.marketingImages ?? "";

    return DataRow.byIndex(
        color: MaterialStatePropertyAll(Colors.white),
        index: index,
        cells: <DataCell>[
          //1
          DataCell(Text(result.iD.toString())),
          //2
          DataCell(Text(result.name ?? "")),
          //3
          DataCell(Text(result.dealerName ?? "")),
          //4
          DataCell(Text(result.dealerAddress1 ?? "")),
          //5
          DataCell(Text(result.dealerAddress2 ?? "")),
          //6
          DataCell(Text(result.dealerAddress3 ?? "")),

          DataCell(Text(result.postCodeRegister ?? "")),

          DataCell(Text(result.telephone ?? "")),

          DataCell(Text(result.email ?? "")),

          DataCell(Text(result.userRegistered ?? "")),

          DataCell(Center(
            child: DropdownButton<String>(
              value: (result.dealerType == "") ? "" : result.dealerType,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                //newValue = result.orderFollowup;
                if (newValue != null) {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(newValue: newValue, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, newValue);
                } else {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(
                  //         newValue: result.orderFollowup, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, result.orderFollowup!);
                }
              },
              items: [
                DropdownMenuItem<String>(value: '', child: Text('')),
                DropdownMenuItem<String>(value: 'TRADE', child: Text('TRADE')),
                DropdownMenuItem<String>(
                    value: 'TRADE DEALER', child: Text('TRADE DEALER')),
                DropdownMenuItem<String>(
                    value: 'RKDS DEALER', child: Text('RKDS DEALER')),
                DropdownMenuItem<String>(
                    value: 'RKDS PREMIER DEALER',
                    child: Text('RKDS PREMIER DEALER')),
                DropdownMenuItem<String>(
                    value: 'RK ALUMINIUM', child: Text('RK ALUMINIUM')),
                DropdownMenuItem<String>(
                    value: 'IQ GLASS', child: Text('IQ GLASS')),
              ],
            ),
          )),
          DataCell(Center(
            child: DropdownButton<String>(
              value: (result.lDealer == "") ? "" : result.lDealer,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                //newValue = result.orderFollowup;
                if (newValue != null) {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(newValue: newValue, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, newValue);
                } else {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(
                  //         newValue: result.orderFollowup, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, result.orderFollowup!);
                }
              },
              items: [
                DropdownMenuItem<String>(value: '', child: Text('')),
                DropdownMenuItem<String>(
                    value: '2 user', child: Text('2 user')),
                DropdownMenuItem<String>(
                    value: '4 user', child: Text('4 user')),
                DropdownMenuItem<String>(
                    value: '6 user', child: Text('6 user')),
                DropdownMenuItem<String>(
                    value: '10 user', child: Text('10 user')),
              ],
            ),
          )),
          DataCell(Center(
            child: DropdownButton<String>(
              value: (result.lStatus == "") ? "" : result.lStatus,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                //newValue = result.orderFollowup;
                if (newValue != null) {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(newValue: newValue, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, newValue);
                } else {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(
                  //         newValue: result.orderFollowup, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, result.orderFollowup!);
                }
              },
              items: [
                DropdownMenuItem<String>(value: '', child: Text('')),
                DropdownMenuItem<String>(
                    value: 'active', child: Text('active')),
                DropdownMenuItem<String>(
                    value: 'inactive', child: Text('inactive')),
              ],
            ),
          )),
          DataCell(Row(
            children: [
              Text(result.lDate != "" ? result.lDate! : ""),
              DateButton(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  );

                  if (pickedDate != null) {
                    // value.setDate(result.id!, pickedDate);
                    // apiServices.setFollowUpOrderDate(
                    //     dealerId!, result.id!, pickedDate);
                  }
                },
                icon: Icons.calendar_month,
              )
            ],
          )),
          DataCell(Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
                controller: supportMember,
                onChanged: (value) {
                  // Timer(Duration(seconds: 5), () {
                  //   apiServices.factoryDeliveryWeekSteelOrder(
                  //       dealerId, value, result.id!);
                  // });
                },
              ))),
          DataCell(Center(
            child: DropdownButton<String>(
              value: status,
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                //newValue = result.orderFollowup;
                if (newValue != null) {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(newValue: newValue, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, newValue);
                } else {
                  // Provider.of<setFollowUpOrderValue>(context, listen: false)
                  //     .changeValue(
                  //         newValue: result.orderFollowup, quoteId: result.id!);
                  // apiServices.setFollowUpOrderValue(
                  //     dealerId!, result.id!, result.orderFollowup!);
                }
              },
              items: [
                DropdownMenuItem<String>(value: "", child: Text("")),
                DropdownMenuItem<String>(value: 'YES', child: Text('YES')),
                DropdownMenuItem<String>(value: 'NO', child: Text('NO')),
              ],
            ),
          )),
          DataCell(result.userMarketingRecord != null &&
                  result.userMarketingRecord!.isNotEmpty
              ? Text('Marketing Record Available')
              : Text('No Record of Marketing Images')),
          //7
          DataCell(Row(
            children: [
              Icon(
                Icons.edit,
                size: 14,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
                size: 14,
              ),
            ],
          )),
        ]);
  }
}
