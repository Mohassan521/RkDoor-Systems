import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminQuotesModel.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';

class QueueAllocationTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const QueueAllocationTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<QueueAllocationTable> createState() => _QueueAllocationTableState();
}

class _QueueAllocationTableState extends State<QueueAllocationTable> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<CompleteResponse>? list = [];

  @override
  Widget build(BuildContext context) {
    print(widget.dealerId);
    print(widget.dealerName);

    DateTime _dateTime = DateTime.now();
  NetworkApiServices apiServices = NetworkApiServices();

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

    return FutureBuilder(
      future: apiServices.getAdminQuotes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        list = snapshot.data ?? [];

        // List<SteelOrderModel> filteredList =
        //     Provider.of<AllSteelOrdersData>(context).filteredSteelOrderList;
        // List<SteelOrderModel>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

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
                  'Username',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Number',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote ID',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Name',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No.',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Email',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Post Code',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Total Quote Value (inc. VAT)',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Sale Bonus',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Follow Up Made',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Action',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Dealer Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Allocate To Other Users',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                  list ?? [],
                widget.dealerId,
                dealerName: widget.dealerName!,
                                context: context,
                                datetime: _dateTime,
                showDatePickerCallback: _showDatePicker,
                )),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<CompleteResponse> dealerDataList;
  TextEditingController notesController = TextEditingController();
  final String? dealerId;
  final String dealerName;
  final String? empId;
  final DateTime datetime;
  final BuildContext context;
  final void Function() showDatePickerCallback;
  //final void Function() getSavedValue;
  MyData(
    this.dealerDataList,
    this.dealerId, {
    required this.dealerName,
    required this.datetime,
    required this.context,
    required this.showDatePickerCallback,
    this.empId
    //required this.getSavedValue
  });


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

  @override
  DataRow? getRow(int index) {
    if (index >= totalRowCount) return null;

  //   showImageDialog(BuildContext context, String imageUrl) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10))),
  //       insetPadding: EdgeInsets.all(9),
  //       content: SizedBox(
  //         height: 200.0, // Set the height as needed
  //         child: Image.network(
  //           imageUrl,
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //     ),
  //   );
  // }

    var enqAllocatedTo;
    String dealerType = "";
    int currentIndex = 0;
    for (var dealerData in dealerDataList) {
      for (var quote in dealerData.quotes) {
        
    //     TextEditingController configuratorCode = TextEditingController();
    //     configuratorCode.text = quote.enquiryConfCode ?? "";

    //     List<dynamic> fileUpload = quote.enquiryOrderConfFile ?? [];
    // String fileUploadPath= fileUpload.isNotEmpty ? fileUpload.first : '';
    // String fileuploadExtension= extension(fileUploadPath).toLowerCase();

    // List<dynamic> enquiryFormFileUpload = quote.enquiryOrderConfFile ?? [];
    // String enqFormFileUpload = enquiryFormFileUpload.isNotEmpty ? enquiryFormFileUpload.first : '';
    // String enqFormExtension= extension(enqFormFileUpload).toLowerCase();


        if (currentIndex == index) {
          return DataRow.byIndex(
            index: index,
            cells: [
              DataCell(Text(quote.name ?? "")),
              DataCell(Text(dealerData.displayName ?? "")),
              DataCell(Text(quote.quotationNumber ?? "")),
              DataCell(Text(dealerData.dealerName ?? "")),
              DataCell(Text(quote.id ?? "")),
              DataCell(Text(quote.telephoneNumber ?? "")),
              DataCell(Text(quote.customerEmail ?? "")),
              DataCell(Text(quote.deliveryPostCode ?? "")),
              DataCell(Text(quote.date ?? "")),
              DataCell(Text(quote.time ?? "")),
              DataCell(Text(quote.wholeTotal ?? "")),
              DataCell(Text(quote.saleBonus ?? "")),
              
              DataCell(Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (quote.orderDateQArray != null)
                      ? quote.orderDateQArray!
                      : "mm/dd/yyyy",
                  style: TextStyle(fontSize: 12),
                ),
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
                      // apiServices.setAnticipatedDate(
                      //     dealerId, result.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ],
            )),
              DataCell(Consumer<setFollowUpValue>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width * 0.4,
              decoration: BoxDecoration(
                  color: quote.orderFUpQVal == "YES"
                      ? Color(0Xff008000)
                      : Color(0xffFF0000),
                  border: Border.all(width: 1)),
              child: DropdownButton<String>(
                isExpanded: true,
                value: quote.orderFUpQVal ?? "NO",
                iconEnabledColor: quote.orderFUpQVal == "YES"
                    ? Color(0Xff008000)
                    : Color(0xffFF0000),
                onChanged: (String? newValue) {
                  // if (newValue != null) {
                  //   apiServices.setFollowUpValue(
                  //       dealerId!, result.id!, newValue);
                  // } else {
                  //   apiServices.setFollowUpValue(
                  //       dealerId!, result.id!, result.orderFUpQVal!);
                  // }
                },
                items: [
                  DropdownMenuItem<String>(
                      value: '',
                      alignment: Alignment.center,
                      child: Text(
                        '',
                        style: TextStyle(color: Colors.black),
                      )),
                  DropdownMenuItem<String>(
                      value: 'YES',
                      alignment: Alignment.center,
                      child: Text(
                        'YES',
                        style: TextStyle(color: Colors.black),
                      )),
                  DropdownMenuItem<String>(
                      value: 'NO',
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'NO',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      )),

              DataCell(RoundButton(
                onTap: () {},
                text: "Quote Analysis",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(RoundButton(
                onTap: () {},
                text: "Notes",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(RoundButton(
                onTap: () {},
                text: "Create Order",
                height: MediaQuery.sizeOf(context).height * 0.045,
                width: MediaQuery.sizeOf(context).width * 0.4,
                color: Colors.blue,
              )),
              DataCell(DropdownButton<String>(
                value: dealerType,
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
                  DropdownMenuItem<String>(value: 'TRADE DEALER', child: Text('TRADE DEALER')),
                  DropdownMenuItem<String>(value: 'RKDS Dealer', child: Text('RKDS Dealer')),
                  DropdownMenuItem<String>(value: 'RKDS Premier DEALER', child: Text('RKDS Premier DEALER')),
                  DropdownMenuItem<String>(value: 'IQ Glass', child: Text('IQ Glass')),
                ],
              ),),
              DataCell(FutureBuilder<List<AllDealersModel>>(
                future: NetworkApiServices().getAllDealers(), 
                builder: ((context, snapshot) {
                  return  DropdownButton<String>(

                value: enqAllocatedTo,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (newValue) {
                  enqAllocatedTo = newValue ?? "";
                  
                },
                items: snapshot.data != null ? snapshot.data!.map((e) {
                  print("name present in API: ${e.name}");
                  return DropdownMenuItem(
                    value: e.name ?? "",
                    child: Center(child: Text(e.name ?? "")));
                }).toList() : [],
              );

                
              })),
),
              DataCell(Row(
        children: [
          Icon(Icons.edit, size: 14,),
          Icon(Icons.copy, size: 14,),
          Icon(Icons.delete, color: Colors.red,size: 14,),
        ],
      ))
              
            ],
          );
        }
        currentIndex++;
      }
    }
    return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRowCount;

  @override
  int get selectedRowCount => 0;

  int get totalRowCount {
    int count = 0;
    for (var dealerData in dealerDataList) {
      count += dealerData.quotes.length;
    }
    return count;
  }
}
