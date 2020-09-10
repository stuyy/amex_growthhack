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
      body: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/amex_bg.jpg"),
              fit: BoxFit.fitHeight,
            )
          ),
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
                        InkWell(
                          child: Card(
                            color: const Color(0xFF323031),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      merchant.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Image(
                                    image: AssetImage("assets/cafe.jpg"),
                                  ),
                                )
                              ],
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
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            future: merchants,
          ),
        ),
    );
  }
}