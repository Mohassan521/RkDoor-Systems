import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';

class DealerLogo extends StatefulWidget {
  const DealerLogo({super.key});

  @override
  State<DealerLogo> createState() => _DealerLogoState();
}

class _DealerLogoState extends State<DealerLogo> {
  String? _filePath;

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
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: const Color(0xff941420),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.3,
              image: const AssetImage('assets/images/no-image.ico')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
