import 'package:amex_growthhack/screens/customer.dart';
import 'package:amex_growthhack/screens/merchant.dart';
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
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Project'),
      routes: {
        '/customer': (context) => CustomerScreen(),
        '/merchant': (context) => MerchantScreen(),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _screens = <Widget>[
    CustomerScreen(),
    MerchantScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            child: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.55),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/amex_logo.png"),
                        )
                    ),
                  ),
                )
            ),
          ),
          Align(
            child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.15),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/shop_small.png"),
                    )
                  ),
                ),
              )
            ),
          ),
          Align(
            alignment: Alignment(0, 4.8),
            child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.35),
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: const Color(0xFF031956),
                  height: 270,
                  width: constraints.maxWidth * 1,
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.9,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Login as Customer',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: -0.5,
                              )
                            ),
                          ),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/customer')
                          },
                          color: const Color(0xFF2671B9),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * 0.9,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            'Login as Merchant',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: -0.5,
                              )
                            ),
                          ),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/merchant')
                          },
                          color: const Color(0xFF2671B9),
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
