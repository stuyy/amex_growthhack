import 'package:amex_growthhack/screens/customer.dart';
import 'package:amex_growthhack/screens/customer_onboarding.dart';
import 'package:amex_growthhack/screens/merchant.dart';
import 'package:amex_growthhack/screens/merchant_profile.dart';
import 'package:amex_growthhack/widgets/main_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Project'),
      routes: {
        '/onboarding': (context) => CustomerOnboardingScreen(),
        '/customer': (context) => CustomerScreen(),
        '/merchant': (context) => MerchantScreen(),
        '/merchant/profile': (context) => MerchantProfileScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenu()
    );
  }
}
