import 'package:flutter/material.dart';

class MerchantScreen extends StatefulWidget {
  MerchantScreen({ Key key }): super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {

  bool isChecked = false;
  Map<String, bool> social_causes = {
    "Black-Owned": false,
    "Woman-Owned": false,
    "Veteran-Owned": false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/amex_bg.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 8, right: 10, left: 10),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("What passions and hopes inspired you to become a small business owner?"),
                      subtitle: Text("500 Character Limit"),
                    ),
                    TextField(
                      maxLength: 500,
                      maxLines: 10,
                      minLines: 1,
                      onSubmitted: (String value) => {
                        print(value)
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Card(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 8, right: 10, left: 10),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("How do you see your business contributing to the needs of your community in 2020 and beyond?"),
                        subtitle: Text("500 Character Limit"),
                      ),
                      TextField(
                        maxLength: 500,
                        maxLines: 10,
                        minLines: 1,
                        onSubmitted: (String value) => {
                          print(value)
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Card(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 8, right: 10, left: 10),
                child: Column(
                children: [
                    ListTile(
                      title: Text("What lessons have you learned in 2020 that you believe will contribute to the flourishing of your business in the future?"),
                      subtitle: Text("500 Character Limit"),
                    ),
                    TextField(
                      maxLength: 500,
                      maxLines: 10,
                      minLines: 1,
                      onSubmitted: (String value) => {
                        print(value)
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Card(
              child: ListView(
                shrinkWrap: true,
                children: social_causes.keys.map((t) => CheckboxListTile(
                  title: Text(t),
                  value: social_causes[t],
                  onChanged: (bool val) => {
                    setState(() => {
                      social_causes[t] = val
                    })
                  }
                )).toList()
              ),
            ),
          ],
        )
      ),
    );
  }
}