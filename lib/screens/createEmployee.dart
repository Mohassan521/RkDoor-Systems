import 'package:flutter/material.dart';
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
                    const Text('Quotation Type',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
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
                    const Text('Minimum Markup',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: markup,
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
                    const Text('Max Discount',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
                      controller: discount,
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
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff941420))),
                          TextFormField(
                            controller: address1,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const Text('Customer Address 2',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff941420))),
                          TextFormField(
                            controller: address2,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          const Text('Customer Address 3',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff941420))),
                          TextFormField(
                            controller: address3,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: RoundButton(
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
