import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/testingModel.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class Testing extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const Testing(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<TextEditingController> controllers = [];

  TextEditingController category = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController descController = TextEditingController();

  File? _image;
  List<File> filesToUpload = [];
  Future<List<File>> getImage() async {
    final _picker = ImagePicker();

    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      filesToUpload.clear();
      filesToUpload.add(_image!);
      return filesToUpload;
    } else {
      print('no image selected');
      return [];
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
          'Testing',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: widget.role == "admin"
          ? FloatingActionButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          insetPadding: EdgeInsets.all(9),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  right: -40,
                                  top: -40,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Color(0xff941420),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              Form(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                      child: Text('Add Category',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff941420),
                                              fontWeight: FontWeight.w600))),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: category,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff941420)))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RoundButton(
                                    text: 'Save',
                                    onTap: () async {
                                      apiServices
                                          .addInsideFolder6(category.text);

                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                    },
                                    color: Color(0xff941420),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ));
              },
              backgroundColor: Color(0xff941420),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
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
                    future: apiServices.getCEDDetailsSeven(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        Utils().showToast("${snapshot.error}",
                            Color(0xff941420), Colors.white);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: Text("Data is being loaded..."));
                      } else if (!snapshot.hasData) {
                        print('No data found');
                      }

                      List<TestingModel>? bimdetails = snapshot.data!;
                      bimdetails.forEach((element) {
                        TextEditingController value = TextEditingController();
                        value.text = element.name;
                        controllers.add(value);
                      });
                      //print('CAD Details name: ${bimdetails[0].name}');

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        //scrollDirection: Axis.vertical,
                        itemCount: bimdetails.length,
                        itemBuilder: (context, index) {
                          TestingModel dataSheets = bimdetails[index];
                          List<testingFileData> files = dataSheets.files;
                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              widget.role == "admin"
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            bimdetails[index].name,
                                            style: TextStyle(
                                                color: Color(0xff941420),
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () async {
                                                    TextEditingController
                                                        value =
                                                        controllers[index];
                                                    await showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10))),
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              9),
                                                                  content:
                                                                      Stack(
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Positioned(
                                                                          right:
                                                                              -40,
                                                                          top:
                                                                              -40,
                                                                          child:
                                                                              InkResponse(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const CircleAvatar(
                                                                              backgroundColor: Color(0xff941420),
                                                                              child: Icon(
                                                                                Icons.close,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Form(
                                                                          child:
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Center(
                                                                              child: Text('Update', style: TextStyle(fontSize: 20, color: Color(0xff941420), fontWeight: FontWeight.w600))),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                TextFormField(
                                                                              maxLines: 1,
                                                                              controller: value,
                                                                              decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff941420)))),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          RoundButton(
                                                                            text:
                                                                                'Save',
                                                                            onTap:
                                                                                () async {
                                                                              apiServices.updateDirectoryName6(dataSheets.id, value.text);

                                                                              Navigator.of(context, rootNavigator: true).pop('dialog');
                                                                            },
                                                                            color:
                                                                                Color(0xff941420),
                                                                          )
                                                                        ],
                                                                      ))
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 14,
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Icon(
                                                                Icons.warning),
                                                            content: Text(
                                                                'Are u sure you want to delete this quotation'),
                                                            actions: [
                                                              Center(
                                                                child: Column(
                                                                  children: [
                                                                    RoundButton(
                                                                      text:
                                                                          'Delete',
                                                                      onTap:
                                                                          () {
                                                                        apiServices
                                                                            .deleteWholeDirectory6(dataSheets.id);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    RoundButton(
                                                                      text:
                                                                          'Cancel',
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 14,
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10))),
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              9),
                                                                  content:
                                                                      Stack(
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      Positioned(
                                                                          right:
                                                                              -40,
                                                                          top:
                                                                              -40,
                                                                          child:
                                                                              InkResponse(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const CircleAvatar(
                                                                              backgroundColor: Color(0xff941420),
                                                                              child: Icon(
                                                                                Icons.close,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Form(
                                                                          child:
                                                                              Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Center(
                                                                              child: Text('Add New', style: TextStyle(fontSize: 20, color: Color(0xff941420), fontWeight: FontWeight.w600))),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                TextFormField(
                                                                              maxLines: 1,
                                                                              controller: numberController,
                                                                              decoration: InputDecoration(hintText: 'File Number', border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff941420)))),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                TextFormField(
                                                                              maxLines: 1,
                                                                              controller: descController,
                                                                              decoration: InputDecoration(hintText: 'File Description', border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff941420)))),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              IconButton(
                                                                                onPressed: () {
                                                                                  getImage();
                                                                                },
                                                                                icon: Icon(Icons.add_circle_outline),
                                                                              ),
                                                                              SizedBox(width: 20),
                                                                              Text(
                                                                                'Add Files',
                                                                                style: TextStyle(color: Colors.grey),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          RoundButton(
                                                                            text:
                                                                                'Save',
                                                                            onTap:
                                                                                () async {
                                                                              //apiServices.updateDirectoryName(cadDetails.id, value.text);
                                                                              apiServices.addSubFolders6(dataSheets.name, numberController.text, descController.text, filesToUpload);

                                                                              Navigator.of(context, rootNavigator: true).pop('dialog');
                                                                            },
                                                                            color:
                                                                                Color(0xff941420),
                                                                          )
                                                                        ],
                                                                      ))
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 14,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  : Text(
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
                                  for (testingFileData file in files)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                            motion: StretchMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (value) {
                                                  // downloadFile(file
                                                  //     .subFolderDocuments[0]);
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
