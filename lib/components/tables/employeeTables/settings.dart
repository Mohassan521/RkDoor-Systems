import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/services/services.dart';

class EmployeeDetails extends StatefulWidget {
  final String? empId;
  final String? empName;
  final String? role;
  final String? dealerId;
  const EmployeeDetails(
      {super.key, this.empId, this.empName, this.role, this.dealerId});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    //print("Settings: ${list.}");
    print('dealer ID and empId: ${widget.dealerId} ${widget.empId}');
    return Scaffold(
        drawer: DrawerPage(
          empId: widget.empId,
          dealerName: widget.empName,
          role: widget.role,
          dealer_id: widget.dealerId,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: Text(
            'Employee Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
          child: FutureBuilder(
            future: NetworkApiServices()
                .getLoggedInUserDetails(widget.dealerId!, widget.empId!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('this is the error u are looking for: ${snapshot.error}');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                Center(child: Text('data is being loaded...'));
              } else if (snapshot.data == null || !snapshot.hasData) {
                Center(child: CircularProgressIndicator());
              }
              //print("to check condition: ${snapshot.data}");
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Name:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.display_name!
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Email:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.user_email!
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Telephone:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.telephone!
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee PostCode:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.postCode ?? ""
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Quotation Type:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.quotation_type ?? ""
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Minimum Markup:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.markup ?? ""
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Employee Maximum Discount:  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          snapshot.data != null
                              ? snapshot.data!.maxDiscount ?? ""
                              : "",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              );
            },
          ),
        ));
  }
}
