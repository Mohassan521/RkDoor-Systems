import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';
import 'package:price_link/components/round_button.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({super.key});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
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
                    TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text('Minimum Markup',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff941420))),
                    TextFormField(
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: RoundButton(
                      text: 'Register',
                      onTap: () {},
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
