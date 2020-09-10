import 'package:amex_growthhack/widgets/models/Merchant.dart';
import 'package:flutter/material.dart';
import 'package:amex_growthhack/utilities/api.dart';

class CustomerScreen extends StatefulWidget {

  CustomerScreen({ Key key }) : super(key: key);
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {

  Future merchants;

  @override
  void initState() {
    super.initState();
    merchants = fetchMerchants();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot)  {
            if (snapshot.hasData) {
              Future.delayed(Duration(seconds: 2));
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Merchant merchant = snapshot.data[index];
                  return Column(
                    children: <Widget>[
                      // Widget to display the list of project
                      InkWell(
                        child: Card(
                          child: ListTile(
                            title: Text(merchant.name),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/merchant/profile', arguments: merchant);
                        },
                      )
                    ],
                  );
                },
              );
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
          future: merchants,
        )
      ),
    );
  }
}