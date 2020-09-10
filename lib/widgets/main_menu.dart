import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.60),
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
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
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
                  height: 280,
                  width: constraints.maxWidth * 1,
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.9,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            'Onboarding',
                            style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: -0.5,
                                )
                            ),
                          ),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/onboarding')
                          },
                          color: const Color(0xFF2671B9),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * 0.9,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
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
                              borderRadius: BorderRadius.circular(25)
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
    );
  }
}