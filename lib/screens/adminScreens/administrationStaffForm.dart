import 'package:flutter/material.dart';
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
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(color: Color(0xffefefef)),
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
                    const Text(
                      'First Name',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420)),
                    ),
                    TextFormField(
                      controller: fname,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Last Name',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: lname,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Post Code',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: postCode,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Tel',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: telephone,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Email',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Password',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Confirm Password',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: cpassword,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: RoundButton(
                      text: 'Register',
                      onTap: () {
                        if (password.text == cpassword.text) {
                          NetworkApiServices().createAdministrator(fname.text, lname.text, postCode.text, telephone.text, email.text, password.text);
                        }
                      },
                      color: Color(0xff941420),
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
      ),
    );
  }
}
