import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/components/tables/employeeTables/settings.dart';
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
import 'package:price_link/screens/adminScreens/adminHome.dart';
import 'package:price_link/screens/adminScreens/administrationStaffForm.dart';
import 'package:price_link/screens/adminScreens/administratorsList.dart';
import 'package:price_link/screens/adminScreens/ankaItems.dart';
import 'package:price_link/screens/adminScreens/archiveDoorOrders.dart';
import 'package:price_link/screens/adminScreens/archiveEnquiries.dart';
import 'package:price_link/screens/adminScreens/archiveQuotations.dart';
import 'package:price_link/screens/adminScreens/archiveSteelOrders.dart';
import 'package:price_link/screens/adminScreens/dealerList.dart';
import 'package:price_link/screens/adminScreens/enquiryAllocation.dart';
import 'package:price_link/screens/adminScreens/newEnquiryForm.dart';
import 'package:price_link/screens/adminScreens/orderAllocation.dart';
import 'package:price_link/screens/adminScreens/queuesAllocation.dart';
import 'package:price_link/screens/adminScreens/steelOrderForm.dart';
import 'package:price_link/screens/calculatorWebView.dart';
import 'package:price_link/screens/closedEnquiries.dart';
import 'package:price_link/screens/completedOrders.dart';
import 'package:price_link/screens/createEmployee.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/screens/employeeList.dart';
import 'package:price_link/screens/entrance_door_quotations.dart';
import 'package:price_link/screens/hotLeads.dart';
import 'package:price_link/screens/login.dart';
import 'package:price_link/screens/newEnquiryForm.dart';
import 'package:price_link/screens/steel%20Orders/allSteelOrders.dart';
import 'package:price_link/screens/steel%20Orders/completedSteelOrders.dart';
import 'package:price_link/screens/steel%20Orders/steelAwaitingBalance.dart';
import 'package:price_link/screens/steel%20Orders/steelAwaitingDeposit.dart';
import 'package:price_link/screens/steel%20Orders/steelDelayed.dart';
import 'package:price_link/screens/steel%20Orders/steelDelivered.dart';
import 'package:price_link/screens/steel%20Orders/steelDepositReceived.dart';
import 'package:price_link/screens/steel%20Orders/steelInProduction.dart';
import 'package:price_link/screens/steel%20Orders/steelOrderForm.dart';
import 'package:price_link/screens/steel%20Orders/steelOrderPlaced.dart';
import 'package:price_link/screens/steel%20Orders/steelOrderReceived.dart';
import 'package:price_link/screens/steel%20Orders/steelOutForDelivery.dart';
import 'package:price_link/screens/steel%20Orders/steelPreliminaryConfirmation.dart';
import 'package:price_link/screens/steel%20Orders/steelReadyForShipping.dart';
import 'package:price_link/screens/steel%20Orders/steelRevisedConfirmation.dart';
import 'package:price_link/screens/updates.dart';
import 'package:price_link/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  final String? dealer_id;
  final String? dealerName;
  final String? empId;
  final String? role;
  const DrawerPage(
      {super.key, this.dealer_id, this.dealerName, this.empId, this.role});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('dealer ID in drawer ${widget.dealer_id}');
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
    final _formKey3 = GlobalKey<FormState>();
    final _formKey4 = GlobalKey<FormState>();
    final _formKey5 = GlobalKey<FormState>();
    final _formKey6 = GlobalKey<FormState>();
    final _formKey7 = GlobalKey<FormState>();
    final _formKey8 = GlobalKey<FormState>();
    final _formKey9 = GlobalKey<FormState>();
    final _formKey10 = GlobalKey<FormState>();

    TextEditingController subFolder = TextEditingController();
    TextEditingController subFolder2 = TextEditingController();
    TextEditingController subFolder3 = TextEditingController();
    TextEditingController subFolder4 = TextEditingController();
    TextEditingController subFolder5 = TextEditingController();
    TextEditingController subFolder6 = TextEditingController();
    TextEditingController subFolder7 = TextEditingController();
    TextEditingController subFolder8 = TextEditingController();
    TextEditingController subFolder9 = TextEditingController();
    TextEditingController subFolder10 = TextEditingController();

    String updatesValue;

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
                              builder: (context) => widget.role == "admin"
                                  ? AdminHomePage(
                                      dealer_id: widget.dealer_id,
                                      dealer_name: widget.dealerName,
                                      role: "admin",
                                    )
                                  : DashboardPage(
                                      dealer_id: widget.dealer_id,
                                      dealer_name: widget.dealerName,
                                      empId: widget.empId,
                                      role: widget.role,
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
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        empId: widget.empId,
                                        role: widget.role,
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
                                empId: widget.empId,
                                role: widget.role,
                              ),
                            ),
                          );
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
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Swinton SBC',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.role == "employee" ? false : true,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => widget.role == "admin"
                                    ? AdminEnquiryForm(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: "admin",
                                      )
                                    : NewEnquiryForm(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      ))));
                      },
                      title: Text('New Enquiry Form',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotLeads(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName ?? "",
                                    empId: widget.empId,
                                    role: widget.role,
                                  )));
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
                                    empId: widget.empId,
                                    role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Door On Hold',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.dealer_id == "180" ||
                            widget.empId == "181" ||
                            widget.empId == "182"
                        ? true
                        : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnkaItemsForAdmin(
                                      dealerId: widget.dealer_id,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                    )));
                      },
                      title:
                          Text('Anka', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "employee" ? false : true,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widget.role == "admin"
                                    ? SteelOrderFormForAdmin(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                      )
                                    : SteelOrderForm(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                      },
                      title: Text('Steel Order Form',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalculatorWebView(
                                      dealerId: widget.dealer_id!,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                      empId: widget.empId,
                                      url: 'https://steel.pricelink.net/',
                                    )));
                      },
                      title: Text('Steel Configurator',
                          style: TextStyle(color: Colors.white)),
                    ),
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
                                        dealer_id: widget.dealer_id!,
                                        dealer_name: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
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
                                  builder: (context) => SteelOrderReceived(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: const Text('Steel Order Received',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelOrderPlaced(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Order Placed',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelAwaitingDeposit(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Awaiting Deposit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelDepositReceived(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
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
                                      SteelPreliminaryConfirmation(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
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
                                      SteelRevisedConfirmation(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Revised Confirmation Issued',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelReadyForShipping(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Ready For Shipping',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelInProduction(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel In production',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelAwaitingBalance(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Awaiting Balance Payment',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelOutForDelivery(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Out For Delivery',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelDelivered(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Delivered',
                            style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SteelDelayed(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        empId: widget.empId,
                                        role: widget.role,
                                      )));
                        },
                        title: Text('Steel Delayed',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QueuesAllocation(
                                      dealerId: widget.dealer_id,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                    )));
                      },
                      title: Text('Quotes Allocation',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrdersAllocation(
                                      dealerId: widget.dealer_id,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                    )));
                      },
                      title: Text('Orders Allocation',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnquiryAllocation(
                                      dealerId: widget.dealer_id,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                    )));
                      },
                      title: Text('Enquiry Allocation',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Updates(
                                    dealerId: widget.role == "employee"
                                        ? widget.empId!
                                        : widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                    role: widget.role,
                                    empId: widget.empId,
                                  )));
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
                                  builder: (context) => CADDetails(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder1Downloads(),
                          builder: (context, snapshot) {
                            //print(snapshot.data);
                            updatesValue = snapshot.data ?? "";
                            return Text(updatesValue,
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder1Downloads()
                                  .then((value) async {
                                subFolder.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller: subFolder,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder1(
                                                                    subFolder
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                              visible: widget.role == "admin" ? true : false,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFDetails(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder2Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder2Downloads()
                                  .then((value) async {
                                subFolder2.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder2,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey2
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder2(
                                                                    subFolder2
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CareAndMaintenance(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder3Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder3Downloads()
                                  .then((value) async {
                                subFolder3.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey3,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder3,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey3
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder3(
                                                                    subFolder3
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Instructions(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder4Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder4Downloads()
                                  .then((value) async {
                                subFolder4.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey4,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder4,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey4
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder4(
                                                                    subFolder4
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataSheets(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder5Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder5Downloads()
                                  .then((value) async {
                                subFolder5.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey5,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder5,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey5
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder5(
                                                                    subFolder5
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Testing(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder6Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder6Downloads()
                                  .then((value) async {
                                subFolder6.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey6,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder6,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey6
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder6(
                                                                    subFolder6
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TechnicalAndWiring(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder7Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder7Downloads()
                                  .then((value) async {
                                subFolder7.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey7,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder7,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey7
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder7(
                                                                    subFolder7
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarketingMaterial(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder8Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder8Downloads()
                                  .then((value) async {
                                subFolder8.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey8,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder8,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey8
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder8(
                                                                    subFolder8
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BIMFiles(
                                dealerId: widget.dealer_id!,
                                dealerName: widget.dealerName!,
                                role: widget.role,
                                empId: widget.empId,
                              ),
                            ),
                          );
                        },
                        title: FutureBuilder(
                          future: NetworkApiServices().getSubFolder9Downloads(),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? "",
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            NetworkApiServices().getSubFolder9Downloads().then(
                              (value) async {
                                subFolder9.text = value;
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
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
                                              backgroundColor:
                                                  Color(0xff941420),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Form(
                                            key: _formKey9,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'Edit subfolder',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff941420),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: TextFormField(
                                                    maxLines: 6,
                                                    // initialValue: result.notes,
                                                    controller: subFolder9,
                                                    decoration: InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xff941420),
                                                          ),
                                                        ),
                                                        hintText: 'Notes'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                RoundButton(
                                                  text: 'Save',
                                                  onTap: () async {
                                                    if (_formKey9.currentState!
                                                        .validate()) {
                                                      NetworkApiServices()
                                                          .updateSubFolder9(
                                                              subFolder9.text);
                                                    }

                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop('dialog');
                                                  },
                                                  color: Color(0xff941420),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Visibility(
                            visible: widget.role == "admin" ? true : false,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarketingImages(
                                        dealerId: widget.dealer_id!,
                                        dealerName: widget.dealerName!,
                                        role: widget.role,
                                        empId: widget.empId,
                                      )));
                        },
                        title: FutureBuilder(
                          future:
                              NetworkApiServices().getSubFolder10Downloads(),
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? "",
                                style: TextStyle(color: Colors.white));
                          },
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              NetworkApiServices()
                                  .getSubFolder10Downloads()
                                  .then((value) async {
                                subFolder10.text = value;
                                await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          insetPadding: EdgeInsets.all(9),
                                          content: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                  right: -40,
                                                  top: -40,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xff941420),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              Form(
                                                  key: _formKey10,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Center(
                                                          child: Text(
                                                              'Edit subfolder',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color(
                                                                      0xff941420),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: TextFormField(
                                                          maxLines: 6,
                                                          // initialValue: result.notes,
                                                          controller:
                                                              subFolder10,
                                                          decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Color(0xff941420))),
                                                              hintText: 'Notes'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      RoundButton(
                                                        text: 'Save',
                                                        onTap: () async {
                                                          if (_formKey10
                                                              .currentState!
                                                              .validate()) {
                                                            NetworkApiServices()
                                                                .updateSubFolder10(
                                                                    subFolder10
                                                                        .text);
                                                          }

                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop('dialog');
                                                        },
                                                        color:
                                                            Color(0xff941420),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ));
                              });
                            },
                            icon: Visibility(
                                visible: widget.role == "admin" ? true : false,
                                child: Icon(Icons.edit, color: Colors.white))),
                      ),
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalculatorWebView(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName,
                                    role: widget.role,
                                    empId: widget.empId,
                                    url:
                                        'https://www.pricelink.net/rk-door-calculator/?user_id=${widget.role == "employee" ? widget.empId : widget.role == "dealer" || widget.role == "admin" ? widget.dealer_id : ""}&mobile_token=true',
                                  )));
                    },
                    title: Text('RK Door Calculator',
                        style: TextStyle(color: Colors.white)),
                  ),

                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAdministrationStaff(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                    role: widget.role!)));
                      },
                      title: Text('Create Administration Staff',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdministratorList(
                                      dealerId: widget.dealer_id,
                                      dealerName: widget.dealerName,
                                      role: widget.role,
                                    )));
                      },
                      title: Text('Administrators',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedOrders(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                    empId: widget.empId,
                                    role: widget.role,
                                  )));
                    },
                    title: Text('Completed Orders',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.role == "employee" ||
                                      widget.role == "admin"
                                  ? CompletedSteelOrders(
                                      dealerId: widget.dealer_id!,
                                      dealerName: widget.dealerName!,
                                      role: widget.role,
                                      empId: widget.empId,
                                    )
                                  : CompletedSteelOrders(
                                      dealerId: widget.dealer_id!,
                                      dealerName: widget.dealerName!,
                                      role: widget.role,
                                      empId: widget.empId,
                                    )));
                    },
                    title: Text('Completed Steel Orders',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClosedEnquiry(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                    empId: widget.empId,
                                    role: widget.role,
                                  )));
                    },
                    title: Text('Closed Enquiries',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DealerList(
                                      dealerId: widget.dealer_id!,
                                      dealerName: widget.dealerName!,
                                      role: widget.role,
                                    )));
                      },
                      title: Text('User/Dealer',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "admin" ? true : false,
                    child: ExpansionTile(
                      collapsedIconColor: Color(0xffFFFFFF),
                      title: Text('Archives',
                          style: TextStyle(color: Colors.white)),
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArchiveEnquiries(
                                          dealerId: widget.dealer_id,
                                          dealerName: widget.dealerName,
                                          role: widget.role,
                                        )));
                          },
                          title: Text('Enquiries',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArchiveDoorOrders(
                                          dealerId: widget.dealer_id,
                                          dealerName: widget.dealerName!,
                                          role: widget.role,
                                        )));
                          },
                          title: Text('Entrance Door Orders',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArchiveSteelOrders(
                                          dealer_id: widget.dealer_id!,
                                          dealer_name: widget.dealerName!,
                                          role: widget.role,
                                        )));
                          },
                          title: Text('Steel Orders',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArchiveQuotations(
                                          dealerId: widget.dealer_id!,
                                          dealerName: widget.dealerName!,
                                          role: widget.role,
                                        )));
                          },
                          title: Text('Entrance Door Quotations',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),

                  Visibility(
                    visible: widget.role == "dealer" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmployeeList(
                                      dealer_id: widget.dealer_id!,
                                      dealerName: widget.dealerName!,
                                      role: widget.role,
                                      empId: widget.empId,
                                    )));
                      },
                      title: Text('Employee List',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "dealer" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateEmployee(
                                    dealerId: widget.dealer_id!,
                                    dealerName: widget.dealerName!,
                                    role: widget.role!)));
                      },
                      title: const Text('Create Employee',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Visibility(
                    visible: widget.role == "employee" ? true : false,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetails(
                              empId: widget.empId!,
                              empName: widget.dealerName!,
                              role: widget.role,
                              dealerId: widget.dealer_id,
                            ),
                          ),
                        );
                      },
                      title: Text('Settings',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  // Visibility(
                  //   visible: widget.role == "employee" || widget.role == "admin"
                  //       ? false
                  //       : true,
                  //   child: ListTile(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => DealerLogo(
                  //                   dealerId: widget.dealer_id!,
                  //                   dealerName: widget.dealerName!,
                  //                   role: widget.role,
                  //                   empId: widget.empId)));
                  //     },
                  //     title: Text('Dealer Logo',
                  //         style: TextStyle(color: Colors.white)),
                  //   ),
                  // ),
                  ListTile(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isLogin', false);
                      prefs.clear();
                      Navigator.pushReplacement(context,
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
