import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/completedOrders.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/FinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/SteelOrderFinancialHistory.dart';
import 'package:price_link/screens/steel%20Orders/editSteelOrder.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class AdminCompletedOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminCompletedOrdersTable(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminCompletedOrdersTable> createState() =>
      _AdminCompletedOrdersTableState();
}

class _AdminCompletedOrdersTableState extends State<AdminCompletedOrdersTable> {
  //List<DealersModel> dealers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkApiServices apiServices = NetworkApiServices();

    print(widget.dealerId);
    print(widget.dealerName);

    return FutureBuilder<List<CompletedOrders>>(
      future: apiServices.getCompletedOrders(widget.dealerId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Data is being loaded...'));
        }

        List<CompletedOrders>? list = snapshot.data ?? [];

        List<CompletedOrders> filteredList =
            Provider.of<CompletedOrdersSearchData>(context).filteredDataModel;
        List<CompletedOrders>? displayData =
            filteredList.isNotEmpty ? filteredList : list;

        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: PaginatedDataTable(
              rowsPerPage: (list.length >= 5 && list.isNotEmpty)
                  ? 5
                  : (list.isEmpty)
                      ? 1
                      : list.length,
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
                  'Factory Order No',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Status',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Order Confirmation',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Anticipated Delivery Date',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Invoices',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Delivery Note',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Customer Tel No',
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
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
                DataColumn(
                    label: Text(
                  'Quote Analysis',
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
  final List<CompletedOrders>? data;
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

  @override
  DataRow getRow(int index) {
    final CompletedOrders result = data![index];
    //List<DealersModel> dealers = NetworkApiServices().getDealersList(context,dealerId) as List<DealersModel>;
    TextEditingController notesController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    NetworkApiServices apiServices = NetworkApiServices();
    var dealerData = Provider.of<DealerData>(context).model;
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(result.quotationNumber ?? "")),
        DataCell(Text(dealerData.dealerName ?? "")),
        DataCell(Text(dealerName)),
        DataCell(Text(result.name ?? '')),
        DataCell(Text(result.orderNoVal ?? 'No File Chosen')),
        DataCell(Text(result.orderStatusVal ?? '')),
        DataCell((result.documents!.isNotEmpty
            ? Icon(Icons.file_download_done)
            : Text(""))),
        DataCell(Text(result.anticipatedDateVal ?? '')),
        DataCell((result.invoicesDocuments!.isNotEmpty
            ? Icon(Icons.file_download_done)
            : Text(""))),

        DataCell((result.deliveryDocuments!.isNotEmpty
            ? Icon(Icons.file_download_done)
            : Text(""))),
        DataCell(Text(result.telephoneNumber ?? '')),
        //DataCell(Text('')),
        DataCell(Text(result.customerEmail ?? "")),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        // factory delivery week
        //DataCell(TextFormField()),
        DataCell(Text(result.id ?? '')),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(Text(result.wholeTotal ?? '')),
        DataCell(Text(result.orderDate ?? '')),
        DataCell(Text(result.orderFollowup ?? '')),
        // DataCell(Text(result.manualPDFImageURL!.map((e) => e.toString()).join(', '))),

        DataCell(RoundButton(
          text: 'Notes',
          onTap: () async {
            notesController.text = result.notes!;
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
          color: Colors.blue,
        )),
        DataCell(RoundButton(
          text: 'Quote Analysis',
          onTap: () async {},
          color: Colors.blue,
        )),

        DataCell(Text('${result.date} ${result.time}')),

        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              iconSize: 16,
            ),
            IconButton(
              onPressed: () {
                apiServices.deleteSteelOrder(dealerId, result.id!);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 16,
            ),
          ],
        )),
      ],
    );
  }
}
