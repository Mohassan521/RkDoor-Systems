import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/services/services.dart';

class DealerLogo extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? empId;
  final String? role;
  const DealerLogo(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.empId,
      this.role});

  @override
  State<DealerLogo> createState() => _DealerLogoState();
}

class _DealerLogoState extends State<DealerLogo> {
  File? selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      selectedImage = File(returnedImage.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
        empId: widget.empId,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff941420),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: NetworkApiServices().getDealerLogo(widget.dealerId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: selectedImage != null
                          ? Image.file(selectedImage!)
                          : Center(child: Text('No image Uploaded')));
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: Text('Pick image from gallery'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(width: 20),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              text: 'Upload',
              onTap: () {
                NetworkApiServices()
                    .setDealerLogo(widget.dealerId, selectedImage!);
                print('${widget.dealerId} & $selectedImage');
              },
              color: const Color(0xff941420),
            )
          ],
        ),
      ),
    );
  }
}
