import 'package:flutter/material.dart';
import 'package:price_link/screens/register.dart';
import 'package:price_link/services/services.dart';
import 'package:price_link/utils/utils.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.sizeOf(context).height * 0.30,
                image: const AssetImage('assets/images/logo.jpeg')),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25),
            child: TextFormField(
              style: TextStyle(fontSize: 14.5),
              controller: emailController,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 246, 245, 245),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.5),
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Stack(
                children: [
                  MaterialButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        await apiServices.loginApi(
                          context,
                          emailController.text,
                          passwordController.text,
                        );
                      } else {
                        Utils().showToast('None field can be null',
                            Color(0xff941420), Colors.white);
                      }

                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Text(isLoading ? '' : 'Login'),
                    color: Color(0xffEB1420),
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.5)),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.04,
                              width: MediaQuery.sizeOf(context).width * 0.08,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : SizedBox(),
                    ),
                  ),
                ],
              ),
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
                style: TextStyle(fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Register? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff941420), fontSize: 17),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
