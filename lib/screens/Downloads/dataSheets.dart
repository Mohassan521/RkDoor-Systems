import 'package:flutter/material.dart';
import 'package:price_link/components/drawer.dart';

class DataSheets extends StatefulWidget {
  const DataSheets({super.key});

  @override
  State<DataSheets> createState() => _DataSheetsState();
}

class _DataSheetsState extends State<DataSheets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Data Sheets',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(color: Color(0xfff3f4f4)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Text(
                        'Profile Data Sheets',
                        style: TextStyle(
                            color: Color(0xff941420),
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  '1. ',
                                  style: TextStyle(
                                      color: Color(0xff941420),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text('Eco Profile',
                                    style: TextStyle(
                                        color: Color(0xff941420),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(color: Color(0xfff3f4f4)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Text(
                          'Product Data Sheets',
                          style: TextStyle(
                              color: Color(0xff941420),
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Text(
                                    '1. ',
                                    style: TextStyle(
                                        color: Color(0xff941420),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('ES2040 Smart Access Switch',
                                      style: TextStyle(
                                          color: Color(0xff941420),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.copy,
                                      color: Colors.blue,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
