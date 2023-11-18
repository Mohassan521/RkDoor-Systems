import 'package:flutter/material.dart';
import 'package:price_link/screens/DoorAwaitingBalance.dart';
import 'package:price_link/screens/DoorInRKDS.dart';
import 'package:price_link/screens/DoorOutOfDelivery.dart';
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
import 'package:price_link/screens/allDoorOrders.dart';
import 'package:price_link/screens/allEnquiries.dart';
import 'package:price_link/screens/allSteelOrders.dart';
import 'package:price_link/screens/closedEnquiries.dart';
import 'package:price_link/screens/completedOrders.dart';
import 'package:price_link/screens/completedSteelOrders.dart';
import 'package:price_link/screens/createEmployee.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/screens/dealerLogo.dart';
import 'package:price_link/screens/doorAwaitedSurvey.dart';
import 'package:price_link/screens/doorAwaitingDeposit.dart';
import 'package:price_link/screens/doorConfirmation.dart';
import 'package:price_link/screens/doorDelayed.dart';
import 'package:price_link/screens/doorDelivered.dart';
import 'package:price_link/screens/doorDepositReceived.dart';
import 'package:price_link/screens/doorInProduction.dart';
import 'package:price_link/screens/doorOnHold.dart';
import 'package:price_link/screens/doorOrderPlaced.dart';
import 'package:price_link/screens/doorOrderReceived.dart';
import 'package:price_link/screens/doorReadyForShipping.dart';
import 'package:price_link/screens/doorRevised.dart';
import 'package:price_link/screens/doorTransitToUK.dart';
import 'package:price_link/screens/employeeList.dart';
import 'package:price_link/screens/entranceDoorEnquiries.dart';
import 'package:price_link/screens/entrance_door_quotations.dart';
import 'package:price_link/screens/hotLeads.dart';
import 'package:price_link/screens/login.dart';
import 'package:price_link/screens/newEnquiryForm.dart';
import 'package:price_link/screens/rkdoorCalculatorView.dart';
import 'package:price_link/screens/steelAwaitingBalance.dart';
import 'package:price_link/screens/steelAwaitingDeposit.dart';
import 'package:price_link/screens/steelDelayed.dart';
import 'package:price_link/screens/steelDelivered.dart';
import 'package:price_link/screens/steelDepositReceived.dart';
import 'package:price_link/screens/steelEnquiries.dart';
import 'package:price_link/screens/steelInProduction.dart';
import 'package:price_link/screens/steelOrderPlaced.dart';
import 'package:price_link/screens/steelOrderReceived.dart';
import 'package:price_link/screens/steelOutForDelivery.dart';
import 'package:price_link/screens/steelPreliminaryConfirmation.dart';
import 'package:price_link/screens/steelReadyForShipping.dart';
import 'package:price_link/screens/steelRevisedConfirmation.dart';
import 'package:price_link/screens/swindonSBC.dart';
import 'package:price_link/screens/updates.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
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
                              builder: (context) => DashboardPage()));
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
                                  builder: (context) => AllEnquiries()));
                        },
                        title: Text('All Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EntranceDoorEnquiries()));
                        },
                        title: Text('Entrance Door Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelEnquiries()));
                        },
                        title: Text('Steel Enquiries',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SwindonwSBC()));
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
                              builder: ((context) => NewEnquiryForm())));
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
                              builder: (context) => EntranceDoorQuotations()));
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
                                  builder: (context) => const AllDoorOrders()));
                        },
                        title: Text('All Door Orders',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorOrderReceived()));
                        },
                        title: Text('Door Order Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorOrderPlaced()));
                        },
                        title: Text('Door order placed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorAwaitingDeposit()));
                        },
                        title: Text('Door awaiting deposit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorAwaitedSurvey()));
                        },
                        title: Text('Door Awaiting Survey / Dimensions',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorDepositReceived()));
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
                                      const DoorPreliminaryConfirmation()));
                        },
                        title: Text('Door Preliminary Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorRevisedConfirmation()));
                        },
                        title: Text('Door Revised Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorReadyForShipping()));
                        },
                        title: Text('Door Ready For Shipping',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorInProduction()));
                        },
                        title: Text('Door In Production',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorTransitToUK()));
                        },
                        title: Text('Door In Transit to UK ',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoorInRKDS()));
                        },
                        title: Text('Door In RKDS Warehouse ',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorAwaitingBalance()));
                        },
                        title: Text('Door Awaiting Balance Payment',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoorOutOfDelivery()));
                        },
                        title: Text('Door Out For Delivery',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoorDelivered()));
                        },
                        title: Text('Door Delivered',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoorDelayed()));
                        },
                        title: Text('Door Delayed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoorOnHold()));
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
                                  builder: (context) =>
                                      const AllSteelOrders()));
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
                              builder: (context) => const EmployeeList()));
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
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();

                      sp.setBool('isLogin', false);
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
