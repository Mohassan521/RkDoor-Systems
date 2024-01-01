import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/models/EmployeeList.dart';
import 'package:price_link/models/dealersModel.dart';
import 'package:price_link/services/services.dart';

class EditDealerPage extends StatefulWidget {
  final DealersModel dealers;
  const EditDealerPage({super.key, required this.dealers});

  @override
  State<EditDealerPage> createState() => _EditDealerPageState();
}

class _EditDealerPageState extends State<EditDealerPage> {
  NetworkApiServices apiServices = NetworkApiServices();

  final TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController dealerNameController = TextEditingController();

  TextEditingController dealerAddressOneController = TextEditingController();

  TextEditingController dealerAddressTwoController = TextEditingController();

  TextEditingController dealerAddressThreeController = TextEditingController();

  TextEditingController postCodeController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firstNameController.text = widget.dealers.firstName!;
    lastNameController.text = widget.dealers.lastName!;
    dealerNameController.text = widget.dealers.dealerName ?? "";
    dealerAddressOneController.text = widget.dealers.dealerAddress1 ?? "";
    dealerAddressTwoController.text = widget.dealers.dealerAddress2 ?? "";
    dealerAddressThreeController.text = widget.dealers.dealerAddress3 ?? "";
    postCodeController.text = widget.dealers.postCodeRegister!;
    telephoneController.text = widget.dealers.telephone ?? "";
    emailController.text = widget.dealers.userEmail!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff941420),
          title: Text(
            'Hello : ${widget.dealers.firstName}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("First Name"),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: firstNameController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Last Name'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: lastNameController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Dealer'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: dealerNameController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Dealer Address 1'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: dealerAddressOneController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Dealer Address 2'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: dealerAddressTwoController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Dealer Address 3'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: dealerAddressThreeController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Post Code'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: postCodeController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Telephone'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: telephoneController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      Text('Email'),
                      TextFormField(
                          textAlign: TextAlign.center,
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: OutlineInputBorder())),
                      SizedBox(
                        height: 15,
                      ),
                      RoundButton(
                        onTap: () {
                          apiServices.editDealers(
                              widget.dealers.iD.toString(),
                              emailController.text,
                              firstNameController.text,
                              lastNameController.text,
                              dealerNameController.text,
                              dealerAddressOneController.text,
                              dealerAddressTwoController.text,
                              dealerAddressThreeController.text,
                              postCodeController.text,
                              telephoneController.text);
                        },
                        text: 'Update',
                        color: Color(0xff941420),
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
