import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/services/fetchify_api.dart';
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

  final FetchifyService fetchifyService =
      FetchifyService('de602-9d509-28453-08f87');
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
        backgroundColor: Color(0xff941420),
        title: const Text(
          'ENQUIRY RECORD',
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
                value: entranceDoorValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    entranceDoorValue = newValue ?? entranceDoorValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Entrance Door',
                      child: Center(child: Text('Entrance Door'))),
                  DropdownMenuItem<String>(
                      value: 'Internal Steel',
                      child: Center(child: Text('Internal Steel'))),
                  DropdownMenuItem<String>(
                      value: 'External Steel',
                      child: Center(child: Text('External Steel'))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'dealer',
                controller: dealerController,
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
                height: 20,
              ),
              FormBuilderTextField(
                name: 'enq_entered',
                controller: enquiryEnteredByController,
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
                    labelText: 'Enquiry Entered By'),
              ),
              SizedBox(
                height: 20,
              ),
              const Text('Enquiry Source',
                  style: TextStyle(color: Color(0xff941420))),
              DropdownButton<String>(
                isExpanded: true,
                value: enquirySourceValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    enquirySourceValue = newValue ?? enquirySourceValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Instagram',
                      child: Center(child: Text('Instagram'))),
                  DropdownMenuItem<String>(
                      value: 'Internet Search',
                      child: Center(child: Text('Internet Search'))),
                  DropdownMenuItem<String>(
                      value: 'Returning Customer',
                      child: Center(child: Text('Returning Customer'))),
                  DropdownMenuItem<String>(
                      value: 'Door Configurator',
                      child: Center(child: Text('Door Configurator'))),
                  DropdownMenuItem<String>(
                      value: 'Steel Configurator',
                      child: Center(child: Text('Steel Configurator'))),
                  DropdownMenuItem<String>(
                      value: 'Swindon SBC',
                      child: Center(child: Text('Swindon SBC'))),
                  DropdownMenuItem<String>(
                      value: 'Chat Box',
                      child: Center(child: Text('Chat Box'))),
                  DropdownMenuItem<String>(
                      value: 'Info@', child: Center(child: Text('Info@'))),
                  DropdownMenuItem<String>(
                      value: 'Recommendation',
                      child: Center(child: Text('Recommendation'))),
                  DropdownMenuItem<String>(
                      value: 'Showroom Visit',
                      child: Center(child: Text('Showroom Visit'))),
                  DropdownMenuItem<String>(
                      value: 'Trade Window Company',
                      child: Center(child: Text('Trade Window Company'))),
                  DropdownMenuItem<String>(
                      value: 'Telephone Enquiry',
                      child: Center(child: Text('Telephone Enquiry'))),
                  DropdownMenuItem<String>(
                      value: 'Trade', child: Center(child: Text('Trade'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text('Requirements',
                  style: TextStyle(color: Color(0xff941420))),
              DropdownButton<String>(
                isExpanded: true,
                value: requirementValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  requirementValue = newValue ?? enquirySourceValue;
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Call Back',
                      child: Center(child: Text('Call Back'))),
                  DropdownMenuItem<String>(
                      value: 'brochure',
                      child: Center(child: Text('brochure'))),
                  DropdownMenuItem<String>(
                      value: 'Quotation',
                      child: Center(child: Text('Quotation'))),
                  DropdownMenuItem<String>(
                      value: 'Chasing Configurator Enquiry',
                      child:
                          Center(child: Text('Chasing Configurator Enquiry'))),
                  DropdownMenuItem<String>(
                      value: 'Technical Details',
                      child: Center(child: Text('Technical Details'))),
                  DropdownMenuItem<String>(
                      value: 'Dealership',
                      child: Center(child: Text('Dealership'))),
                  DropdownMenuItem<String>(
                      value: 'Others', child: Center(child: Text('Others'))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'cus_name',
                controller: cusNameController,
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
                height: 20,
              ),
              FormBuilderTextField(
                name: 'company',
                controller: companyController,
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
                    labelText: 'Company'),
              ),
              SizedBox(
                height: 20,
              ),
              const Text('Supply Type',
                  style: TextStyle(color: Color(0xff941420))),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: supplyTypeValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    supplyTypeValue = newValue ?? supplyTypeValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Supply Only',
                      child: Center(child: Text('Supply Only'))),
                  DropdownMenuItem<String>(
                      value: 'Installation',
                      child: Center(child: Text('Installation'))),
                  DropdownMenuItem<String>(
                      value: 'Not Applicable',
                      child: Center(child: Text('Not Applicable'))),
                  DropdownMenuItem<String>(
                      value: 'Not Specified',
                      child: Center(child: Text('Not Specified'))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'del_address',
                controller: deliveryAddressController,
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
                    labelText: 'Customer Address Line 1'),
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'address2',
                controller: deliveryAddressController2,
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
                    labelText: 'Customer Address Line 2'),
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'address3',
                controller: deliveryAddressController3,
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
                    labelText: 'Customer Address Line 3'),
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'address4',
                controller: deliveryAddressController4,
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
                    labelText: 'Customer Address Line 4'),
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'post_code',
                controller: deliveryPostCode,
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
                height: 20,
              ),
              FormBuilderTextField(
                name: 'email',
                controller: emailController,
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
                height: 20,
              ),
              FormBuilderTextField(
                name: 'tel',
                controller: telephoneController,
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
                    labelText: 'Telephone'),
              ),
              SizedBox(
                height: 20,
              ),
              const Text('Priority Level',
                  style: TextStyle(color: Color(0xff941420))),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    border: Border.all(width: 1),
                    color: priorityValue == "LOW"
                        ? Colors.pink
                        : priorityValue == "MEDIUM"
                            ? Colors.orange
                            : Colors.red),
                child: DropdownButton<String>(
                  isExpanded: true,
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
                        child: Center(
                            child: Text(
                          'LOW',
                        ))),
                    DropdownMenuItem<String>(
                        value: 'MEDIUM', child: Center(child: Text('MEDIUM'))),
                    DropdownMenuItem<String>(
                        value: 'HIGH', child: Center(child: Text('HIGH'))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
              ),
              FormBuilderTextField(
                name: 'notes',
                controller: notesController,
                style: TextStyle(fontSize: 13),
                maxLines: 6,
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
                    labelText: 'Notes'),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                width: double.infinity,
                text: 'Save',
                onTap: () {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
