import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/models/admin%20models/allDealersModel.dart';
import 'package:price_link/services/services.dart';

class AdminEnquiryForm extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  const AdminEnquiryForm(
      {super.key, required this.dealerId, required this.dealerName, this.role});

  @override
  State<AdminEnquiryForm> createState() => _AdminEnquiryFormState();
}

class _AdminEnquiryFormState extends State<AdminEnquiryForm> {
  File? _image;
  File? _image2;
  final _picker = ImagePicker();
  NetworkApiServices apiServices = NetworkApiServices();
  List<File> filesToUpload = [];
  List<File> filesToUploadForDoorDesign = [];

  Future getImageForDoorDesign() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image2 = File(pickedFile.path);
      filesToUploadForDoorDesign.clear();
      filesToUploadForDoorDesign.add(_image2!);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

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

  var enqAllocatedTo;
  String enqEnteredBy = "";

  @override
  Widget build(BuildContext context) {
    // print(_image);

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
          'ENQUIRY RECORD',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product Type: ',
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      value: entranceDoorValue,
                      underline: SizedBox(),
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
                              textAlign: TextAlign.center,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enquiry Allocated To:',
                      style: TextStyle(color: Color(0xff941420))),
                  FutureBuilder<List<AllDealersModel>>(
                      future: apiServices.getAllDealers(),
                      builder: ((context, snapshot) {
                        return Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButton<String>(
                            hint: Text(
                              'Select value',
                              style: TextStyle(fontSize: 12),
                            ),
                            alignment: Alignment.center,
                            isExpanded: false,
                            value: enqAllocatedTo,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              enqAllocatedTo = newValue ?? "";
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
                                          style: TextStyle(fontSize: 12),
                                        )));
                                  }).toList()
                                : [],
                          ),
                        );
                      })),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Dealer', style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'Dealer',
                controller: dealerController,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enquiry Entered By: ',
                      style: TextStyle(color: Color(0xff941420))),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.5),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: enqEnteredBy,
                      underline: SizedBox(),
                      onChanged: (newValue) {
                        enqEnteredBy = newValue ?? enqEnteredBy;
                        setState(() {});
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: '', child: Center(child: Text(''))),
                        DropdownMenuItem<String>(
                            value: 'Ian',
                            child: Center(
                                child: Text(
                              'Ian',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Trish',
                            child: Center(
                                child: Text(
                              'Trish',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Alecia',
                            child: Center(
                                child: Text(
                              'Alecia',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Tressy',
                            child: Center(
                                child: Text(
                              'Tressy',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Domimic',
                            child: Center(
                                child: Text(
                              'Domimic',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Graham',
                            child: Center(
                                child: Text(
                              'Graham',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Julie',
                            child: Center(
                                child: Text(
                              'Julie',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Ben',
                            child: Center(
                                child: Text(
                              'Ben',
                              style: TextStyle(fontSize: 12),
                            ))),
                        DropdownMenuItem<String>(
                            value: 'Elliot',
                            child: Center(
                                child: Text(
                              'Elliot',
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enquiry Source: ',
                      style: TextStyle(color: Color(0xff941420))),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: enquirySourceValue,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          enquirySourceValue = newValue ?? enquirySourceValue;
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
                                child: Text('Internet Search',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Returning Customer',
                            child: Center(
                                child: Text('Returning Customer',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Door Configurator',
                            child: Center(
                                child: Text('Door Configurator',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Steel Configurator',
                            child: Center(
                                child: Text('Steel Configurator',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Swindon SBC',
                            child: Center(
                                child: Text('Swindon SBC',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Chat Box',
                            child: Center(
                                child: Text('Chat Box',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Info@',
                            child: Center(
                                child: Text('Info@',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Recommendation',
                            child: Center(
                                child: Text('Recommendation',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Showroom Visit',
                            child: Center(
                                child: Text('Showroom Visit',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Trade Window Company',
                            child: Center(
                                child: Text('Trade Window Company',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Telephone Enquiry',
                            child: Center(
                                child: Text('Telephone Enquiry',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Trade',
                            child: Center(
                                child: Text('Trade',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'Other',
                            child: Center(
                                child: Text('Other',
                                    style: TextStyle(fontSize: 12)))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Requirements: ',
                      style: TextStyle(color: Color(0xff941420))),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      value: requirementValue,
                      alignment: Alignment.center,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        requirementValue = newValue ?? enquirySourceValue;
                        setState(() {});
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
                height: 10,
              ),
              const Text('Customer Name',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'Customer Name',
                controller: cusNameController,
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
                height: 10,
              ),
              const Text('Company', style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'Company',
                controller: companyController,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Supply Type: ',
                      style: TextStyle(color: Color(0xff941420))),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      value: supplyTypeValue,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          supplyTypeValue = newValue ?? supplyTypeValue;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Supply Only',
                            child: Center(
                                child: Text('Supply Only',
                                    style: TextStyle(fontSize: 12)))),
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
                height: 10,
              ),
              const Text('Customer Address Line 1',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address1',
                controller: deliveryAddressController,
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
                height: 10,
              ),
              const Text('Customer Address Line 2',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address2',
                controller: deliveryAddressController2,
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
                height: 10,
              ),
              const Text('Customer Address Line 3',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address3',
                controller: deliveryAddressController3,
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
                height: 10,
              ),
              const Text('Customer Address Line 4',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'address4',
                controller: deliveryAddressController4,
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
                height: 10,
              ),
              const Text('Delivery Post Code',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'postcode',
                controller: deliveryPostCode,
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
                height: 10,
              ),
              const Text('Customer Email',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'email',
                controller: emailController,
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
                height: 10,
              ),
              const Text('Customer Tel Number',
                  style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 5,
              ),
              FormBuilderTextField(
                name: 'tel',
                controller: telephoneController,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Priority Level: ',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      value: priorityValue,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          priorityValue = newValue ?? priorityValue;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: 'LOW',
                            child: Center(
                                child: Text('LOW',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'MEDIUM',
                            child: Center(
                                child: Text('MEDIUM',
                                    style: TextStyle(fontSize: 12)))),
                        DropdownMenuItem<String>(
                            value: 'HIGH',
                            child: Center(
                                child: Text('HIGH',
                                    style: TextStyle(fontSize: 12)))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
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
                height: 10,
              ),
              const Text('File Upload (Door Design Enquiries)',
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
                      getImageForDoorDesign();
                    },
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    _image2 != null && _image2!.path.isNotEmpty
                        ? "File Uploaded"
                        : "",
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Notes', style: TextStyle(color: Color(0xff941420))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: notesController,
                maxLines: 6,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    minWidth: double.infinity,
                    child: Text('Save'),
                    color: Color(0xff941420),
                    onPressed: () {
                      apiServices.createEnquiriesForAdmin(
                          widget.dealerId,
                          entranceDoorValue,
                          dealerController.text,
                          enqAllocatedTo,
                          enqEnteredBy,
                          enqEnteredBy,
                          cusNameController.text,
                          companyController.text,
                          supplyTypeValue,
                          addressController.text,
                          deliveryAddressController2.text,
                          deliveryAddressController3.text,
                          deliveryAddressController4.text,
                          deliveryPostCode.text,
                          emailController.text,
                          telephoneController.text,
                          priorityValue,
                          filesToUpload,
                          filesToUploadForDoorDesign,
                          notesController.text,
                          enquirySourceValue);
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Save as Hot Lead"),
                  minWidth: double.infinity,
                  color: Color(0xff941420),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.5)),
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
