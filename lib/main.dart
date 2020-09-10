import 'package:amex_growthhack/screens/customer.dart';
import 'package:amex_growthhack/screens/customer_onboarding.dart';
import 'package:amex_growthhack/screens/merchant.dart';
import 'package:amex_growthhack/screens/merchant_google_maps.dart';
import 'package:amex_growthhack/screens/merchant_profile.dart';
import 'package:amex_growthhack/widgets/main_menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
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
        '/merchant/profile/maps': (context) => MerchantGoogleMapsScreen(),
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

    final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final notification = message['notification'];
        print("onMessage: $message");
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: ListTile(
              title: Text(notification['title']),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/customer');
                },
                child: Text('View'),
              )
            ],
          );
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        final notification = message['notification'];
        print("onLaunch: $message");
        print(notification);
      },
      onResume: (Map<String, dynamic> message) async {
        final data = message['data'];
        final view = data['view'];
        print(view);
        Navigator.pushNamed(context, '/customer');
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    return Scaffold(
      body: MainMenu(),
    );
  }
}
