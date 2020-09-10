import 'package:amex_growthhack/widgets/models/Merchant.dart';
import 'package:flutter/material.dart';

class MerchantProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Merchant merchant = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Text(merchant.name),
      ),
    );
  }
}