import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/models/marketingMaterial.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:http/http.dart' as http;

class MarketingMaterial extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const MarketingMaterial(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<MarketingMaterial> createState() => _MarketingMaterialState();
}

class _MarketingMaterialState extends State<MarketingMaterial> {
  NetworkApiServices apiServices = NetworkApiServices();

  // Future<void> downloadFile(String url) async {
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> downloadFile(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Get the app's document directory using path_provider
      final appDir = await getApplicationDocumentsDirectory();

      // Create the file path
      final filePath = '${appDir.path}/$fileName';

      // Write the file
      File(filePath).writeAsBytesSync(response.bodyBytes);

      print('File downloaded to: $filePath');
    } else {
      throw 'Failed to download file: ${response.statusCode}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealerName: widget.dealerName,
        dealer_id: widget.dealerId,
        role: widget.role,
        empId: widget.empId,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Marketing Materials',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Color(0xfff3f4f4)),
                  child: FutureBuilder(
                    future: apiServices.getCEDDetailsNine(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        Utils().showToast("${snapshot.error}",
                            Color(0xff941420), Colors.white);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        print('No data found');
                      }

                      List<MarketingMaterialModel>? bimdetails = snapshot.data!;
                      //print('CAD Details name: ${bimdetails[0].name}');

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        //scrollDirection: Axis.vertical,
                        itemCount: bimdetails.length,
                        itemBuilder: (context, index) {
                          MarketingMaterialModel dataSheets = bimdetails[index];
                          List<MarketingMaterialFileData> files =
                              dataSheets.files;
                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                bimdetails[index].name,
                                style: TextStyle(
                                    color: Color(0xff941420),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (MarketingMaterialFileData file in files)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (value) async {
                                                  try {
                                                    await downloadFile(
                                                        file.subFolderDocuments[
                                                            0],
                                                        'RkDoor');
                                                  } catch (e) {
                                                    print(
                                                        'something went wrong $e');
                                                  }
                                                  // print(file
                                                  //     .subFolderDocuments[0]);
                                                },
                                                icon: Icons.file_open,
                                                foregroundColor: Colors.blue,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ]),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${file.fileNumber}.  ',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Color(0xff941420),
                                                fontSize: 14,
                                              ),
                                            ),
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth: MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.8), // Adjust maxWidth as needed
                                              child: Text(
                                                '${file.fileDescription}',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Color(0xff941420),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
