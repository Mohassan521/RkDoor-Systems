import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/allDoorOrdersTable.dart';
import 'package:price_link/components/tables/employeeTable.dart';
import 'package:price_link/components/tables/employeeTables/employeeTable.dart';
import 'package:price_link/components/tables/ownerTable.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/services/services.dart';

class DashboardPage extends StatefulWidget {
  final String? dealer_id;
  final String? dealer_name;
  final String? empId;
  final String? role;
  const DashboardPage(
      {super.key, this.dealer_id, this.dealer_name, this.empId, this.role});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController markup = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController address3 = TextEditingController();

  String type = "";

  // Future<void> createEmployeeForm() async {
  //   await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10))),
  //             insetPadding: EdgeInsets.all(9),
  //             content: Stack(
  //               clipBehavior: Clip.none,
  //               children: [
  //                 Positioned(
  //                     right: -40,
  //                     top: -40,
  //                     child: InkResponse(
  //                       onTap: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       child: const CircleAvatar(
  //                         backgroundColor: Color(0xff941420),
  //                         child: Icon(
  //                           Icons.close,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     )),
  //                 SingleChildScrollView(
  //                   scrollDirection: Axis.vertical,
  //                   child: Form(
  //                       child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Center(
  //                           child: Text('Create Employee',
  //                               style: TextStyle(
  //                                   fontSize: 20,
  //                                   color: Color(0xff941420),
  //                                   fontWeight: FontWeight.w600))),
  //                       SizedBox(
  //                         height: 15,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: fname,
  //                           decoration:
  //                               InputDecoration(hintText: 'Enter First Name'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: lname,
  //                           decoration:
  //                               InputDecoration(hintText: 'Enter Last Name'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: DropdownButton<String>(
  //                           alignment: Alignment.center,
  //                           isExpanded: true,
  //                           value: type,
  //                           underline: Container(
  //                             height: 2,
  //                             color: Colors.grey,
  //                           ),
  //                           onChanged: (String? newValue) {
  //                             setState(() {
  //                               type = newValue ?? type;
  //                             });
  //                           },
  //                           items: [
  //                             DropdownMenuItem<String>(
  //                                 value: '', child: Center(child: Text(''))),
  //                             DropdownMenuItem<String>(
  //                                 value: 'R', child: Center(child: Text('R'))),
  //                             DropdownMenuItem<String>(
  //                                 value: 'T', child: Center(child: Text('T'))),
  //                             DropdownMenuItem<String>(
  //                                 value: 'R&T',
  //                                 child: Center(child: Text('R&T'))),
  //                           ],
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: markup,
  //                           decoration:
  //                               InputDecoration(hintText: 'Minimum markup'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: postCode,
  //                           decoration: InputDecoration(hintText: 'Post Code'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: telephone,
  //                           decoration: InputDecoration(hintText: 'Telephone'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: discount,
  //                           decoration:
  //                               InputDecoration(hintText: 'Max Discount'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: email,
  //                           decoration: InputDecoration(hintText: 'Email'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: password,
  //                           decoration: InputDecoration(hintText: 'Password'),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8),
  //                         child: TextFormField(
  //                           controller: cpassword,
  //                           decoration:
  //                               InputDecoration(hintText: 'Confirm Password'),
  //                         ),
  //                       ),
  //                       Container(
  //                         child: Row(
  //                           children: [
  //                             Checkbox(
  //                                 value: isChecked,
  //                                 onChanged: (bool? value) {
  //                                   setState(() {
  //                                     isChecked = value!;
  //                                     print(isChecked);
  //                                   });
  //                                 }),
  //                             Flexible(
  //                               child: Text(
  //                                 'Please Note: All quotation will display the admin user address registered under the post code above. To display an alternative address specific tho this employee please select this tick box and enter address below.',
  //                                 style: TextStyle(
  //                                     fontSize: 10, color: Color(0xff941420)),
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       isChecked == true
  //                           ? Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Padding(
  //                                   padding: const EdgeInsets.all(8),
  //                                   child: TextFormField(
  //                                     controller: cpassword,
  //                                     decoration: InputDecoration(
  //                                         hintText: 'Customer Address 1'),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 15,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.all(8),
  //                                   child: TextFormField(
  //                                     controller: cpassword,
  //                                     decoration: InputDecoration(
  //                                         hintText: 'Customer Address 2'),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 15,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.all(8),
  //                                   child: TextFormField(
  //                                     controller: cpassword,
  //                                     decoration: InputDecoration(
  //                                         hintText: 'Customer Address 3'),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                           : Column(),
  //                       RoundButton(
  //                         text: 'Submit',
  //                         onTap: () {
  //                           if (password.text == cpassword.text) {
  //                             NetworkApiServices().createEmployees(
  //                                 widget.dealer_id!,
  //                                 fname.text,
  //                                 lname.text,
  //                                 markup.text,
  //                                 discount.text,
  //                                 postCode.text,
  //                                 telephone.text,
  //                                 email.text,
  //                                 password.text,
  //                                 type,
  //                                 address1.text,
  //                                 address2.text,
  //                                 address3.text);
  //                           }
  //                         },
  //                         color: Color(0xff941420),
  //                       )
  //                     ],
  //                   )),
  //                 )
  //               ],
  //             ),
  //           ));
  // }

  bool isChecked = false;

  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    print("dealer Id in dashboard: ${widget.role}");
    //var userData = Provider.of<UserLoginData>(context, listen: false).dataModel;
    //final paginationProvider = Provider.of<PaginationProvider>(context);
    // var dealerData = Provider.of<DealerData>(context).model;
    // print(dealerData.iD);
    Future<void> _handleRefresh() async {
      await apiServices.getDealersList(context, widget.dealer_id!);

      await apiServices.getEmployeeList(widget.dealer_id!);
      await apiServices.getOrdersList(widget.dealer_id!, "");
      await apiServices.getQuotationsList(widget.dealer_id);

      // Update the UI with the new data
      setState(() {});

      // Return a delayed Future to simulate a refresh
      return await Future.delayed(Duration(seconds: 2));
    }

    // print(dealerData);
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: Scaffold(
          drawer: DrawerPage(
            dealerName: widget.dealer_name,
            dealer_id: widget.dealer_id,
            empId: widget.empId,
            role: widget.role,
          ),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff941420),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dealer',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          FutureBuilder(
                            future: apiServices.getDealersList(
                                context, widget.dealer_id!),
                            builder: (context, snapshot) {
                              return Text(
                                  '${snapshot.data != null ? snapshot.data![0].dealerName : "loading name..."}\n${snapshot.data != null ? snapshot.data![0].dealerAddress1 : "loading address..."}\n${snapshot.data != null ? snapshot.data![0].dealerAddress2 : "loading address..."}\n${snapshot.data != null ? snapshot.data![0].dealerAddress3 : "loading address..."}\n${snapshot.data != null ? snapshot.data![0].postCodeRegister : "loading post code..."}');
                            },
                          )
                        ],
                      ),
                      Image(
                          width: MediaQuery.of(context).size.width * 0.35,
                          image: const AssetImage('assets/images/logo.jpeg'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Owner',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TablePage(dealer_id: widget.dealer_id!),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Employee List',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: widget.role == "employee"
                      ? EmployeeDashboardTable(dealer_id: widget.dealer_id!)
                      : EmployeeTable(
                          dealer_id: widget.dealer_id!,
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Orders',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AllDoorOrdersTable(
                    dealerId: widget.role == "employee"
                        ? widget.empId
                        : widget.dealer_id,
                    dealerName: widget.dealer_name ?? "",
                    role: widget.role,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quotations',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => CalculatorWebView(
                                      dealerId: widget.dealer_id!,
                                      dealerName: widget.dealer_name,
                                      empId: widget.empId,
                                      role: widget.role,
                                      url:
                                          'https://www.pricelink.net/rk-door-calculator/?user_id=${widget.role == "dealer" ? widget.dealer_id : widget.empId}&mobile_token=true'))));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xff941420),
                            ),
                            Text(
                              'Add New Quote',
                              style: TextStyle(color: Color(0xff941420)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: QuotationsTable(
                    dealerId: widget.role == "employee"
                        ? widget.empId
                        : widget.dealer_id,
                    dealerName: widget.dealer_name,
                    role: widget.role,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          )),
    );
  }
}
