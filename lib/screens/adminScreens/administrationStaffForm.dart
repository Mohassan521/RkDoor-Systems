import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/services/services.dart';

class CreateAdministrationStaff extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String role;
  const CreateAdministrationStaff(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      required this.role});

  @override
  State<CreateAdministrationStaff> createState() =>
      _CreateAdministrationStaffState();
}

class _CreateAdministrationStaffState extends State<CreateAdministrationStaff> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController markup = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  String type = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        dealer_id: widget.dealerId,
        dealerName: widget.dealerName,
        role: widget.role,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff941420),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Create Administration Staff',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  const Text('First Name',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'first_name',
                    controller: fname,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Last Name',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'last_name',
                    controller: lname,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Post Code',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'post_code',
                    controller: postCode,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Telephone',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'tel',
                    controller: telephone,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Email',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    controller: email,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Password',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    controller: password,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Confirm Password',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'confirm',
                    controller: cpassword,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      labelStyle:
                          TextStyle(color: Color(0xff941420), fontSize: 13),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: MaterialButton(
                    color: Color(0xff941420),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                    minWidth: double.infinity,
                    onPressed: () {
                      if (password.text == cpassword.text) {
                        NetworkApiServices().createAdministrator(
                            fname.text,
                            lname.text,
                            postCode.text,
                            telephone.text,
                            email.text,
                            password.text);
                      }
                    },
                    child: Text("Register"),
                  )),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
