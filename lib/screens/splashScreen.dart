import 'dart:async';

import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/screens/dashboard.dart';
import 'package:price_link/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;
    String userId = sp.getString('user_id') ?? '';
    String username = sp.getString('username') ?? "";

    if (isLogin == true) {
      // var userData =
      //     Provider.of<UserLoginData>(context, listen: false).dataModel;
      Timer(const Duration(seconds: 5), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardPage(
                      dealer_id: userId,
                      dealer_name: username,
                    )));
      });
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Image(image: AssetImage('assets/images/logo.jpeg')),
            ),
          ),
        ],
      ),
    );
  }
}
