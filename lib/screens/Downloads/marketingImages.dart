import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:price_link/components/drawer.dart';

class MarketingImages extends StatefulWidget {
  const MarketingImages({super.key});

  @override
  State<MarketingImages> createState() => _MarketingImagesState();
}

class _MarketingImagesState extends State<MarketingImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: Color(0xff941420),
        title: const Text(
          'Marketing Images',
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
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(color: Color(0xfff3f4f4)),
                  child: Column(
                    children: [
                      Text(
                        'Images',
                        style: TextStyle(
                            color: Color(0xff941420),
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Slidable(
                        endActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          SlidableAction(
                            onPressed: (value) {},
                            icon: Icons.download_for_offline,
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                          ),
                        ]),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
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
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text(
                                        'Ceramic Finish Doors the best of the best',
                                        style: TextStyle(
                                            color: Color(0xff941420),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        softWrap: true,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Slidable(
                        endActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          SlidableAction(
                            onPressed: (value) {},
                            icon: Icons.copy,
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                          ),
                          SlidableAction(
                            onPressed: (value) {},
                            icon: Icons.delete,
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.transparent,
                          )
                        ]),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
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
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Text(
                                        'Ceramic Finish Doors',
                                        style: TextStyle(
                                            color: Color(0xff941420),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        softWrap: true,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
