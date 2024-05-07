import 'package:flutter/material.dart';
import 'package:price_link/Provider/provider.dart';
import 'package:price_link/models/loginDataModel.dart';
import 'package:price_link/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HandlingStates(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaginationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (_) => setFollowUpValue()),
        ChangeNotifierProvider(create: (_) => FollowUpDate()),
        ChangeNotifierProvider(create: (_) => setFollowUpOrderValue()),
        ChangeNotifierProvider(create: (_) => FollowUpOrderDate()),
        ChangeNotifierProvider(create: (_) => setEmployeeStatus()),
        ChangeNotifierProvider(create: (_) => DealerData()),
        ChangeNotifierProvider(create: (_) => AllSteelOrdersData()),
        ChangeNotifierProvider(
            create: (_) => AllEntranceDoorOrderSearchedData()),
        ChangeNotifierProvider(create: (_) => QuotationsSearchedData()),
        ChangeNotifierProvider(create: (_) => CompletedOrdersSearchData()),
        ChangeNotifierProvider(create: (_) => ClosedEnquiriesSearchedData()),
        ChangeNotifierProvider(create: (_) => EmployeeListSearchedData()),
        ChangeNotifierProvider(create: (_) => AllEnquiriesSearchedData()),
        ChangeNotifierProvider(create: (_) => QuotationsSearchedDataForAdmin()),
        ChangeNotifierProvider(create: (_) => AllDoorOrdersForAdmin()),
        ChangeNotifierProvider(
            create: (_) => AllEnquiriesSearchedDataForAdmin()),
        ChangeNotifierProvider(create: (_) => AllAdministratorsSearchedData()),
        ChangeNotifierProvider(create: (_) => CompleteSteelOrderSearchData()),
        ChangeNotifierProvider(create: (_) => allDealersList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        //home: const MarketingMaterial(),
      ),
    );
  }
}
