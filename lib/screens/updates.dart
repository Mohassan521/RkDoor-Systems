import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Updates',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          )),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue),
                        child: Text(
                          '27.09.23 - Powder coat finish thumbturn now available for Ultion cylinders.',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.vertical,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 5.0, vertical: 5),
                  //     child: Container(
                  //         width: MediaQuery.of(context).size.width * 0.9,
                  //         height: MediaQuery.of(context).size.height,
                  //         decoration: const BoxDecoration(color: Colors.blue),
                  //         child: Text(
                  //             '13.10.23 - New ES1202 switch added to enable day release type function for doors with motorised locks. Switch is located on the hinged side of the door sash and when depressed retracts the locking points and holds in to allow the door to be push and pull open. When the switched is pushed again, the locks are released and return to their normal function. This is available for the ES1200, ES1760 & ES1950 lock types and the code for a quotation can be found in the Electronic Opener (Day Release) drop down list in the Accessories stage. The code is also in the General Items drop down list.    ',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w500))),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 5.0, vertical: 5),
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.vertical,
                  //     child: Container(
                  //         width: MediaQuery.of(context).size.width * 0.9,
                  //         height: MediaQuery.of(context).size.height * 0.12,
                  //         decoration: const BoxDecoration(color: Colors.blue),
                  //         child: Text(
                  //             'Test Updates for testing Red Badge & Alert When user already login ',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w500))),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
