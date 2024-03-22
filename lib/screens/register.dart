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
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
        ),
        centerTitle: true,
        
      ),
      // backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: fNameController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'First Name'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: lNameController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Last Name'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressOneController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 1'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressTwoController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 2'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressThreeController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 3'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: postCodeController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Post Code'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: telephoneController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Telephone'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Email'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: passwordController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Password'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Confirm Password'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: RoundButton(
                text: 'Register',
                onTap: () async {},
                color: Color(0xff941420),
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
