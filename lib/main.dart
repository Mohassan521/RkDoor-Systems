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
          create: (_) => SelectedValueProvider(),
        ),
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
        ChangeNotifierProvider(create: (_) => UserLoginData()),
        ChangeNotifierProvider(create: (_) => DealerData()),
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
