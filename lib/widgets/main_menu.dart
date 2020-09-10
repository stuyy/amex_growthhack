import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/amex_logo.png"),
              )
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/shop_small.png"),
              ),
              color: const Color(0xFF031956),
            ),
          ),
          Container(
              width: 900,
              padding: EdgeInsets.only(top: 40, bottom: 80),
              color: const Color(0xFF031956),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
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
                    width: 300,
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
                    width: 300,
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
        ],
      ),
    );
  }
}