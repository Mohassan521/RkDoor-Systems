import 'package:flutter/material.dart';
import 'package:price_link/components/round_button.dart';
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
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'First Name'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Last Name'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 1'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 2'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Dealer Address 3'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Post Code'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Telephone'),
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
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
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
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: passwordController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
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
              height: 9.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    fillColor: Color.fromARGB(255, 246, 245, 245),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
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
