import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/models/dealersModel.dart';
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

  // late DealersModel dealers;

  // getPostCode() async {
  //   dealers =
  //       await NetworkApiServices().getDealersList(context, widget.dealerId) ;
  // }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // postCode.text = model.postCodeRegister ?? "";
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Quotation Type',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xff941420))),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          isExpanded: false,
                          value: type,
                          underline: SizedBox(),
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
                                value: 'R&T',
                                child: Center(child: Text('R&T'))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Mark Up',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'mark_up',
                    controller: markup,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  const Text('Max Discount',
                      style: TextStyle(color: Color(0xff941420))),
                  SizedBox(
                    height: 5,
                  ),
                  FormBuilderTextField(
                    name: 'discount',
                    controller: discount,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        const Text('Customer Address 1',
                            style: TextStyle(color: Color(0xff941420))),
                        SizedBox(
                          height: 5,
                        ),
                        FormBuilderTextField(
                          name: 'address1',
                          controller: address1,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                        const Text('Customer Address 2',
                            style: TextStyle(color: Color(0xff941420))),
                        SizedBox(
                          height: 5,
                        ),
                        FormBuilderTextField(
                          name: 'address2',
                          controller: address2,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                        const Text('Customer Address 3',
                            style: TextStyle(color: Color(0xff941420))),
                        SizedBox(
                          height: 5,
                        ),
                        FormBuilderTextField(
                          name: 'address3',
                          controller: address3,
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    child: Text('Register'),
                    onPressed: () {
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
                    textColor: Colors.white,
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
