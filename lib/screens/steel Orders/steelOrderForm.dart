import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/services/services.dart';

class SteelOrderForm extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const SteelOrderForm(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<SteelOrderForm> createState() => _SteelOrderFormState();
}

class _SteelOrderFormState extends State<SteelOrderForm> {
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
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
        empId: widget.empId,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Steel Order Form',
          style: TextStyle(color: Colors.white),
        ),
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
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        border: Border.all(width: 1, color: Colors.grey),
                        color: productType == ''
                            ? Colors.white
                            : productType == 'Standard Hinged'
                                ? Color(0xfffad900)
                                : productType == 'Sound Reduction'
                                    ? Color(0xfff900ee)
                                    : productType == 'FD30 Hinged'
                                        ? Color(0xffe50000)
                                        : productType == 'Sliding'
                                            ? Color(0xff82b1ff)
                                            : productType == 'BI-FOLD'
                                                ? Color(0xff2ecd70)
                                                : productType == 'Fixed Window'
                                                    ? Color(0xffed7efe)
                                                    : productType ==
                                                            'Pocket Door Panel'
                                                        ? Color(0xff3396df)
                                                        : productType ==
                                                                'Various'
                                                            ? Color(0xff667685)
                                                            : Color(
                                                                0xff1bbc9d)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      iconEnabledColor: productType == ''
                          ? Colors.white
                          : productType == 'Standard Hinged'
                              ? Color(0xfffad900)
                              : productType == 'Sound Reduction'
                                  ? Color(0xfff900ee)
                                  : productType == 'FD30 Hinged'
                                      ? Color(0xffe50000)
                                      : productType == 'Sliding'
                                          ? Color(0xff82b1ff)
                                          : productType == 'BI-FOLD'
                                              ? Color(0xff2ecd70)
                                              : productType == 'Fixed Window'
                                                  ? Color(0xffed7efe)
                                                  : productType ==
                                                          'Pocket Door Panel'
                                                      ? Color(0xff3396df)
                                                      : productType == 'Various'
                                                          ? Color(0xff667685)
                                                          : Color(0xff1bbc9d),
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
                            value: 'Standard Hinged',
                            child: Center(child: Text('Standard Hinged'))),
                        DropdownMenuItem<String>(
                            value: 'Sound Reduction',
                            child: Center(child: Text('Sound Reduction'))),
                        DropdownMenuItem<String>(
                            value: 'FD30 Hinged',
                            child: Center(child: Text('FD30 Hinged'))),
                        DropdownMenuItem<String>(
                            value: 'Sliding',
                            child: Center(child: Text('Sliding'))),
                        DropdownMenuItem<String>(
                            value: 'BI-FOLD',
                            child: Center(child: Text('BI-FOLD'))),
                        DropdownMenuItem<String>(
                            value: 'Fixed Window',
                            child: Center(child: Text('Fixed Window'))),
                        DropdownMenuItem<String>(
                            value: 'Pocket Door Panel',
                            child: Center(child: Text('Pocket Door Panel'))),
                        DropdownMenuItem<String>(
                            value: 'Various',
                            child: Center(child: Text('Various'))),
                        DropdownMenuItem<String>(
                            value: 'External Doors',
                            child: Center(child: Text('External Doors'))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Name',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'cname',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Quotation Number',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'quotation',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Dealer', style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'dealer',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Salesperson',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'salesperson',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
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
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      value: useDealerAddress,
                      underline: SizedBox(),
                      onChanged: (String? newValue) async {
                        setState(() {
                          useDealerAddress = newValue ?? useDealerAddress;
                        });

                        if (useDealerAddress == "YES") {
                          // Fetch data from API
                          List<DealersModel> steelOrders =
                              await NetworkApiServices()
                                  .getDealersList(context, widget.dealerId);

                          // Check if there's any data and update the salesperson.text

                          if (steelOrders.isNotEmpty) {
                            salesperson.text = steelOrders[0].displayName!;
                            address.text = steelOrders[0].dealerAddress1 ?? "";
                            address2.text = steelOrders[0].dealerAddress2 ?? "";
                            address3.text = steelOrders[0].dealerAddress3 ?? "";
                            postcode.text =
                                steelOrders[0].postCodeRegister ?? "";
                          } else {
                            salesperson.text =
                                ""; // Set to empty if no data is available
                          }

                          //print(model.steelDealerEmail);
                        } else {
                          salesperson.text = "";
                        }
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'NO', child: Center(child: Text('NO'))),
                        DropdownMenuItem<String>(
                            value: 'YES', child: Center(child: Text('YES'))),
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
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
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
                            value: 'Standard 20%',
                            child: Center(child: Text('Standard 20%'))),
                        DropdownMenuItem<String>(
                            value: 'Reduced 5%',
                            child: Center(child: Text('Reduced 5%'))),
                        DropdownMenuItem<String>(
                            value: 'New Build 0%',
                            child: Center(child: Text('New Build 0%'))),
                        DropdownMenuItem<String>(
                            value: 'Excempt 0%',
                            child: Center(child: Text('Excempt 0%'))),
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
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.5),
                        color: supply == ''
                            ? Color(0xffFFFFFF)
                            : supply == 'Supply Only'
                                ? Color(0xffFFFFFF)
                                : supply == 'Installation RKDS'
                                    ? Color(0xfffd80aa)
                                    : supply == 'Survey Only'
                                        ? Color(0xffea80fc)
                                        : supply == 'Installation - CB'
                                            ? Color(0xff2ecd70)
                                            : supply ==
                                                    'Installation Direct - CB '
                                                ? Color(0xffff4181)
                                                : supply == 'Installation - PB'
                                                    ? Color(0xfffad900)
                                                    : supply ==
                                                            'Installation Installation - PB'
                                                        ? Color(0xfffe7903)
                                                        : Color(0xff04bed5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      iconEnabledColor: supply == ''
                          ? Color(0xffFFFFFF)
                          : supply == 'Supply Only'
                              ? Color(0xffFFFFFF)
                              : supply == 'Installation RKDS'
                                  ? Color(0xfffd80aa)
                                  : supply == 'Survey Only'
                                      ? Color(0xffea80fc)
                                      : supply == 'Installation - CB'
                                          ? Color(0xff2ecd70)
                                          : supply ==
                                                  'Installation Direct - CB '
                                              ? Color(0xffff4181)
                                              : supply == 'Installation - PB'
                                                  ? Color(0xfffad900)
                                                  : supply ==
                                                          'Installation Installation - PB'
                                                      ? Color(0xfffe7903)
                                                      : Color(0xff04bed5),
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
                            value: 'Supply Only',
                            child: Center(child: Text('Supply Only'))),
                        DropdownMenuItem<String>(
                            value: 'Installation RKDS',
                            child: Center(child: Text('Installation RKDS'))),
                        DropdownMenuItem<String>(
                            value: 'Survey Only',
                            child: Center(child: Text('Survey Only'))),
                        DropdownMenuItem<String>(
                            value: 'Installation - CB',
                            child: Center(child: Text('Installation - CB'))),
                        DropdownMenuItem<String>(
                            value: 'Installation Direct - CB',
                            child: Center(
                                child: Text('Installation Direct - CB'))),
                        DropdownMenuItem<String>(
                            value: 'Installation - PB',
                            child: Center(child: Text('Installation - PB'))),
                        DropdownMenuItem<String>(
                            value: 'Installation Installation - PB',
                            child: Center(
                                child: Text('Installation Installation - PB'))),
                        DropdownMenuItem<String>(
                            value: 'Installation - Other',
                            child: Center(child: Text('Installation - Other'))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Address 1',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Address 2',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address2',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Address 3',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address3',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Delivery Post Code',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'postcode',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
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
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
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
                            child: Center(child: Text('RAL 9005 MS'))),
                        DropdownMenuItem<String>(
                            value: 'RAL 9003 MS',
                            child: Center(child: Text('RAL 9003 MS'))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7021 MS',
                            child: Center(child: Text('RAL 7021 MS'))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7039 MS',
                            child: Center(child: Text('RAL 7039 MS'))),
                        DropdownMenuItem<String>(
                            value: 'RAL 7022 MS',
                            child: Center(child: Text('RAL 7022 MS'))),
                        DropdownMenuItem<String>(
                            value: 'DB703 MS',
                            child: Center(child: Text('DB703 MS'))),
                        DropdownMenuItem<String>(
                            value: 'Installation Installation - PB',
                            child: Center(
                                child: Text('Installation Installation - PB'))),
                        DropdownMenuItem<String>(
                            value: 'CUSTOM COLOUR',
                            child: Center(child: Text('CUSTOM COLOUR'))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Address (if different from above)',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'tel',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Frame Size',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'tel',
                controller: frame,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Email',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'email',
                controller: cusEmail,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Customer Tel Number',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'tel',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Total Order Value',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'totalValue',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
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
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.5)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
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
                            value: '0', child: Center(child: Text('0%'))),
                        DropdownMenuItem<String>(
                            value: '5', child: Center(child: Text('5%'))),
                        DropdownMenuItem<String>(
                            value: '10', child: Center(child: Text('10%'))),
                        DropdownMenuItem<String>(
                            value: '15', child: Center(child: Text('15%'))),
                        DropdownMenuItem<String>(
                            value: '20', child: Center(child: Text('20%'))),
                        DropdownMenuItem<String>(
                            value: '25', child: Center(child: Text('25%'))),
                        DropdownMenuItem<String>(
                            value: '30', child: Center(child: Text('30%'))),
                        DropdownMenuItem<String>(
                            value: '35', child: Center(child: Text('35%'))),
                        DropdownMenuItem<String>(
                            value: '40', child: Center(child: Text('40%'))),
                        DropdownMenuItem<String>(
                            value: '45', child: Center(child: Text('45%'))),
                        DropdownMenuItem<String>(
                            value: '50', child: Center(child: Text('50%'))),
                        DropdownMenuItem<String>(
                            value: '60', child: Center(child: Text('60%'))),
                        DropdownMenuItem<String>(
                            value: 'other',
                            child: Center(child: Text('other'))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Delivery Cost',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'cost',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Total Weight (kg.)',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'weight',
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
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Net Order Value',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'netValue',
                controller: netOrderValue,
                enabled: false,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('File Upload',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff941420)),
                    ),
                    icon: Icon(
                      Icons.cloud_upload_outlined,
                      size: 19,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Browse',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    _image != null && _image!.path.isNotEmpty
                        ? "File Uploaded"
                        : "",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text('Notes', style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'notes',
                controller: notes,
                maxLines: 6,
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  NetworkApiServices().createSteelOrder(
                      widget.dealerId,
                      productType,
                      cname.text,
                      qnum.text,
                      dealer.text,
                      salesperson.text,
                      supply,
                      address.text,
                      address2.text,
                      address3.text,
                      postcode.text,
                      color,
                      frame.text,
                      cusEmail.text,
                      telephone.text,
                      totalOrderValue.text,
                      discount,
                      deliveryCost.text,
                      totalWeight.text,
                      netOrderValue.text,
                      filesToUpload,
                      notes.text);
                },
                child: Text('Submit'),
                minWidth: double.infinity,
                color: Color(0xff941420),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
