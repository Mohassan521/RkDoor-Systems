import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/dropdown.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/components/tables/employeeTable.dart';
import 'package:price_link/components/tables/orderTable.dart';
import 'package:price_link/components/tables/ownerTable.dart';
import 'package:price_link/components/tables/quotationsTable.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  final String? dealer_id;
  final String? dealer_name;
  const DashboardPage({super.key, this.dealer_id, this.dealer_name});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> createEmployeeForm() async {
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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                            child: Text('Create Employee',
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
                            decoration:
                                InputDecoration(hintText: 'Enter First Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Enter Last Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Quotation Type'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Minimum markup'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Post Code'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Telephone'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Max Discount'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Confirm Password'),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                              Flexible(
                                child: Text(
                                  'Please Note: All quotation will display the admin user address registered under the post code above. To display an alternative address specific tho this employee please select this tick box and enter address below.',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xff941420)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RoundButton(
                          text: 'Submit',
                          onTap: () {},
                          color: Color(0xff941420),
                        )
                      ],
                    )),
                  )
                ],
              ),
            ));
  }

  bool isChecked = false;
  late String selectedValue;
  List<String> qtyList = ['1', '10', '25', '50', '100'];

  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    print('Dealer ID in dashboard ${widget.dealer_id}');
    var userData = Provider.of<UserLoginData>(context, listen: false).dataModel;
    //final paginationProvider = Provider.of<PaginationProvider>(context);

    return Scaffold(
        drawer: DrawerPage(
          dealerName: widget.dealer_name,
          dealer_id: widget.dealer_id,
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
                        Text(
                            'App Developer\nGulshan e Iqbal block 11\nsame as above\n74600')
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Row(
              //     children: [
              //       Text('Show '),
              //       Consumer<SelectedValueProvider>(
              //           builder: (context, value, child) {
              //         return Container(
              //           height: MediaQuery.of(context).size.height * 0.035,
              //           width: MediaQuery.of(context).size.width * 0.16,
              //           child: ReusableDropdown(
              //               items: qtyList,
              //               valueProvider: value,
              //               onChanged: (newValue) {}),
              //         );
              //       }),
              //       Text(' Entries'),
              //     ],
              //   ),
              // ),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        createEmployeeForm();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Color(0xff941420),
                          ),
                          Text(
                            'Add Employee',
                            style: TextStyle(color: Color(0xff941420)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Row(
              //     children: [
              //       Text('Show '),
              //       Container(
              //           height: MediaQuery.of(context).size.height * 0.035,
              //           width: MediaQuery.of(context).size.width * 0.16,
              //           child: Consumer<SelectedValueProvider>(
              //               builder: (context, value, child) {
              //             return ReusableDropdown(
              //                 items: qtyList,
              //                 valueProvider: value,
              //                 onChanged: (newValue) {});
              //           })),
              //       Text(' Entries'),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: EmployeeTable(
                  dealer_id: widget.dealer_id!,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
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
              // SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Row(
              //     children: [
              //       Text('Show '),
              //       Consumer<SelectedValueProvider>(
              //           builder: (context, value, child) {
              //         return Container(
              //           height: MediaQuery.of(context).size.height * 0.035,
              //           width: MediaQuery.of(context).size.width * 0.16,
              //           child: ReusableDropdown(
              //               items: qtyList,
              //               valueProvider: value,
              //               onChanged: (newValue) {}),
              //         );
              //       }),
              //       Text(' Entries'),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: OrdersTable(
                  dealerId: widget.dealer_id,
                ),
              ),
              SizedBox(
                height: 15,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RkDoorCalculatorView(
                                    dealerId: widget.dealer_id,
                                    url:
                                        'https://www.pricelink.net/rk-door-calculator/?user_id=${widget.dealer_id}&mobile_token=true'))));
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
              // SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Row(
              //     children: [
              //       Text('Show '),
              //       Consumer<SelectedValueProvider>(
              //           builder: (context, value, child) {
              //         return Container(
              //           height: MediaQuery.of(context).size.height * 0.035,
              //           width: MediaQuery.of(context).size.width * 0.16,
              //           child: ReusableDropdown(
              //               items: qtyList,
              //               valueProvider: value,
              //               onChanged: (newValue) {}),
              //         );
              //       }),
              //       Text(' Entries'),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: QuotationsTable(
                  dealerId: widget.dealer_id,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
