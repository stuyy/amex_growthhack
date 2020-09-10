import 'dart:convert';

import 'package:amex_growthhack/api/api.dart';
import 'package:amex_growthhack/widgets/merchant_form.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MerchantScreen extends StatefulWidget {
  MerchantScreen({ Key key }): super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {

  bool isChecked = false;

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