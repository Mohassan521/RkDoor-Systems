import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/date_button.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/quotationsModel.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/quoteAnalysis.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class QuotationsTable extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  final String? empId;
  const QuotationsTable(
      {super.key, this.dealerId, this.dealerName, this.role, this.empId});

  @override
  State<QuotationsTable> createState() => _QuotationsTableState();
}

class _QuotationsTableState extends State<QuotationsTable> {
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

        List<QuotationsModel> data = snapshot.data ?? [];

        List<QuotationsModel> filteredList =
            Provider.of<QuotationsSearchedData>(context).filteredDataModel;
        List<QuotationsModel>? displayData =
            filteredList.isNotEmpty ? filteredList : data;
        //print(object)

        return PaginatedDataTable(
            headingRowHeight: 48,
            dataRowMaxHeight: 48,
            columnSpacing: 20,
            showEmptyRows: false,
            rowsPerPage: (data.length >= 5 && data.isNotEmpty)
                ? 5
                : (data.isEmpty)
                    ? 1
                    : data.length,
            columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quotation Number',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quote Created By',
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
                'Total Quote Value (inc. VAT)',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quote ID',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Follow up Date',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Follow up Made',
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
              myGlobalBuildContext: context,
              displayData,
              widget.dealerId,
              dealerName: widget.dealerName!,
              showDatePickerCallback: _showDatePicker,
              empId: widget.empId,
              datetime: _dateTime,
            ));
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
  final String? empId;
  final DateTime datetime;
  final BuildContext myGlobalBuildContext;
  final void Function() showDatePickerCallback;
  //final void Function() getSavedValue;
  MyData(this.data, this.dealerId,
      {required this.dealerName,
      required this.datetime,
      required this.myGlobalBuildContext,
      required this.showDatePickerCallback,
      this.empId
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
    return DataRow.byIndex(
        color: MaterialStatePropertyAll(Colors.white),
        index: index,
        cells: <DataCell>[
          DataCell(Text(result.name ?? "", style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.quotationNumber ?? "",
              style: TextStyle(fontSize: 12.5))),
          DataCell(Text(dealerName, style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.telephoneNumber ?? "",
              style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.customerEmail ?? "",
              style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.dileveryPostCodeC13 ?? "",
              style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.date ?? "", style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.time ?? "", style: TextStyle(fontSize: 12.5))),
          DataCell(
              Text(result.wholeTotal ?? "", style: TextStyle(fontSize: 12.5))),
          DataCell(Text(result.id ?? "", style: TextStyle(fontSize: 12.5))),
          DataCell(Consumer<FollowUpDate>(
            builder: (context, value, child) {
              return Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  (result.orderDateQArray != null)
                      ? result.orderDateQArray!
                      : value.getDate(result.id!),
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
                      apiServices.setFollowUpDate(
                          dealerId!, result.id!, pickedDate);
                    }
                  },
                  icon: Icons.calendar_month,
                )
              ]);
            },
          )),
          DataCell(Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.22,
              decoration: BoxDecoration(
                  color: result.orderFUpQVal == "YES"
                      ? Color(0Xff008000)
                      : Color(0xffFF0000),
                  border: Border.all(width: 1)),
              child: DropdownButton<String>(
                style: TextStyle(fontSize: 12.5, color: Colors.black),
                isExpanded: true,
                value: result.orderFUpQVal == "YES" ? "YES" : "NO",
                iconEnabledColor: result.orderFUpQVal == "YES"
                    ? Color(0Xff008000)
                    : Color(0xffFF0000),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    apiServices.setFollowUpValue(
                        dealerId!, result.id!, newValue);
                  } else {
                    apiServices.setFollowUpValue(
                        dealerId!, result.id!, result.orderFUpQVal!);
                  }
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
          )),
          DataCell(RoundButton(
            text: 'Quote Analysis',
            onTap: () {
              Navigator.push(
                  myGlobalBuildContext,
                  MaterialPageRoute(
                      builder: (context) => OrdersQuoteAnalysis(
                            dealerId: dealerId,
                            quoteId: result.id,
                          )));
            },
            color: Colors.blue,
            width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.18,
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
          )),
          DataCell(RoundButton(
            text: 'Notes',
            width: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.08,
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
            onTap: () async {
              notesController.text = result.notes!;
              await showDialog(
                  context: myGlobalBuildContext,
                  builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                                key: _formKey,
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
                                        if (_formKey.currentState!.validate()) {
                                          apiServices.setNotesValue(dealerId!,
                                              result.id!, notesController.text);
                                        }

                                        Navigator.of(context,
                                                rootNavigator: true)
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
            color: Colors.blue,
          )),
          DataCell(RoundButton(
            text: 'Create Order',
            onTap: () {
              apiServices.createOrder(dealerId!, result.id!);
            },
            color: Colors.blue,
            width: MediaQuery.sizeOf(myGlobalBuildContext).width * 0.20,
            height: MediaQuery.sizeOf(myGlobalBuildContext).height * 0.042,
          )),
          DataCell(Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      myGlobalBuildContext,
                      MaterialPageRoute(
                          builder: (context) => RkDoorCalculatorView(
                              dealerId: dealerId!,
                              url:
                                  'https://www.pricelink.net/rk-door-calculator/?user_id=${dealerId}&cal_id=${result.id}&mobile_token=true')));
                },
                child: Icon(
                  // constraints: BoxConstraints.tight(Size.fromWidth(0)),

                  Icons.edit,
                  size: 14,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  apiServices.duplicateQuotes(dealerId!, result.id!);
                },
                child: Icon(
                  // constraints: BoxConstraints.tight(Size.fromWidth(0)),

                  Icons.copy,
                  size: 14,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: myGlobalBuildContext,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Icon(Icons.warning),
                          content: Text(
                              'Are u sure you want to delete this quotation'),
                          actions: [
                            Center(
                              child: Column(
                                children: [
                                  RoundButton(
                                    text: 'Delete',
                                    onTap: () {
                                      apiServices.deleteQuotes(
                                          dealerId!, result.id!);
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
              ),
            ],
          )),
        ]);
  }
}
