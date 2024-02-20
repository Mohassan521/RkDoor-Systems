import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/components/round_button.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/screens/register.dart';
import 'package:price_link/services/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // backgroundColor: Colors.green,
      body: Center(
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
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Color(0xff941420)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 15, color: Color(0xff941420)),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email'),
                ),
                SizedBox(
                  height: 15,
                ),
                const Text('Password',
                    style: TextStyle(fontSize: 15, color: Color(0xff941420))),
                TextFormField(
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
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      RoundButton(
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
                      ),
                      Positioned.fill(
                        child: Center(
                          child: isLoading
                              ? SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
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
        ),
      ),
    );
  }
}
