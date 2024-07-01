import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';

class NewEnquiryForm extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const NewEnquiryForm(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<NewEnquiryForm> createState() => _NewEnquiryFormState();
}

class _NewEnquiryFormState extends State<NewEnquiryForm> {
  File? _image;
  final _picker = ImagePicker();
  NetworkApiServices apiServices = NetworkApiServices();
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

  // Future<File?> _pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();

  //     if (result != null) {
  //       return File(result.files.single.path!);
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error picking file: $e');
  //     }
  //   }
  // }

  final TextEditingController addressController = TextEditingController();
  final TextEditingController enquiryEnteredByController =
      TextEditingController();
  final TextEditingController dealerController = TextEditingController();
  final TextEditingController cusNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final TextEditingController deliveryAddressController2 =
      TextEditingController();
  final TextEditingController deliveryAddressController3 =
      TextEditingController();
  final TextEditingController deliveryAddressController4 =
      TextEditingController();
  final TextEditingController deliveryPostCode = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String entranceDoorValue = "Entrance Door";
  String enquirySourceValue = "Instagram";
  String requirementValue = "Call Back";
  String supplyTypeValue = "Supply Only";
  String priorityValue = "LOW";

  @override
  Widget build(BuildContext context) {
    enquiryEnteredByController.text = widget.dealerName;
    var dealerData = Provider.of<DealerData>(context).model;
    dealerController.text = dealerData.dealerName!;

    // print(_image);

    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
        empId: widget.empId,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff821919),
        // title: const Text(
        //   'ENQUIRY RECORD',
        //   style: TextStyle(color: Colors.white),
        // ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 28),
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff821919),
              ),
              child: Text(
                "ENQUIRY RECORD",
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
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Product Type',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          // isExpanded: true,
                          value: entranceDoorValue,

                          onChanged: (String? newValue) {
                            setState(() {
                              entranceDoorValue = newValue ?? entranceDoorValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Entrance Door',
                                child: Center(
                                    child: Text(
                                  'Entrance Door',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Internal Steel',
                                child: Center(
                                    child: Text('Internal Steel',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'External Steel',
                                child: Center(
                                    child: Text('External Steel',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Dealer',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: dealerController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Enquiry Entered By',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: enquiryEnteredByController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Enquiry Source',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Container(
                        height: MediaQuery.sizeOf(context).height * .055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.5),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: DropdownButton<String>(
                          isExpanded: false,
                          value: enquirySourceValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              enquirySourceValue =
                                  newValue ?? enquirySourceValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Instagram',
                                child: Center(
                                    child: Text(
                                  'Instagram',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Internet Search',
                                child: Center(
                                    child: Text(
                                  'Internet Search',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Returning Customer',
                                child: Center(
                                    child: Text(
                                  'Returning Customer',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Door Configurator',
                                child: Center(
                                    child: Text(
                                  'Door Configurator',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Steel Configurator',
                                child: Center(
                                    child: Text(
                                  'Steel Configurator',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Swindon SBC',
                                child: Center(
                                    child: Text(
                                  'Swindon SBC',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Chat Box',
                                child: Center(
                                    child: Text(
                                  'Chat Box',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Info@',
                                child: Center(
                                    child: Text(
                                  'Info@',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Recommendation',
                                child: Center(
                                    child: Text(
                                  'Recommendation',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Showroom Visit',
                                child: Center(
                                    child: Text(
                                  'Showroom Visit',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Trade Window Company',
                                child: Center(
                                    child: Text(
                                  'Trade Window Company',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Telephone Enquiry',
                                child: Center(
                                    child: Text(
                                  'Telephone Enquiry',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Trade',
                                child: Center(
                                    child: Text(
                                  'Trade',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Other',
                                child: Center(
                                    child: Text(
                                  'Other',
                                  style: TextStyle(fontSize: 12),
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Requirements',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: DropdownButton<String>(
                          isExpanded: false,
                          value: requirementValue,
                          onChanged: (String? newValue) {
                            requirementValue = newValue ?? enquirySourceValue;
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Call Back',
                                child: Center(
                                    child: Text(
                                  'Call Back',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'brochure',
                                child: Center(
                                    child: Text('brochure',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Quotation',
                                child: Center(
                                    child: Text('Quotation',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Chasing Configurator Enquiry',
                                child: Center(
                                    child: Text('Chasing Configurator Enquiry',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Technical Details',
                                child: Center(
                                    child: Text('Technical Details',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Dealership',
                                child: Center(
                                    child: Text('Dealership',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Others',
                                child: Center(
                                    child: Text('Others',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Name',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: cusNameController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Company',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: companyController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Supply Type',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          isExpanded: false,
                          value: supplyTypeValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              supplyTypeValue = newValue ?? supplyTypeValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Supply Only',
                                child: Center(
                                    child: Text(
                                  'Supply Only',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Installation',
                                child: Center(
                                    child: Text('Installation',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Not Applicable',
                                child: Center(
                                    child: Text('Not Applicable',
                                        style: TextStyle(fontSize: 12)))),
                            DropdownMenuItem<String>(
                                value: 'Not Specified',
                                child: Center(
                                    child: Text('Not Specified',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Address Line 1',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryAddressController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Address Line 2',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryAddressController2,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Address Line 3',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryAddressController3,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Address Line 4',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryAddressController4,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Delivery Post Code',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: deliveryPostCode,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Customer Email',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Telephone',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: telephoneController,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Priority Level',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 9),
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            color: priorityValue == "LOW"
                                ? Colors.pink
                                : priorityValue == "MEDIUM"
                                    ? Colors.orange
                                    : Colors.red),
                        child: DropdownButton<String>(
                          isExpanded: false,
                          alignment: Alignment.center,
                          value: priorityValue,
                          underline: SizedBox(),
                          iconEnabledColor: priorityValue == "LOW"
                              ? Colors.pink
                              : priorityValue == "MEDIUM"
                                  ? Colors.orange
                                  : Colors.red,
                          onChanged: (String? newValue) {
                            setState(() {
                              priorityValue = newValue ?? priorityValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'LOW',
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'LOW',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'MEDIUM',
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'MEDIUM',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'HIGH',
                                alignment: Alignment.center,
                                child: Center(
                                    child: Text(
                                  'HIGH',
                                  style: TextStyle(fontSize: 12),
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'File Upload',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xff941420),
                          ),
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
                        width: 30,
                      ),
                      Text(
                        _image != null && _image!.path.isNotEmpty
                            ? "File Uploaded"
                            : "",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text('Notes',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: notesController,
                    style: TextStyle(fontSize: 13),
                    maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    child: Text('Save'),
                    onPressed: () {
                      apiServices.createEnquiries(
                          widget.dealerId,
                          entranceDoorValue,
                          dealerController.text,
                          enquiryEnteredByController.text,
                          requirementValue,
                          cusNameController.text,
                          companyController.text,
                          supplyTypeValue,
                          deliveryAddressController.text,
                          deliveryAddressController2.text,
                          deliveryAddressController3.text,
                          deliveryAddressController4.text,
                          deliveryPostCode.text,
                          emailController.text,
                          telephoneController.text,
                          priorityValue,
                          filesToUpload,
                          notesController.text,
                          enquirySourceValue,
                          enquiryEnteredByController.text);
                    },
                    color: Color(0xff941420),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
