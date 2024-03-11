import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/CadDetailsModel.dart';
import 'package:price_link/models/PDFDetailsModel.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

class PDFDetails extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const PDFDetails(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<PDFDetails> createState() => _PDFDetailsState();
}

class _PDFDetailsState extends State<PDFDetails> {
  NetworkApiServices apiServices = NetworkApiServices();
  List<TextEditingController> controllers = [];
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
          'PDF Details',
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
                    future: apiServices.getCEDDetailsTwo(),
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

                      List<PDFDetailsModel>? caddetails = snapshot.data ?? [];
                      caddetails.forEach((element) { 
                          TextEditingController value = TextEditingController();
                          value.text = element.name;
                          controllers.add(value);
                        });
                      //print('CAD Details name: ${caddetails[0].name}');

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        //scrollDirection: Axis.vertical,
                        itemCount: caddetails.length,
                        itemBuilder: (context, index) {
                          PDFDetailsModel cadDetails = caddetails[index];
                          List<PDFFileData> files = cadDetails.files;
                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              widget.role == "admin" ? Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                  caddetails[index].name,
                                  style: TextStyle(
                                      color: Color(0xff941420),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                                      onTap: () async {
                                                        TextEditingController value = controllers[index];
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
                                              
                                                                                        apiServices.updateDirectoryName2(cadDetails.id, value.text);
                                                                                      
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
                                                  InkWell(
                                                      onTap: () {
                                                        showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Icon(Icons.warning),
                      content:
                          Text('Are u sure you want to delete this quotation'),
                      actions: [
                        Center(
                          child: Column(
                            children: [
                              RoundButton(
                                text: 'Delete',
                                onTap: () {
                                  apiServices.deleteWholeDirectory2(cadDetails.id);
                                  Navigator.pop(context);
                                },
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RoundButton(
                                text: 'Cancel',
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.blue,
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
                                                      ))
                                
                                  ],
                                )
                                  ],
                                ),
                              ) :  Text(
                                caddetails[index].name,
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
                                  for (PDFFileData file in files)
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
