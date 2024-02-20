import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/tables/adminTables/ankaTable.dart';

class AnkaItemsForAdmin extends StatefulWidget {
  final String? dealerId;
  final String? dealerName;
  final String? role;
  const AnkaItemsForAdmin(
      {super.key, this.dealerId, this.dealerName, this.role});

  @override
  State<AnkaItemsForAdmin> createState() => _AnkaItemsForAdminState();
}

class _AnkaItemsForAdminState extends State<AnkaItemsForAdmin> {
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
          'Door On Hold',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 18,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: TextFormField(
                onChanged: (value) {},
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
              child: AdminAnkaTable(
                dealerId: widget.dealerId!,
                dealerName: widget.dealerName!,
              )),
        ],
      ),
    );
  }
}
