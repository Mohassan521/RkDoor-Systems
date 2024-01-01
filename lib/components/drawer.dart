import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/tables/steelInProductionTable.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/screens/Downloads/BIMFiles.dart';
import 'package:price_link/screens/Downloads/CADDetails.dart';
import 'package:price_link/screens/Downloads/Instructions.dart';
import 'package:price_link/screens/Downloads/PDFDetails.dart';
import 'package:price_link/screens/Downloads/careAndMaintenance.dart';
import 'package:price_link/screens/Downloads/dataSheets.dart';
import 'package:price_link/screens/Downloads/marketingImages.dart';
import 'package:price_link/screens/Downloads/marketingMaterial.dart';
import 'package:price_link/screens/Downloads/technical&Wiring.dart';
import 'package:price_link/screens/Downloads/testing.dart';
import 'package:price_link/screens/Enquiries/allEnquiries.dart';
import 'package:price_link/screens/Enquiries/entranceDoorEnquiries.dart';
import 'package:price_link/screens/Enquiries/steelEnquiries.dart';
import 'package:price_link/screens/Enquiries/swindonSBC.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/DoorAwaitingBalance.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/DoorInRKDS.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/DoorOutOfDelivery.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/allDoorOrders.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorAwaitedSurvey.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorAwaitingDeposit.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorConfirmation.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorDelayed.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorDelivered.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorDepositReceived.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorInProduction.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorOnHold.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorOrderPlaced.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorOrderReceived.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorReadyForShipping.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorRevised.dart';
import 'package:price_link/screens/Entrance%20Door%20Orders/doorTransitToUK.dart';
import 'package:price_link/screens/closedEnquiries.dart';
import 'package:price_link/screens/completedOrders.dart';
import 'package:price_link/screens/createEmployee.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/screens/dealerLogo.dart';
import 'package:price_link/screens/employeeList.dart';
import 'package:price_link/screens/entrance_door_quotations.dart';
import 'package:price_link/screens/hotLeads.dart';
import 'package:price_link/screens/login.dart';
import 'package:price_link/screens/newEnquiryForm.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/screens/steel%20Orders/allSteelOrders.dart';
import 'package:price_link/screens/steel%20Orders/completedSteelOrders.dart';
import 'package:price_link/screens/steel%20Orders/steelAwaitingBalance.dart';
import 'package:price_link/screens/steel%20Orders/steelAwaitingDeposit.dart';
import 'package:price_link/screens/steel%20Orders/steelDelayed.dart';
import 'package:price_link/screens/steel%20Orders/steelDelivered.dart';
import 'package:price_link/screens/steel%20Orders/steelDepositReceived.dart';
import 'package:price_link/screens/steel%20Orders/steelOrderPlaced.dart';
import 'package:price_link/screens/steel%20Orders/steelOrderReceived.dart';
import 'package:price_link/screens/steel%20Orders/steelOutForDelivery.dart';
import 'package:price_link/screens/steel%20Orders/steelPreliminaryConfirmation.dart';
import 'package:price_link/screens/steel%20Orders/steelReadyForShipping.dart';
import 'package:price_link/screens/steel%20Orders/steelRevisedConfirmation.dart';
import 'package:price_link/screens/updates.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  final String? dealer_id;
  final String? dealerName;
  const DrawerPage({super.key, this.dealer_id, this.dealerName});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('dealer ID in drawer ${widget.dealer_id}');

    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        backgroundColor: Color(0xff941420),
        elevation: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: DrawerHeader(
                child: Image(
                  image: AssetImage('assets/images/logo.jpeg'),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardPage(
                                    dealer_id: widget.dealer_id,
                                    dealer_name: widget.dealerName,
                                  )));
                    },
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ExpansionTile(
                    collapsedIconColor: Color(0xffFFFFFF),
                    title: Text('Enquiries',
                        style: TextStyle(color: Colors.white)),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllEnquiries(
                                        dealerId: widget.dealer_id,
                                        dealerName: widget.dealerName,
                                      )));
                        },
                        title: Text('All Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EntranceDoorEnquiries(
                                        dealer_id: widget.dealer_id!,
                                        dealer_name: widget.dealerName!,
                                      )));
                        },
                        title: Text('Entrance Door Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelEnquiries(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                      )));
                        },
                        title: Text('Steel Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SwindonwSBC(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                      )));
                        },
                        title: Text('Swinton SBC',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NewEnquiryForm(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                  ))));
                    },
                    title: Text('New Enquiry Form',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HotLeads()));
                    },
                    title: Text('Hot Leads',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EntranceDoorQuotations(
                                    dealerId: widget.dealer_id,
                                    dealerName: widget.dealerName,
                                  )));
                    },
                    title: Text('Entrance Door Quotations',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ExpansionTile(
                    collapsedIconColor: Color(0xffFFFFFF),
                    title: Text('Entrance Door Orders',
                        style: TextStyle(color: Colors.white)),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllDoorOrders(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('All Door Orders',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorOrderReceived(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door Order Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorOrderPlaced(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door order placed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorAwaitingDeposit(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door awaiting deposit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorAwaitedSurvey(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door Awaiting Survey / Dimensions',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorDepositReceived(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door Deposit Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DoorPreliminaryConfirmation(
                                        dealerId: widget.dealer_id,
                                      )));
                        },
                        title: Text('Door Preliminary Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorRevisedConfirmation(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Revised Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorReadyForShipping(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Ready For Shipping',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorInProduction(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door In Production',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorTransitToUK(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door In Transit to UK ',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorInRKDS(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door In RKDS Warehouse ',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorAwaitingBalance(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Awaiting Balance Payment',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorOutOfDelivery(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Out For Delivery',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorDelivered(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Delivered',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorDelayed(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door Delayed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoorOnHold(
                                        dealerId: widget.dealer_id!,
                                      )));
                        },
                        title: Text('Door On Hold',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    collapsedIconColor: Color(0xffFFFFFF),
                    title: Text('Steel Orders',
                        style: TextStyle(color: Colors.white)),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllSteelOrders(
                                        dealer_id: widget.dealer_id ?? "",
                                      )));
                        },
                        title: const Text('All Steel Orders',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelOrderReceived()));
                        },
                        title: const Text('Steel Order Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelOrderPlaced()));
                        },
                        title: Text('Steel Order Placed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelAwaitingDeposit()));
                        },
                        title: Text('Steel Awaiting Deposit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelDepositReceived()));
                        },
                        title: Text('Steel Deposit Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelPreliminaryConfirmation()));
                        },
                        title: Text('Steel Preliminary Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelRevisedConfirmation()));
                        },
                        title: Text('Steel Revised Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelReadyForShipping()));
                        },
                        title: Text('Steel Ready For Shipping',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelInProduction()));
                        },
                        title: Text('Steel In production',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelAwaitingBalance()));
                        },
                        title: Text('Steel Awaiting Balance Payment',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelOutForDelivery()));
                        },
                        title: Text('Steel Out For Delivery',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SteelDelivered()));
                        },
                        title: Text('Steel Delivered',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SteelDelayed()));
                        },
                        title: Text('Steel Delayed',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Updates()));
                    },
                    title:
                        Text('Updates', style: TextStyle(color: Colors.white)),
                  ),
                  ExpansionTile(
                    collapsedIconColor: Color(0xffFFFFFF),
                    title: Text('Downloads',
                        style: TextStyle(color: Colors.white)),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CADDetails()));
                        },
                        title: const Text('CAD Details',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDFDetails()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFDetails()));
                        },
                        title: Text('PDF details',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BIMFiles()));
                        },
                        title: Text('BIM Files',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CareAndMaintenance()));
                        },
                        title: Text('Care & Maintenance',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Instructions()));
                        },
                        title: Text('Instructions',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DataSheets()));
                        },
                        title: Text('Data Sheets',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Testing()));
                        },
                        title: Text('Testing',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TechnicalAndWiring()));
                        },
                        title: Text('Technical & Wiring',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MarketingMaterial()));
                        },
                        title: Text('Marketing Material',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MarketingImages()));
                        },
                        title: Text('Marketing Images',
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RkDoorCalculatorView(
                                    url:
                                        'https://www.pricelink.net/rk-door-calculator/',
                                  )));
                    },
                    title: Text('RK Door Calculator',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompletedOrders()));
                    },
                    title: Text('Completed Orders',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CompletedSteelOrders()));
                    },
                    title: Text('Completed Steel Orders',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ClosedEnquiry()));
                    },
                    title: Text('Closed Enquiries',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeList(
                                    dealer_id: widget.dealer_id!,
                                  )));
                    },
                    title: Text('Employee List',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateEmployee()));
                    },
                    title: const Text('Create Employee',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DealerLogo()));
                    },
                    title: Text('Dealer Logo',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isLogin', false);
                      prefs.clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    title:
                        Text('Logout', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
