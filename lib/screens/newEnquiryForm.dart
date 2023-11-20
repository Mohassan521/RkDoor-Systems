import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';

class NewEnquiryForm extends StatefulWidget {
  const NewEnquiryForm({super.key});

  @override
  State<NewEnquiryForm> createState() => _NewEnquiryFormState();
}

class _NewEnquiryFormState extends State<NewEnquiryForm> {
  String? _filePath;

  final List<String> productType = [
    'Entrance Door',
    'Internal Steel',
    'External Steel'
  ];
  final List<String> enquirySource = [
    'Instagram',
    'Internet Search',
    'Returning Customer',
    'Door Configurator',
    'Steel Configurator',
    'Swindon SBC',
    'ChatBox',
    'Info@',
    'Recommendation',
    'Returning Customer',
    'Showroom Visit',
    'Trade Window Company',
    'Telephone Enquiry',
    'Trade',
    'Other'
  ];
  final List<String> requirement = [
    'CallBack',
    'Brochure',
    'Quotation',
    'Chasing Configurator Enquiry',
    'Technical Details',
    'Dealership',
    'Others'
  ];
  final List<String> supplyType = [
    'Supply Only',
    'Installation',
    'Not Applicable'
  ];
  final List<String> priorityLevel = ['Low', 'Medium', 'High'];

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking file: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedValue = "";

    print(selectedValue);

    return Scaffold(
      drawer: const DrawerPage(),
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
              ReusableDropdown(
                  items: productType,
                  value: productType.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('Dealer', style: TextStyle(color: Color(0xff941420))),
              TextFormField(
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
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Enquiry Source',
                  style: TextStyle(color: Color(0xff941420))),
              ReusableDropdown(
                  items: enquirySource,
                  value: enquirySource.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('Requirements',
                  style: TextStyle(color: Color(0xff941420))),
              ReusableDropdown(
                  items: requirement,
                  value: requirement.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Name',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
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
              ReusableDropdown(
                  items: supplyType,
                  value: supplyType.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('Delivery Address (Address Search)',
                  style: TextStyle(color: Color(0xff941420))),
              ReusableDropdown(
                  items: supplyType,
                  value: supplyType.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('Customer Address Line 1',
                  style: TextStyle(color: Color(0xff941420))),
              TextFormField(
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
              ReusableDropdown(
                  items: priorityLevel,
                  value: priorityLevel.first,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              const Text('File Upload',
                  style: TextStyle(color: Color(0xff941420))),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: Text('Pick File'),
                  ),
                  SizedBox(width: 20),
                  _filePath != null
                      ? Flexible(child: Text('$_filePath'))
                      : Text('No file selected'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Notes', style: TextStyle(color: Color(0xff941420))),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RoundButton(
                  text: 'Save',
                  onTap: () {},
                  color: Color(0xff941420),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
