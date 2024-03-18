
import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/admin%20models/adminEnquiryModel.dart';
import 'package:price_link/services/services.dart';

class AdminEnquiryEditForm extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final AdminEnquiryModel enquiries;
  const AdminEnquiryEditForm(
      {super.key, required this.dealerId, required this.dealerName, required this.enquiries});

  @override
  State<AdminEnquiryEditForm> createState() => _AdminEnquiryEditFormState();
}

class _AdminEnquiryEditFormState extends State<AdminEnquiryEditForm> {
  // File? _image;
  // File? _image2;
  // final _picker = ImagePicker();
  NetworkApiServices apiServices = NetworkApiServices();
  // List<File> filesToUpload = [];
  // List<File> filesToUploadForDoorDesign = [];

  // Future getImageForDoorDesign() async {
  //   final pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

  //   if (pickedFile != null) {
  //     _image2 = File(pickedFile.path);
  //     filesToUploadForDoorDesign.clear();
  //     filesToUploadForDoorDesign.add(_image2!);
  //     setState(() {});
  //   } else {
  //     print('no image selected');
  //   }
  // }

  // Future getImage() async {
  //   final pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

  //   if (pickedFile != null) {
  //     _image = File(pickedFile.path);
  //     filesToUpload.clear();
  //     filesToUpload.add(_image!);
  //     setState(() {});
  //   } else {
  //     print('no image selected');
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
  

  var enqAllocatedTo;
  String enqEnteredBy = "";

  @override
  Widget build(BuildContext context) {
    // print(_image);
    String entranceDoorValue = widget.enquiries.enquiryType ?? "";
    String enquirySourceValue = widget.enquiries.enquirySource ?? "";
    String requirementValue = widget.enquiries.enquiryRequirement ?? "";
    String supplyTypeValue = widget.enquiries.enquirySupplyType ?? "";
    String priorityValue = widget.enquiries.enquiryPriorityLevel ?? "";
    dealerController.text = widget.dealerName;
    cusNameController.text = widget.enquiries.enquiryCustomerName ?? "";
    companyController.text = widget.enquiries.enquiryCompanyName ?? "";
    deliveryAddressController.text = widget.enquiries.customerAddress ?? "";
    deliveryAddressController2.text = widget.enquiries.customerAddress2 ?? "";
    deliveryAddressController3.text = widget.enquiries.customerAddress3 ?? "";
    deliveryAddressController4.text = widget.enquiries.customerAddress4 ?? "";
    deliveryPostCode.text = widget.enquiries.deliveryPostCodeC13 ?? "";
    emailController.text = widget.enquiries.enquiryCustomerEmail ?? "";
    telephoneController.text = widget.enquiries.enquiryTelNum ?? "";
    notesController.text = widget.enquiries.enquiryNotes ?? "";

    return Scaffold(
      
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
                height: 10,
              ),
              const Text('Dealer', style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: dealerController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Enquiry Entered By',
                  style: TextStyle(color: Color(0xff941420))),
              DropdownButton<String>(
                alignment: Alignment.center,
                isExpanded: true,
                value: enqEnteredBy,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (newValue) {
                  enqEnteredBy = newValue ?? enqEnteredBy;
                  setState(() {});
                },
                items: [
                  DropdownMenuItem<String>(
                      value: '', child: Center(child: Text(''))),
                  DropdownMenuItem<String>(
                      value: 'Ian', child: Center(child: Text('Ian'))),
                  DropdownMenuItem<String>(
                      value: 'Trish', child: Center(child: Text('Trish'))),
                  DropdownMenuItem<String>(
                      value: 'Alecia', child: Center(child: Text('Alecia'))),
                  DropdownMenuItem<String>(
                      value: 'Tressy', child: Center(child: Text('Tressy'))),
                  DropdownMenuItem<String>(
                      value: 'Domimic', child: Center(child: Text('Domimic'))),
                  DropdownMenuItem<String>(
                      value: 'Graham', child: Center(child: Text('Graham'))),
                  DropdownMenuItem<String>(
                      value: 'Julie', child: Center(child: Text('Julie'))),
                  DropdownMenuItem<String>(
                      value: 'Ben', child: Center(child: Text('Ben'))),
                  DropdownMenuItem<String>(
                      value: 'Elliot', child: Center(child: Text('Elliot'))),
                  DropdownMenuItem<String>(
                      value: 'Other', child: Center(child: Text('Other'))),
                ],
              ),
              SizedBox(
                height: 10,
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
                      value: 'info@', child: Center(child: Text('Info@'))),
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
                height: 10,
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
                  setState(() {});
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Call Back',
                      child: Center(child: Text('Call Back'))),
                  DropdownMenuItem<String>(
                      value: 'Brochure',
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
                height: 10,
              ),
              const Text('Customer Name',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: cusNameController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Company Name',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: companyController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
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
                      value: '',
                      child: Center(child: Text(''))),
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
                height: 10,
              ),
              const Text('Customer Address Line 1',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: deliveryAddressController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Address Line 2',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: deliveryAddressController2,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Address Line 3',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: deliveryAddressController3,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Address Line 4',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: deliveryAddressController4,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Delivery Post Code',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: deliveryPostCode,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Email',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Tel Number',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: telephoneController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Priority Level',
                  style: TextStyle(color: Color(0xff941420))),
              DropdownButton<String>(
                isExpanded: true,
                value: priorityValue,
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    priorityValue = newValue ?? priorityValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'LOW', child: Center(child: Text('LOW'))),
                  DropdownMenuItem<String>(
                      value: 'MEDIUM', child: Center(child: Text('MEDIUM'))),
                  DropdownMenuItem<String>(
                      value: 'HIGH', child: Center(child: Text('HIGH'))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Notes', style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                controller: notesController,
                maxLines: 6,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RoundButton(
                  text: 'Save',
                  onTap: () {
                    apiServices.editEnquiriesForAdmin(
                        widget.enquiries.id!,
                        widget.dealerId,
                        entranceDoorValue,
                        widget.dealerName,
                        enqEnteredBy,
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
                        notesController.text,
                        enquirySourceValue
                        );

                  },
                  color: Color(0xff941420),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
