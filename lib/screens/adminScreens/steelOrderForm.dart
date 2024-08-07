import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
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

  // to pick image from gallery
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
  String custom_handles = "YES";
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
        backgroundColor: Color(0xff821919),
        // title: const Text(
        //   'Steel Order Form',
        //   style: TextStyle(color: Colors.white),
        // ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 36),
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff821919),
              ),
              child: Text(
                "STEEL ORDER FORM",
                style: TextStyle(
                  letterSpacing: 2.2,
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product Type:',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.1),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          isExpanded: false,
                          style: TextStyle(color: Colors.black),
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
                                child: Center(
                                    child: Text(
                                  'Standard Hinged',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Sound Reduction',
                                child: Center(
                                    child: Text('Sound Reduction',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'FD30 Hinged',
                                child: Center(
                                    child: Text('FD30 Hinged',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Sliding',
                                child: Center(
                                    child: Text('Sliding',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'BI-FOLD',
                                child: Center(
                                    child: Text('BI-FOLD',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Fixed Window',
                                child: Center(
                                    child: Text('Fixed Window',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Pocket Door Panel',
                                child: Center(
                                    child: Text('Pocket Door Panel',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Various',
                                child: Center(
                                    child: Text('Various',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'External Doors',
                                child: Center(
                                    child: Text('External Doors',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Name',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: cname,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Quotation Number',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: qnum,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'User: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      FutureBuilder<List<AllDealersModel>>(
                          future: NetworkApiServices().getAllDealers(),
                          builder: ((context, snapshot) {
                            return Container(
                              height: MediaQuery.sizeOf(context).height * 0.055,
                              padding: EdgeInsets.only(left: 9),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.1,
                                  ),
                                  borderRadius: BorderRadius.circular(5.5),
                                  color: Colors.white),
                              child: DropdownButton<String>(
                                hint: Text(
                                  'Select value',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                                alignment: Alignment.center,
                                isExpanded: false,
                                value: user,
                                underline: SizedBox(),
                                onChanged: (newValue) {
                                  user = newValue ?? "";
                                  setState(() {});
                                },
                                items: snapshot.data != null
                                    ? snapshot.data!.map((e) {
                                        print("name present in API: ${e.name}");
                                        return DropdownMenuItem(
                                            value: e.name ?? "",
                                            child: Center(
                                                child: Text(
                                              e.name ?? "",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            )));
                                      }).toList()
                                    : [],
                              ),
                            );
                          })),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Dealer',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: dealer,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Salesperson',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: salesperson,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.5),
                        borderSide: BorderSide(color: Colors.black, width: 1.1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Use Dealer Address: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.1),
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          // alignment: Alignment.center,
                          style: TextStyle(color: Colors.black),
                          isExpanded: false,
                          value: useDealerAddress,
                          underline: SizedBox(),
                          onChanged: (String? newValue) async {},
                          items: [
                            DropdownMenuItem<String>(
                              value: 'NO',
                              child: Center(
                                child: Text(
                                  'NO',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'YES',
                              child: Center(
                                child: Text(
                                  'YES',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
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
                        'VAT Rate: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.1),
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.black),
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
                                child: Center(
                                    child: Text('Standard 20%',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Reduced 5%',
                                child: Center(
                                    child: Text('Reduced 5%',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'New Build 0%',
                                child: Center(
                                    child: Text('New Build 0%',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Excempt 0%',
                                child: Center(
                                    child: Text('Excempt 0%',
                                        style: TextStyle(fontSize: 12)))),
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
                        'Supply Type: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.1),
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.black),
                          alignment: Alignment.center,
                          isExpanded: false,
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
                                child: Center(
                                    child: Text(
                                  'Supply Only',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Installation RKDS',
                                child: Center(
                                    child: Text('Installation RKDS',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Survey Only',
                                child: Center(
                                    child: Text('Survey Only',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Installation - CB',
                                child: Center(
                                    child: Text('Installation - CB',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Installation Direct - CB',
                                child: Center(
                                    child: Text('Installation Direct - CB',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Installation - PB',
                                child: Center(
                                    child: Text('Installation - PB',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Installation Installation - PB',
                                child: Center(
                                    child: Text(
                                        'Installation Installation - PB',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Installation - Other',
                                child: Center(
                                    child: Text('Installation - Other',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Address 1',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: address,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Address 2',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: address2,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Address 3',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: address3,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Delivery Post Code',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: postcode,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Colour: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.055,
                          padding: EdgeInsets.only(left: 9),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.1),
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white),
                          child: DropdownButton<String>(
                            style: TextStyle(color: Colors.black),
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
                                  child: Center(
                                      child: Text(
                                    'RAL 9005 MS',
                                    style: TextStyle(fontSize: 12),
                                  ))),
                              DropdownMenuItem<String>(
                                  value: 'RAL 9003 MS',
                                  child: Center(
                                      child: Text('RAL 9003 MS',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'RAL 7021 MS',
                                  child: Center(
                                      child: Text('RAL 7021 MS',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'RAL 7039 MS',
                                  child: Center(
                                      child: Text('RAL 7039 MS',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'RAL 7022 MS',
                                  child: Center(
                                      child: Text('RAL 7022 MS',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'DB703 MS',
                                  child: Center(
                                      child: Text('DB703 MS',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'Installation Installation - PB',
                                  child: Center(
                                      child: Text(
                                          'Installation Installation - PB',
                                          style: TextStyle(fontSize: 12)))),
                              DropdownMenuItem<String>(
                                  value: 'CUSTOM COLOUR',
                                  child: Center(
                                      child: Text('CUSTOM COLOUR',
                                          style: TextStyle(fontSize: 12)))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Address (if different from above)',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Frame Size',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: frame,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Email',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),

                  TextFormField(
                    controller: cusEmail,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Customer Tel Number',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: telephone,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Total Order Value (incl. VAT)',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: totalOrderValue,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.1),
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.black),
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
                                value: '45',
                                child: Center(
                                    child: Text(
                                  '45%',
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
                  const Text('Delivery Cost',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryCost,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Total Weight',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: totalWeight,
                    style: TextStyle(fontSize: 13),
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Net Order Value',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: netOrderValue,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Color.fromARGB(255, 246, 245, 245),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Quotation File',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff941420)),
                          // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(9)
                          //     )
                          //     )
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
                        textAlign: TextAlign.end,
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
                        'Custom Handles: ',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.1),
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.black),
                          alignment: Alignment.center,
                          isExpanded: false,
                          value: custom_handles,
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              discount = newValue ?? discount;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: "YES",
                                child: Center(child: Text("YES"))),
                            DropdownMenuItem<String>(
                                value: 'NO',
                                child: Center(
                                    child: Text(
                                  'NO',
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
                    'Notes',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    maxLines: 6,
                    controller: notes,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Color(0xff941420),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    minWidth: double.infinity,
                    onPressed: () {
                      // to save data of steel order form in database
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
                          notes.text,
                          custom_handles);
                    },
                    child: Text("Submit"),
                  )
                  // RoundButton(
                  //   onTap: () {
                  //     NetworkApiServices().createSteelOrderForAdmin(
                  //         widget.dealerId,
                  //         productType,
                  //         cname.text,
                  //         qnum.text,
                  //         user,
                  //         salesperson.text,
                  //         supply,
                  //         address.text,
                  //         address2.text,
                  //         address3.text,
                  //         postcode.text,
                  //         color,
                  //         frame.text,
                  //         cusEmail.text,
                  //         telephone.text,
                  //         totalOrderValue.text,
                  //         discount,
                  //         deliveryCost.text,
                  //         totalWeight.text,
                  //         netOrderValue.text,
                  //         filesToUpload,
                  //         notes.text);
                  //   },
                  //   text: 'Submit',
                  //   width: double.infinity,
                  //   color: Color(0xff941420),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
