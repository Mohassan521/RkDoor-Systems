import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';

class DealerLogo extends StatefulWidget {
  const DealerLogo({super.key});

  @override
  State<DealerLogo> createState() => _DealerLogoState();
}

class _DealerLogoState extends State<DealerLogo> {
  File? selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
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
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: selectedImage != null
                  ? Image.file(selectedImage!)
                  : Image(
                      image: AssetImage('assets/images/no-image.ico'),
                    ),
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
              onTap: () {},
              color: const Color(0xff941420),
            )
          ],
        ),
      ),
    );
  }
}
