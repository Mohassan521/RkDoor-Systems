import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/screens/login.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dealerController = TextEditingController();
  final TextEditingController dealerAddressOneController =
      TextEditingController();
  final TextEditingController dealerAddressTwoController =
      TextEditingController();
  final TextEditingController dealerAddressThreeController =
      TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  NetworkApiServices apiServices = NetworkApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xffefefef)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 25, color: Color(0xff941420)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'First Name',
                    style: TextStyle(fontSize: 15, color: Color(0xff941420)),
                  ),
                  TextFormField(
                    controller: fNameController,
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
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: lNameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Dealer',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: dealerController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Dealer Address (Line 1)',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: dealerAddressOneController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Dealer Address (Line 2)',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: dealerAddressTwoController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Dealer Address (Line 3)',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: dealerAddressThreeController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Post Code',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: postCodeController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Tel',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: telephoneController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Email',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Password',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text('Confirm Password',
                      style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: RoundButton(
                    text: 'Register',
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();

                      String enteredEmail = emailController.text.trim();
                      sp.setString('fname', fNameController.text.toString());
                      sp.setString('lname', lNameController.text.toString());
                      sp.setString('email', enteredEmail);
                      sp.setString('password', passwordController.text);

                      Utils().showToast(
                          'User registered', Colors.green, Colors.white);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    color: Color(0xff941420),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login ',
                          style: TextStyle(color: Color(0xff941420)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
