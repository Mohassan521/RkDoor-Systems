import 'package:flutter/material.dart';
import 'package:price_link/screens/login.dart';
import 'package:price_link/services/services.dart';

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
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize:
      //       Size.fromHeight(MediaQuery.sizeOf(context).height * 0.16),
      //   child: Stack(
      //     children: [
      //       AppBar(
      //         automaticallyImplyLeading: false,
      //         iconTheme: IconThemeData(color: Colors.white),
      //         title: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             // Your AppBar content here
      //           ],
      //         ),
      //         //rgb(37, 150, 190)
      //         backgroundColor: Color(0xff941420), // Starting color
      //         flexibleSpace: Container(
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               begin: Alignment.topLeft,
      //               end: Alignment.topRight,
      //               colors: [
      //                 Color(0xffEB1420),
      //                 Color(0xff941420),
      //               ], // Gradient between the two colors
      //             ),
      //           ),
      //         ),
      //       ),
      //       Positioned(
      //         top: MediaQuery.of(context).padding.top,
      //         left: 0,
      //         right: 0,
      //         child: Transform.translate(
      //           offset: Offset(0, MediaQuery.of(context).size.height * 0.075),
      //           child: Center(
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(100),
      //               child: Image(
      //                 height: MediaQuery.sizeOf(context).height * 0.12,
      //                 image: AssetImage("assets/images/no-profile.png"),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Image(
                    image: AssetImage("assets/images/reg-background.jpeg"))),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "CREATE ACCOUNT",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: fNameController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'FIRST NAME'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: lNameController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'LAST NAME'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'DEALER'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressOneController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'DEALER ADDRESS 1'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressTwoController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'DEALER ADDRESS 2'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: dealerAddressThreeController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'DEALER ADDRESS 3'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: postCodeController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'POST CODE'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: telephoneController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'TELEPHONE'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: emailController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'EMAIL'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: passwordController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'PASSWORD'),
              ),
            ),
            SizedBox(
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'CONFIRM PASSWORD'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () async {},
              color: Color(0xff941420),
              textColor: Colors.white,
              minWidth: MediaQuery.sizeOf(context).width * 0.3,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff941420)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
