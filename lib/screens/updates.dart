import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/updatedModel.dart';
import 'package:price_link/services/services.dart';

class Updates extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String? role;
  final String? empId;
  const Updates(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      this.role,
      this.empId});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {

  TextEditingController updatesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.role == "employee" ? widget.empId : widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
        empId: widget.empId,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Updates',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Visibility(
          visible: widget.role == "admin" ? true : false,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () async {
                await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                    child: Text('Updates',
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
                                    maxLines: 6,
                                    // initialValue: result.notes,
                                    controller: updatesController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff941420))),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RoundButton(
                                  text: 'Save',
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      NetworkApiServices().sendUpdatesForAdmin(updatesController.text);
                                    }

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
              child: Text("Add Update", style: TextStyle(color: Colors.white),)),
          )),
        ]
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.82,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: FutureBuilder(
                    future: NetworkApiServices().getUpdatesValue(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info),
                            Text('No Updates Available', style: TextStyle(fontSize: 23),),
                          ],
                        ));
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Data is being loaded...'),
                            ],
                          ),
                        );
                      }

                      List<UpdatesModel> list = snapshot.data ?? [];

                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 12),
                                          child: Text(
                                            '${list[index].updateMessage}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${list[index].date} ${list[index].time}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
