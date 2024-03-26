import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/screens/register.dart';
import 'package:price_link/services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  NetworkApiServices apiServices = NetworkApiServices();
  String email = "";
  String password = "";
  bool visibility = false;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // backgroundColor: Colors.green,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.3,
                image: const AssetImage('assets/images/logo.jpeg')),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 14.5),
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
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 14.5),
                obscureText: visibility == false ? true : false,
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      child: Icon(
                        visibility == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
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
              height: 30,
            ),
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: RoundButton(
                      text: isLoading ? '' : 'Login',
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await apiServices.loginApi(
                          context,
                          emailController.text,
                          passwordController.text,
                        );
                        setState(() {
                          isLoading = false;
                        });
                      },
                      color: Color(0xff941420),
                      width: double.infinity,
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              width: MediaQuery.sizeOf(context).width * 0.1,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : SizedBox(), // This SizedBox is necessary to maintain the layout
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account? ',
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'Register? ',
                    textAlign: TextAlign.center,
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
    );
  }
}
