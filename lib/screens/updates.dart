import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
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
        centerTitle: true,
      ),
      floatingActionButton: widget.role == "admin"
          ? FloatingActionButton.small(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.5)),
              // this functionality iside onPressed is a modal which contains a field where admin can add update and that update will be shown
              // on this page
              onPressed: () async {
                showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Add Update",
                            style: TextStyle(
                                fontSize: 24, color: Color(0xff941420)),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: updatesController,
                            maxLines: 6,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 246, 245, 245),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .sendUpdatesForAdmin(updatesController.text);
                            },
                            child: Text("Submit"),
                            color: Color(0xff941420),
                            textColor: Colors.white,
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.5)),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              backgroundColor: Color(0xff941420),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
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
                  // it is used to handle future functions response, like when it in loading state, or has an error, or has no data, or if has data
                  // then it will show
                  child: FutureBuilder(
                    future: NetworkApiServices().getUpdatesValue(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info),
                            Text(
                              'No Updates Available',
                              style: TextStyle(fontSize: 23),
                            ),
                          ],
                        ));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.5),
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
