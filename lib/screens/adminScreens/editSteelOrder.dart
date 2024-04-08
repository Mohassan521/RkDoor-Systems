import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/steelOrderModel.dart';
import 'package:price_link/services/services.dart';

class EditSteelOrderForAdmin extends StatefulWidget {
  final int dealerId;
  final String dealerName;
  final String? role;
  final AdminSteelOrder response;
  const EditSteelOrderForAdmin(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      required this.response});

  @override
  State<EditSteelOrderForAdmin> createState() => _EditSteelOrderForAdminState();
}

class _EditSteelOrderForAdminState extends State<EditSteelOrderForAdmin> {
  File? _image;
  final _picker = ImagePicker();
  List<File> filesToUpload = [];

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      filesToUpload.clear();
      filesToUpload.add(_image!);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  TextEditingController cname = TextEditingController();
  TextEditingController qnum = TextEditingController();
  TextEditingController dealer = TextEditingController();
  TextEditingController salesperson = TextEditingController();
  String productType = "";
  var user;
  String useDealerAddress = "NO";
  String vat = "";
  String supply = "";
  TextEditingController address = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController address3 = TextEditingController();
  TextEditingController postcode = TextEditingController();
  String color = "";
  TextEditingController frame = TextEditingController();
  TextEditingController cusEmail = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController totalOrderValue = TextEditingController();
  String discount = "";
  TextEditingController deliveryCost = TextEditingController();
  TextEditingController totalWeight = TextEditingController();
  TextEditingController netOrderValue = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //SteelOrderModel model = SteelOrderModel();
    netOrderValue.text = "0.0";
    productType = widget.response.productType ?? "";
    cname.text = widget.response.steelCustomerName ?? "";
    qnum.text = widget.response.steelQNumber ?? "";
    dealer.text = widget.dealerName;
    salesperson.text = widget.response.steelSalePerson ?? "";
    supply = widget.response.steelSupplyType ?? "";
    address.text = widget.response.customerAddress ?? "";
    address2.text = widget.response.customerAddress2 ?? "";
    address3.text = widget.response.customerAddress3 ?? "";
    postcode.text = widget.response.deliveryPostCode ?? "";
    color = widget.response.steelColor ?? "";
    frame.text = widget.response.steelFrameSize ?? "";
    cusEmail.text = widget.response.steelCustomerEmail ?? "";
    telephone.text = widget.response.steelCustomerTel ?? "";
    totalOrderValue.text = widget.response.steelTotalOrderValue ?? "";
    discount = widget.response.steelDiscount ?? "";
    deliveryCost.text = widget.response.steelDeliveryCost ?? "";
    totalWeight.text = widget.response.steelWeight ?? "";
    notes.text = widget.response.notes ?? "";
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Steel Order Form',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product Type',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: productType,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          productType = newValue ?? productType;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: '', child: Center(child: Text(''))),
                        DropdownMenuItem<String>(
                            value: 'STANDARD HINGED',
                            child: Center(
                                child: Text(
                              'Standard Hinged',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'SOUNND REDUCTION',
                            child: Center(
                                child: Text(
                              'Sound Reduction',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'FD30 HINGED',
                            child: Center(
                                child: Text(
                              'FD30 Hinged',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'SLIDING',
                            child: Center(
                                child: Text(
                              'Sliding',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'BI-FOLD',
                            child: Center(
                                child: Text(
                              'BI-FOLD',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'FIXED WINDOW',
                            child: Center(
                                child: Text(
                              'Fixed Window',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'POCKET DOOR PANEL',
                            child: Center(
                                child: Text(
                              'Pocket Door Panel',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'VARIOUS',
                            child: Center(
                                child: Text(
                              'Various',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'EXTERNAL DOORS',
                            child: Center(
                                child: Text(
                              'External Doors',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Name',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: cname,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Quotation Number',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: qnum,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Dealer',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: dealer,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Salesperson',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: salesperson,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Use Dealer Address',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: useDealerAddress,
                      underline: SizedBox(),
                      onChanged: (String? newValue) async {
                        // setState(() {
                        //   useDealerAddress = newValue ?? useDealerAddress;
                        // });

                        // if (useDealerAddress == "YES") {
                        //   // Fetch data from API
                        //   List<DealersModel> steelOrders = await NetworkApiServices()
                        //       .getDealersList(context, widget.dealerId);

                        //   // Check if there's any data and update the salesperson.text

                        //   if (steelOrders.isNotEmpty) {
                        //     salesperson.text = steelOrders[0].displayName!;
                        //     address.text = steelOrders[0].dealerAddress1 ?? "";
                        //     address2.text = steelOrders[0].dealerAddress2 ?? "";
                        //     address3.text = steelOrders[0].dealerAddress3 ?? "";
                        //     postcode.text = steelOrders[0].postCodeRegister ?? "";
                        //   } else {
                        //     salesperson.text =
                        //         ""; // Set to empty if no data is available
                        //   }

                        //   //print(model.steelDealerEmail);
                        // } else {
                        //   salesperson.text = "";
                        // }
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'NO',
                            child: Center(
                                child: Text(
                              'NO',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'YES',
                            child: Center(
                                child: Text(
                              'YES',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'VAT Rate',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.5),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: vat,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          vat = newValue ?? vat;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: '', child: Center(child: Text(''))),
                        DropdownMenuItem<String>(
                            value: 'STANDARD 20%',
                            child: Center(
                                child: Text(
                              'Standard 20%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'REDUCED 5%',
                            child: Center(
                                child: Text(
                              'Reduced 5%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'NEW BUILD 0%',
                            child: Center(
                                child: Text(
                              'New Build 0%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'EXCEMPT 0%',
                            child: Center(
                                child: Text(
                              'Excempt 0%',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Supply Type',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: supply,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          supply = newValue ?? supply;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: '', child: Center(child: Text(''))),
                        DropdownMenuItem<String>(
                            value: 'SUPPLY ONLY',
                            child: Center(
                                child: Text(
                              'Supply Only',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation RKDS',
                            child: Center(
                                child: Text(
                              'Installation RKDS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Survey Only',
                            child: Center(
                                child: Text(
                              'Survey Only',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation - CB',
                            child: Center(
                                child: Text(
                              'Installation - CB',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation Direct - CB',
                            child: Center(
                                child: Text(
                              'Installation Direct - CB',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation - PB',
                            child: Center(
                                child: Text(
                              'Installation - PB',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation Direct- PB',
                            child: Center(
                                child: Text(
                              'Installation Installation - PB',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Installation - Other',
                            child: Center(
                                child: Text(
                              'Installation - Other',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 1',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: address,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 2',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: address2,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address 3',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: address3,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Delivery Post Code',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: postcode,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Colour',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: color,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          color = newValue ?? color;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: "", child: Center(child: Text(""))),
                        DropdownMenuItem<String>(
                            value: 'RAL 9005 MS',
                            child: Center(
                                child: Text(
                              'RAL 9005 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'RAL 9003 MS',
                            child: Center(
                                child: Text(
                              'RAL 9003 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7021 MS',
                            child: Center(
                                child: Text(
                              'RAL 7021 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7039 MS',
                            child: Center(
                                child: Text(
                              'RAL 7039 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7022 MS',
                            child: Center(
                                child: Text(
                              'RAL 7022 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'DB703 MS',
                            child: Center(
                                child: Text(
                              'DB703 MS',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'CUSTOM COLOUR',
                            child: Center(
                                child: Text(
                              'CUSTOM COLOUR',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Address (if different to above)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                //controller: dealerController,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Frame Size',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: frame,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Email',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: cusEmail,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Customer Tel Number',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: telephone,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Total Order Value (incl VAT)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: totalOrderValue,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discount',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: discount,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          discount = newValue ?? discount;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: "", child: Center(child: Text(""))),
                        DropdownMenuItem<String>(
                            value: '0',
                            child: Center(
                                child: Text(
                              '0%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '5',
                            child: Center(
                                child: Text(
                              '5%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '10',
                            child: Center(
                                child: Text(
                              '10%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '15',
                            child: Center(
                                child: Text(
                              '15%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '20',
                            child: Center(
                                child: Text(
                              '20%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '25',
                            child: Center(
                                child: Text(
                              '25%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '30',
                            child: Center(
                                child: Text(
                              '30%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '35',
                            child: Center(
                                child: Text(
                              '35%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '40',
                            child: Center(
                                child: Text(
                              '40%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '50',
                            child: Center(
                                child: Text(
                              '50%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: '60',
                            child: Center(
                                child: Text(
                              '60%',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'other',
                            child: Center(
                                child: Text(
                              'other',
                              style: TextStyle(fontSize: 12),
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Delivery Cost',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: deliveryCost,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Total Weight (kg.)',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: totalWeight,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Net Order Value',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                controller: netOrderValue,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // const Text('File Upload',
              //     style: TextStyle(color: Color(0xff941420))),
              // Row(
              //   children: [
              //     RoundButton(
              //       onTap: () {
              //         getImage();
              //       },
              //       text: 'Choose File',
              //       color: Color(0xff941420),
              //       width: MediaQuery.sizeOf(context).width * 0.25,
              //     ),
              //     ConstrainedBox(
              //       constraints: BoxConstraints(
              //           maxWidth: MediaQuery.sizeOf(context).width * 0.70),
              //       child: Text(
              //         _image?.path ?? "",
              //         textAlign: TextAlign.end,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: notes,
                maxLines: 6,
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                onTap: () {
                  // NetworkApiServices().createSteelOrderForAdmin(widget.dealerId, productType, cname.text, qnum.text, user, salesperson.text, supply, address.text, address2.text, address3.text, postcode.text, color, frame.text, cusEmail.text, telephone.text, totalOrderValue.text, discount, deliveryCost.text, totalWeight.text, netOrderValue.text, filesToUpload, notes.text);
                  NetworkApiServices().updateSteelOrderOfAdmin(
                      widget.response.id!,
                      productType,
                      qnum.text,
                      salesperson.text,
                      widget.response.steelDealerEmail ?? "",
                      widget.response.steelDealerTelNo ?? "",
                      postcode.text,
                      supply,
                      cname.text,
                      color,
                      address.text,
                      address2.text,
                      address3.text,
                      widget.response.saleBonus ?? "",
                      widget.dealerId,
                      cusEmail.text,
                      telephone.text,
                      totalOrderValue.text,
                      discount,
                      totalWeight.text,
                      deliveryCost.text,
                      widget.response.steelInstCost ?? "",
                      netOrderValue.text,
                      frame.text,
                      widget.response.steelSupplier ?? "",
                      notes.text);
                },
                text: 'Submit',
                width: double.infinity,
                color: Color(0xff941420),
              )
            ],
          ),
        ),
      ),
    );
  }
}
