import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminQuotationsTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdminQuotationsTable(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AdminQuotationsTable> createState() => _AdminQuotationsTableState();
}

class _AdminQuotationsTableState extends State<AdminQuotationsTable> {
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
    return FutureBuilder<List<QuotationsModel>>(
      future: apiServices.getQuotationsList(widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<QuotationsModel> data = snapshot.data!;

        List<QuotationsModel> filteredList =
            Provider.of<QuotationsSearchedData>(context).filteredDataModel;
        List<QuotationsModel>? displayData =
            filteredList.isNotEmpty ? filteredList : data;
        //print(object)

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (data.length >= 5 && data.isNotEmpty)
                  ? 5
                  : (data.isEmpty)
                      ? 1
                      : data.length,
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
                  'Installation Cost',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Cost',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quotation Type',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Level of Discount',
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
                  'Survey Form',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Action',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                )),
              ],
              source: MyData(
                myGlobalBuildContext: context,
                displayData,
                widget.dealerId,
                dealerName: widget.dealerName!,
                showDatePickerCallback: _showDatePicker,
                datetime: _dateTime,
              )),
        );
      },
    );
  }
}

class MyData extends DataTableSource {
  NetworkApiServices apiServices = NetworkApiServices();
  final List<QuotationsModel> data;
  TextEditingController notesController = TextEditingController();
  final String? dealerId;
  final String dealerName;
  final DateTime datetime;
  final BuildContext myGlobalBuildContext;
  final void Function() showDatePickerCallback;
  //final void Function() getSavedValue;
  MyData(
    this.data,
    this.dealerId, {
    required this.dealerName,
    required this.datetime,
    required this.myGlobalBuildContext,
    required this.showDatePickerCallback,
    //required this.getSavedValue
  });

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    print('Dealer ID in quotation table my data class $dealerId');
    final _formKey = GlobalKey<FormState>();
    NetworkApiServices apiServices = NetworkApiServices();
    final QuotationsModel result = data[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      //1
      DataCell(Text("")),
      //2
      DataCell(Text("")),
      //3
      DataCell(Text("")),
      //4
      DataCell(Text("")),
      //5
      DataCell(Text("")),
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
      DataCell(Text("")),
      //12
      DataCell(Text("")),
      //13
      DataCell(Text("")),
      //14
      DataCell(Text("")),
      //15
      DataCell(Text("")),
      //16
      DataCell(Text("")),
      //17
      DataCell(Text("")),
      //18
      DataCell(Text("")),
      //19
      DataCell(Text("")),
      //20
      DataCell(Text("")),
      //21
      DataCell(Text("")),
      //22
      DataCell(Text("")),
      //23
      DataCell(Text("")),

      // DataCell(Text(result.name ?? "")),
      // DataCell(Text(result.quotationNumber ?? "")),
      // DataCell(Text(dealerName ?? "")),
      // DataCell(Text(result.telephoneNumber ?? "")),
      // DataCell(Text(result.customerEmail ?? "")),
      // DataCell(Text(result.dileveryPostCodeC13 ?? "")),
      // DataCell(Text(result.date ?? "")),
      // DataCell(Text(result.time ?? "")),
      // DataCell(Text(result.wholeTotal ?? "")),
      // DataCell(Text(result.id ?? "")),
      // DataCell(Consumer<FollowUpDate>(
      //   builder: (context, value, child) {
      //     return Row(mainAxisSize: MainAxisSize.min, children: [
      //       Text(
      //         (result.orderDateQArray != null)
      //             ? result.orderDateQArray!
      //             : value.getDate(result.id!),
      //         style: TextStyle(fontSize: 12),
      //       ),
      //       DateButton(
      //         onTap: () async {
      //           DateTime? pickedDate = await showDatePicker(
      //             context: context,
      //             initialDate: DateTime.now(),
      //             firstDate: DateTime(2000),
      //             lastDate: DateTime(2050),
      //           );

      //           if (pickedDate != null) {
      //             // value.setDate(result.id!, pickedDate);
      //             apiServices.setFollowUpDate(
      //                 dealerId!, result.id!, pickedDate);
      //           }
      //         },
      //         icon: Icons.calendar_month,
      //       )
      //     ]);
      //   },
      // )),
      // DataCell(Consumer<setFollowUpValue>(
      //   builder: (context, value, child) {
      //     return DropdownButton<String>(
      //       value: result.orderFUpQVal ?? "NO",
      //       underline: Container(
      //         height: 2,
      //         color: Colors.white,
      //       ),
      //       onChanged: (String? newValue) {
      //         // Provider.of<setFollowUpValue>(context, listen: false)
      //         //     .changeValue(newValue: newValue, quoteId: result.id!);
      //         if (newValue != null) {
      //           apiServices.setFollowUpValue(dealerId!, result.id!, newValue);
      //         } else {
      //           apiServices.setFollowUpValue(
      //               dealerId!, result.id!, result.orderFUpQVal!);
      //         }
      //       },
      //       items: [
      //         DropdownMenuItem<String>(value: 'YES', child: Text('YES')),
      //         DropdownMenuItem<String>(value: 'NO', child: Text('NO')),
      //       ],
      //     );
      //   },
      // )),
      // DataCell(RoundButton(
      //   text: 'Quote Analysis',
      //   onTap: () {
      //     Navigator.push(
      //         myGlobalBuildContext,
      //         MaterialPageRoute(
      //             builder: (context) => RkDoorCalculatorView(
      //                 url:
      //                     'https://www.pricelink.net/dashboard/sales_details.php?user_id=$dealerId&quote_id=${result.id}&mobile_token=true')));
      //   },
      //   color: Colors.blue,
      // )),
      // DataCell(RoundButton(
      //   text: 'Notes',
      //   onTap: () async {
      //     notesController.text = result.notes!;
      //     await showDialog(
      //         context: myGlobalBuildContext,
      //         builder: (context) => AlertDialog(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(10))),
      //               insetPadding: EdgeInsets.all(9),
      //               content: Stack(
      //                 clipBehavior: Clip.none,
      //                 children: [
      //                   Positioned(
      //                       right: -40,
      //                       top: -40,
      //                       child: InkResponse(
      //                         onTap: () {
      //                           Navigator.of(context).pop();
      //                         },
      //                         child: const CircleAvatar(
      //                           backgroundColor: Color(0xff941420),
      //                           child: Icon(
      //                             Icons.close,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                       )),
      //                   Form(
      //                       key: _formKey,
      //                       child: Column(
      //                         mainAxisSize: MainAxisSize.min,
      //                         children: [
      //                           Center(
      //                               child: Text('Enter Notes',
      //                                   style: TextStyle(
      //                                       fontSize: 20,
      //                                       color: Color(0xff941420),
      //                                       fontWeight: FontWeight.w600))),
      //                           SizedBox(
      //                             height: 15,
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.all(8),
      //                             child: TextFormField(
      //                               maxLines: 6,
      //                               // initialValue: result.notes,
      //                               controller: notesController,
      //                               decoration: InputDecoration(
      //                                   border: OutlineInputBorder(
      //                                       borderSide: BorderSide(
      //                                           color: Color(0xff941420))),
      //                                   hintText: 'Notes'),
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             height: 10,
      //                           ),
      //                           RoundButton(
      //                             text: 'Save',
      //                             onTap: () async {
      //                               if (_formKey.currentState!.validate()) {
      //                                 apiServices.setNotesValue(dealerId!,
      //                                     result.id!, notesController.text);
      //                               }

      //                               Navigator.of(context, rootNavigator: true)
      //                                   .pop('dialog');
      //                             },
      //                             color: Color(0xff941420),
      //                           )
      //                         ],
      //                       ))
      //                 ],
      //               ),
      //             ));
      //   },
      //   color: Colors.blue,
      // )),
      // DataCell(RoundButton(
      //   text: 'Create Order',
      //   onTap: () {
      //     apiServices.createOrder(dealerId!, result.id!);
      //   },
      //   color: Colors.blue,
      // )),
      // DataCell(Row(
      //   children: [
      //     IconButton(
      //       // constraints: BoxConstraints.tight(Size.fromWidth(0)),
      //       onPressed: () {
      //         Navigator.push(
      //             myGlobalBuildContext,
      //             MaterialPageRoute(
      //                 builder: (context) => RkDoorCalculatorView(
      //                     url:
      //                         'https://www.pricelink.net/rk-door-calculator/?user_id=${dealerId}&cal_id=${result.id}&mobile_token=true')));
      //       },
      //       icon: Icon(Icons.edit),
      //       iconSize: 16,
      //     ),
      //     IconButton(
      //       // constraints: BoxConstraints.tight(Size.fromWidth(0)),
      //       onPressed: () {
      //         apiServices.duplicateQuotes(dealerId!, result.id!);
      //       },
      //       icon: Icon(Icons.copy),
      //       iconSize: 16,
      //     ),
      //     IconButton(
      //       // constraints: BoxConstraints.tight(Size.fromWidth(0)),
      //       onPressed: () {
      //         showDialog(
      //             context: myGlobalBuildContext,
      //             builder: (BuildContext context) {
      //               return AlertDialog(
      //                 title: Icon(Icons.warning),
      //                 content:
      //                     Text('Are u sure you want to delete this quotation'),
      //                 actions: [
      //                   Center(
      //                     child: Column(
      //                       children: [
      //                         RoundButton(
      //                           text: 'Delete',
      //                           onTap: () {
      //                             apiServices.deleteQuotes(
      //                                 dealerId!, result.id!);
      //                             Navigator.pop(context);
      //                           },
      //                           color: Colors.red,
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         RoundButton(
      //                           text: 'Cancel',
      //                           onTap: () {
      //                             Navigator.pop(context);
      //                           },
      //                           color: Colors.blue,
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               );
      //             });
      //       },
      //       icon: Icon(Icons.delete),
      //       iconSize: 16,
      //     ),
      //   ],
      // )),
    ]);
  }
}
