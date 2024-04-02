import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/services/services.dart';

class CreateEmployee extends StatefulWidget {
  final String dealerId;
  final String dealerName;
  final String role;
  const CreateEmployee(
      {super.key,
      required this.dealerId,
      required this.dealerName,
      required this.role});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
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

  bool isChecked = false;
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
          'Create Employee',
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'First Name'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Last Name'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Quotation Type',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: type,
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        type = newValue ?? type;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                          value: '', child: Center(child: Text(''))),
                      DropdownMenuItem<String>(
                          value: 'R', child: Center(child: Text('R'))),
                      DropdownMenuItem<String>(
                          value: 'T', child: Center(child: Text('T'))),
                      DropdownMenuItem<String>(
                          value: 'R&T', child: Center(child: Text('R&T'))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormBuilderTextField(
                    name: 'mark_up',
                    controller: markup,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        labelStyle:
                            TextStyle(color: Color(0xff941420), fontSize: 13),
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Mark Up'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Post Code'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Telephone'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormBuilderTextField(
                    name: 'discount',
                    controller: discount,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        labelStyle:
                            TextStyle(color: Color(0xff941420), fontSize: 13),
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Max Discount'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 15,
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
                        fillColor: Color.fromARGB(255, 246, 245, 245),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Confirm Password'),
                  ),
                  SizedBox(
                    height: 15,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (isChecked == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderTextField(
                          name: 'address1',
                          controller: address1,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(
                                  color: Color(0xff941420), fontSize: 13),
                              fillColor: Color.fromARGB(255, 246, 245, 245),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Customer Address 1'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FormBuilderTextField(
                          name: 'address2',
                          controller: address2,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(
                                  color: Color(0xff941420), fontSize: 13),
                              fillColor: Color.fromARGB(255, 246, 245, 245),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Customer Address 2'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FormBuilderTextField(
                          name: 'address3',
                          controller: address3,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              labelStyle: TextStyle(
                                  color: Color(0xff941420), fontSize: 13),
                              fillColor: Color.fromARGB(255, 246, 245, 245),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Customer Address 3'),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                    width: double.infinity,
                    text: 'Register',
                    onTap: () {
                      if (password.text == cpassword.text) {
                        NetworkApiServices().createEmployees(
                            widget.dealerId,
                            fname.text,
                            lname.text,
                            markup.text,
                            discount.text,
                            postCode.text,
                            telephone.text,
                            email.text,
                            password.text,
                            type,
                            address1.text,
                            address2.text,
                            address3.text);
                      }
                    },
                    color: Color(0xff941420),
                  ),
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
