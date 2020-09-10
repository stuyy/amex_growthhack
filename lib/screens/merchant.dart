import 'package:amex_growthhack/widgets/forms/merchant_form.dart';
import 'package:flutter/material.dart';

class MerchantScreen extends StatefulWidget {
  MerchantScreen({ Key key }): super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF031956),
        title: Text('Merchants'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/amex_bg.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: MerchantForm()
      ),
    );
  }
}