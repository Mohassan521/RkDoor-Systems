import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/administratorsTable.dart';
import 'package:price_link/screens/adminScreens/administrationStaffForm.dart';
import 'package:provider/provider.dart';

class AdministratorList extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AdministratorList(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AdministratorList> createState() => _AdministratorListState();
}

class _AdministratorListState extends State<AdministratorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Administrators',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateAdministrationStaff(
                      dealerId: widget.dealerId!,
                      dealerName: widget.dealerName!,
                      role: widget.role!)));
        },
        label: Text(
          'Add New Admin',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff941420),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 18,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: TextFormField(
                onChanged: (value) {
                  Provider.of<AllAdministratorsSearchedData>(context,
                          listen: false)
                      .getAllData(widget.dealerId!, value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Search here',
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: AdministratorsTable(
                dealerId: widget.dealerId!,
                dealerName: widget.dealerName!,
                role: widget.role,
              )),
        ],
      ),
    );
  }
}
