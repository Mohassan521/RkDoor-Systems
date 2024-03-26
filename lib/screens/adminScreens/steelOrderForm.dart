import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/services/services.dart';

class SteelOrderFormForAdmin extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const SteelOrderFormForAdmin(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<SteelOrderFormForAdmin> createState() => _SteelOrderFormForAdminState();
}

class _SteelOrderFormForAdminState extends State<SteelOrderFormForAdmin> {
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
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
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
              const Text(
                'Product Type',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: productType,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
                      value: 'Sliding', child: Center(child: Text('Sliding'))),
                  DropdownMenuItem<String>(
                      value: 'BI-FOLD', child: Center(child: Text('BI-FOLD'))),
                  DropdownMenuItem<String>(
                      value: 'Fixed Window',
                      child: Center(child: Text('Fixed Window'))),
                  DropdownMenuItem<String>(
                      value: 'Pocket Door Panel',
                      child: Center(child: Text('Pocket Door Panel'))),
                  DropdownMenuItem<String>(
                      value: 'Various', child: Center(child: Text('Various'))),
                  DropdownMenuItem<String>(
                      value: 'External Doors',
                      child: Center(child: Text('External Doors'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'Customer Name',
                controller: cname,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Name'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'Quotation_Number',
                controller: qnum,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Quotation Number'),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'User',
                style: TextStyle(color: Color(0xff941420)),
              ),
              FutureBuilder<List<AllDealersModel>>(
                  future: NetworkApiServices().getAllDealers(),
                  builder: ((context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text('Select value'),
                      alignment: Alignment.center,
                      isExpanded: true,
                      value: user,
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        user = newValue ?? "";
                        setState(() {});
                      },
                      items: snapshot.data != null
                          ? snapshot.data!.map((e) {
                              print("name present in API: ${e.name}");
                              return DropdownMenuItem(
                                  value: e.name ?? "",
                                  child: Center(child: Text(e.name ?? "")));
                            }).toList()
                          : [],
                    );
                  })),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'dealer',
                controller: dealer,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Dealer'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'salesperson',
                controller: salesperson,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Salesperson'),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Use Dealer Address',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: useDealerAddress,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
                      value: 'NO', child: Center(child: Text('NO'))),
                  DropdownMenuItem<String>(
                      value: 'YES', child: Center(child: Text('YES'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'VAT Rate',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: vat,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
              SizedBox(
                height: 15,
              ),
              const Text(
                'Supply Type',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: supply,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
                      child: Center(child: Text('Installation Direct - CB'))),
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
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'address1',
                controller: address,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Address 1'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'address2',
                controller: address2,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Address 2'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'address3',
                controller: address3,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Address 3'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'postcode',
                controller: postcode,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Delivery Post Code'),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Colour',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: color,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'address_diff',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Address (if different to above)'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'frame',
                controller: frame,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Frame Size'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'email',
                controller: cusEmail,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Email'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'telephone',
                controller: telephone,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Customer Tel Number'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'total_order',
                controller: totalOrderValue,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Total Order Value (incl. VAT)'),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Discount',
                style: TextStyle(color: Color(0xff941420)),
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: discount,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
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
                      value: 'other', child: Center(child: Text('other'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'del_cost',
                controller: deliveryCost,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Delivery Cost'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'weight',
                controller: totalWeight,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Total Weight'),
              ),
              SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'netValue',
                enabled: false,
                controller: netOrderValue,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    labelStyle:
                        TextStyle(color: Color(0xff941420), fontSize: 13),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Net Order Value'),
              ),
              SizedBox(
                height: 15,
              ),
              const Text('File Upload',
                  style: TextStyle(color: Color(0xff941420))),
              Row(
                children: [
                  RoundButton(
                    onTap: () {
                      getImage();
                    },
                    text: 'Choose File',
                    color: Color(0xff941420),
                    width: MediaQuery.sizeOf(context).width * 0.25,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.70),
                    child: Text(
                      _image?.path ?? "",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Notes',
                style: TextStyle(color: Color(0xff941420)),
              ),
              TextFormField(
                controller: notes,
                maxLines: 6,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                onTap: () {
                  NetworkApiServices().createSteelOrderForAdmin(
                      widget.dealerId,
                      productType,
                      cname.text,
                      qnum.text,
                      user,
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
