import 'package:flutter/material.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({ Key key }): super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Customer'),
    );
  }
}