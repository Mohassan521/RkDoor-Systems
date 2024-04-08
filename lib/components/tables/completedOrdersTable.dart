import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/completedOrders.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/models/steelOrderModel.dart';
import 'package:price_link/screens/pdfViewer.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class CompletedOrdersTable extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  const CompletedOrdersTable(
      {super.key, required this.dealerId, required this.dealerName});

  @override
  State<CompletedOrdersTable> createState() => _CompletedOrdersTableState();
}

class _CompletedOrdersTableState extends State<CompletedOrdersTable> {
  List<DealersModel> dealers = [];

  @override
  void initState() {
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

        return PaginatedDataTable(
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
                'Quote Created By',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Factory Order No',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Order Status',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Order Confirmation',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Anticipated Delivery Date',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Invoices',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Delivery Note',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Customer Tel No',
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
                'Quote ID',
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
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Quote Analysis',
                style: TextStyle(color: Color(0xff941420)),
              )),
              DataColumn(
                  label: Text(
                'Edit',
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

  showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        insetPadding: EdgeInsets.all(9),
        content: SizedBox(
          height: 200.0, // Set the height as needed
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  DataRow getRow(int index) {
    final CompletedOrders result = data![index];
    //List<DealersModel> dealers = NetworkApiServices().getDealersList(context,dealerId) as List<DealersModel>;
    TextEditingController notesController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    NetworkApiServices apiServices = NetworkApiServices();

    List<dynamic> steelOrderFile = result.documents ?? [];
    String filePath = steelOrderFile.isNotEmpty ? steelOrderFile.last : '';
    String fileExtension = extension(filePath).toLowerCase();

    List<dynamic> invoiceDocs = result.invoicesDocuments ?? [];
    String invoiceFilePath = invoiceDocs.isNotEmpty ? invoiceDocs.last : '';
    String invoiceFileExtension = extension(invoiceFilePath).toLowerCase();

    List<dynamic> dd = result.deliveryDocuments ?? [];
    String ddFilePath = dd.isNotEmpty ? dd.last : '';
    String ddFileExtension = extension(ddFilePath).toLowerCase();

    var dealerData = Provider.of<DealerData>(context).model;
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        //1
        DataCell(Text(result.quotationNumber ?? "")),
        DataCell(Text(dealerData.dealerName ?? "")),
        DataCell(Text(dealerName)),
        DataCell(Text(result.name ?? '')),
        DataCell(Text(result.orderNoVal ?? '')),
        // DataCell(Text(result.orderStatusVal ?? '')),
        DataCell(Builder(builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: result.orderStatusVal == "Order Received"
                      ? Color(0xff9ad9ea)
                      : result.orderStatusVal == "Order Placed"
                          ? Color(0xffffc90d)
                          : result.orderStatusVal == "Awaiting Balance Payment"
                              ? Colors.yellow
                              : result.orderStatusVal == "Delayed"
                                  ? Colors.red
                                  : result.orderStatusVal == "In Production"
                                      ? Color(0xffb5351d)
                                      : result.orderStatusVal ==
                                              "Ready For Shipping"
                                          ? Color(0xff0080001)
                                          : result.orderStatusVal ==
                                                  "Revised Confirmation Issued"
                                              ? Color(0xffa747a2)
                                              : result.orderStatusVal ==
                                                      "Final Confirmation Issued"
                                                  ? Color(0xffc7bfe6)
                                                  : result.orderStatusVal ==
                                                          "In Transit To UK"
                                                      ? Color(0xfffeaec9)
                                                      : result.orderStatusVal ==
                                                              "In RKDS Warehouse"
                                                          ? Color(0xff9ad9ea)
                                                          : Color(0xff7092bf),
                  borderRadius: BorderRadius.circular(5.5)),
              height: MediaQuery.sizeOf(context).height * 0.05,
              width: MediaQuery.sizeOf(context).width * 0.33,
              child: Center(
                  child: Text(
                result.orderStatusVal!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.w600),
              )));
        })),

        DataCell(
          result.documents!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.documents!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Center(
                          child: Icon(
                            (fileExtension == '.jpg' ||
                                    fileExtension == '.jpeg' ||
                                    fileExtension == '.png')
                                ? Icons.file_open
                                : (fileExtension == '.pdf')
                                    ? Icons.picture_as_pdf
                                    : Icons.file_present,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        DataCell(Text(result.anticipatedDateVal ?? '')),
        DataCell(
          result.invoicesDocuments!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.invoicesDocuments!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Icon(
                          (invoiceFileExtension == '.jpg' ||
                                  invoiceFileExtension == '.jpeg' ||
                                  invoiceFileExtension == '.png')
                              ? Icons.file_open
                              : (invoiceFileExtension == '.pdf')
                                  ? Icons.picture_as_pdf
                                  : Icons.file_present,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        DataCell(
          result.deliveryDocuments!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Create icons for each file
                    for (var file in result.deliveryDocuments!)
                      InkWell(
                        onTap: () {
                          String fileExtension = extension(file).toLowerCase();
                          if (fileExtension == ".pdf") {
                            print(file);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFViewer(url: file),
                              ),
                            );
                          } else if (fileExtension == ".jpg" ||
                              fileExtension == ".jpeg" ||
                              fileExtension == ".png") {
                            print(file);
                            showImageDialog(context, file);
                          } else {
                            print(file);
                            Utils().showToast(
                              'File Format not supported',
                              Color(0xff941420),
                              Colors.white,
                            );
                          }
                        },
                        child: Center(
                          child: Icon(
                            (ddFileExtension == ".jpg" ||
                                    ddFileExtension == ".jpeg" ||
                                    ddFileExtension == ".png")
                                ? Icons.file_open
                                : (ddFileExtension == ".pdf")
                                    ? Icons.picture_as_pdf
                                    : Icons.file_present,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                  ],
                )
              : Center(child: Text('')),
        ),

        DataCell(Text(result.telephoneNumber ?? '')),
        //DataCell(Text('')),
        DataCell(Text(result.customerEmail ?? "")),
        DataCell(Text(result.dileveryPostCodeC13 ?? '')),
        // factory delivery week
        //DataCell(TextFormField()),
        DataCell(Text(result.id ?? '')),
        DataCell(Text(result.date ?? '')),
        DataCell(Text(result.time ?? '')),
        DataCell(Center(
            child: Text(
          result.wholeTotal ?? '',
          textAlign: TextAlign.center,
        ))),
        DataCell(Text(result.orderDate ?? '')),
        DataCell(Consumer<setFollowUpOrderValue>(
          builder: (context, value, child) {
            return Center(
              child: DropdownButton<String>(
                value:
                    (result.orderFollowup == "") ? "NO" : result.orderFollowup!,
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? newValue) {
                  //newValue = result.orderFollowup;
                  if (newValue != null) {
                    // Provider.of<setFollowUpOrderValue>(context, listen: false)
                    //     .changeValue(newValue: newValue, quoteId: result.id!);
                    apiServices.setFollowUpOrderValue(
                        dealerId!, result.id!, newValue);
                  } else {
                    // Provider.of<setFollowUpOrderValue>(context, listen: false)
                    //     .changeValue(
                    //         newValue: result.orderFollowup, quoteId: result.id!);
                    apiServices.setFollowUpOrderValue(
                        dealerId!, result.id!, result.orderFollowup!);
                  }
                },
                items: [
                  DropdownMenuItem<String>(value: 'YES', child: Text('YES')),
                  DropdownMenuItem<String>(value: 'NO', child: Text('NO')),
                ],
              ),
            );
          },
        )),

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
          width: MediaQuery.sizeOf(context).width * 0.25,
        )),
        DataCell(RoundButton(
          text: 'Quote Analysis',
          onTap: () async {},
          color: Colors.blue,
          width: MediaQuery.sizeOf(context).width * 0.3,
        )),

        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              iconSize: 14,
            ),
            IconButton(
              onPressed: () {
                apiServices.deleteSteelOrder(dealerId, result.id!);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 14,
            ),
          ],
        )),
      ],
    );
  }
}
