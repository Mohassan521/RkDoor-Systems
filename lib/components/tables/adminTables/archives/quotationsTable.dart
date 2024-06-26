import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminQuotesModel.dart';
import 'package:price_link/models/admin%20models/archiveQuotations.dart';
import 'package:price_link/screens/adminScreens/quoteAnalysis.dart';
import 'package:price_link/screens/calculatorWebView.dart';

import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class ArchiveQuotationsTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const ArchiveQuotationsTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<ArchiveQuotationsTable> createState() => _ArchiveQuotationsTableState();
}

class _ArchiveQuotationsTableState extends State<ArchiveQuotationsTable> {
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

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();
    print(widget.dealerName);
    return FutureBuilder(
      future: apiServices.getArchiveQuotations(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<ArchiveQuotationsModel> list = snapshot.data ?? [];

        // List<CompleteResponse> filteredList =
        //     Provider.of<QuotationsSearchedDataForAdmin>(context)
        //         .filteredDataModel;
        // List<CompleteResponse>? displayData =
        //     filteredList.isNotEmpty ? filteredList : list;

        return PaginatedDataTable(
            columnSpacing: 20,
            headingRowHeight: 48,
            dataRowMaxHeight: 48,
            showEmptyRows: false,
            rowsPerPage: 5,
            columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Username',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quotation Number',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Dealer',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quote ID',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Customer Tel No.',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Customer Email',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Post Code',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Date',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Time',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Profile',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Door Model',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Total Quote Value (inc. VAT)',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Installation Cost',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Delivery Cost',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quotation Type',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Level of Discount',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Sale Bonus',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Follow Up Date',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Follow Up Made',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quote Analysis',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Survey Form',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Action',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                '',
                style: TextStyle(color: Color(0xff941420)),
              )),
            ],
            source: MyData(
              list,
              widget.dealerId,
              dealerName: widget.dealerName!,
              context: context,
              datetime: _dateTime,
              showDatePickerCallback: _showDatePicker,
            ));
      },
    );
  }
}

class MyData extends DataTableSource {
  final List<ArchiveQuotationsModel> data;
  TextEditingController notesController = TextEditingController();
  final String? dealerId;
  final String dealerName;
  final String? empId;
  final DateTime datetime;
  final BuildContext context;
  final void Function() showDatePickerCallback;
  //final void Function() getSavedValue;
  MyData(this.data, this.dealerId,
      {required this.dealerName,
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

    return DataRow.byIndex(
      index: index,
      color: MaterialStatePropertyAll(Colors.white),
      cells: [
        DataCell(Text(
          data[index].name ?? "",
          style: TextStyle(fontSize: 12.5),
        )),
        DataCell(Text("", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].quotationNumber ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text("", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(data[index].uniqueId ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].telephoneNumber ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].customerEmail ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].dileveryPostCodeC13 ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(data[index].date ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(data[index].time ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(
            Text(data[index].profile ?? "", style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].doorModel ?? "",
            style: TextStyle(fontSize: 12.5))),

        DataCell(Text(data[index].wholeTotal ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].intallationCostForQuote ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].deliveryCostForQuote ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(
            "${data[index].randtSelectBox ?? ""}-${data[index].markupVal ?? ""}",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].discountLevelForQuote ?? "",
            style: TextStyle(fontSize: 12.5))),
        DataCell(Text(data[index].saleBonus ?? "",
            style: TextStyle(fontSize: 12.5))),

        DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (data[index].orderDateQArray != null)
                  ? data[index].orderDateQArray!
                  : "mm/dd/yyyy",
              style: TextStyle(fontSize: 12.5),
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
                  NetworkApiServices().setFollowUpDateForAdmin(data[index].id!,
                      int.parse(data[index].userId!), pickedDate);
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
                width: MediaQuery.sizeOf(context).width * 0.18,
                decoration: BoxDecoration(
                    color: data[index].orderFUpQVal == "YES"
                        ? Color(0Xff008000)
                        : Color(0xffFF0000),
                    border: Border.all(width: 1)),
                child: DropdownButton<String>(
                  style: TextStyle(fontSize: 12.5),
                  isExpanded: true,
                  value: data[index].orderFUpQVal ?? "NO",
                  iconEnabledColor: data[index].orderFUpQVal == "YES"
                      ? Color(0Xff008000)
                      : Color(0xffFF0000),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      NetworkApiServices().setFollowUpValueForAdmin(
                          data[index].id!,
                          int.parse(data[index].userId!),
                          newValue);
                    } else {
                      NetworkApiServices().setFollowUpValueForAdmin(
                          data[index].id!,
                          int.parse(data[index].userId!),
                          data[index].orderFUpQVal ?? "");
                    }
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        alignment: Alignment.center,
                        child: Text(
                          '',
                          style: TextStyle(color: Colors.black, fontSize: 12.5),
                        )),
                    DropdownMenuItem<String>(
                        value: 'YES',
                        alignment: Alignment.center,
                        child: Text(
                          'YES',
                          style: TextStyle(color: Colors.black, fontSize: 12.5),
                        )),
                    DropdownMenuItem<String>(
                        value: 'NO',
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            'NO',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.5),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        )),

        DataCell(RoundButton(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuoteAnalysisForAdmin(
                          dealerId: data[index].userId.toString(),
                          quoteId: data[index].id,
                        )));
          },
          text: "Quote Analysis",
          width: MediaQuery.sizeOf(context).width * 0.20,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          onTap: () async {
            notesController.text = data[index].notes ?? "";
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      insetPadding: EdgeInsets.all(9),
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              right: -40,
                              top: -40,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xff941420),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          Form(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                  child: Text('Enter Notes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff941420),
                                          fontWeight: FontWeight.w600))),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  maxLines: 6,
                                  // initialValue: result.notes,
                                  controller: notesController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff941420))),
                                      hintText: 'Notes'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RoundButton(
                                text: 'Save',
                                onTap: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  //   apiServices.setNotesValue(dealerId!,
                                  //       result.id!, notesController.text);
                                  // }
                                  NetworkApiServices().setNotesForAdmin(
                                      data[index].id!,
                                      int.parse(data[index].userId!),
                                      notesController.text);

                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');
                                },
                                color: Color(0xff941420),
                              )
                            ],
                          ))
                        ],
                      ),
                    ));
          },
          text: "Notes",
          width: MediaQuery.sizeOf(context).width * 0.15,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          onTap: () {},
          text: "Survey Form",
          width: MediaQuery.sizeOf(context).width * 0.23,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          onTap: () {
            NetworkApiServices()
                .createOrder(data[index].userId.toString(), data[index].id!);
          },
          text: "Create Order",
          width: MediaQuery.sizeOf(context).width * 0.20,
          height: MediaQuery.sizeOf(context).height * 0.042,
          color: Colors.blue,
        )),
        DataCell(InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Icon(Icons.warning),
                    content:
                        Text('Are u sure you want to delete this quotation'),
                    actions: [
                      Center(
                        child: Column(
                          children: [
                            RoundButton(
                              text: 'Delete',
                              onTap: () {
                                NetworkApiServices().deleteQuotes(
                                    data[index].userId.toString(),
                                    data[index].id!);
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RoundButton(
                              text: 'Cancel',
                              onTap: () {
                                Navigator.pop(context);
                              },
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                });
          },
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 14,
          ),
        ))

        // Add more cells for other quote fields if needed
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalRowCount;

  @override
  int get selectedRowCount => 0;

  int get totalRowCount => data.length;
}
