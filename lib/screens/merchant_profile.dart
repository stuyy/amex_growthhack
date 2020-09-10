import 'package:amex_growthhack/widgets/models/Merchant.dart';
import 'package:flutter/material.dart';

class MerchantProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PageController controller = PageController();
    final Merchant merchant = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF031956),
        centerTitle: true,
        title: Text(merchant.name),
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage("assets/cafe.jpg"),
          ),
          Container(
            height: 100,
            child: ListTile(
              title: Text('Starbucks', style: TextStyle(color: Colors.white, fontSize: 18)),
              subtitle: Text('starbucks.com', style: TextStyle(color: Colors.white, fontSize: 18)),
              contentPadding: EdgeInsets.only(top: 12, left: 20),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/amex_bg_light.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.srcOver),
              )
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF031956),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.check),
                  ),
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.call),
                  ),
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.directions),
                  ),
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.restaurant_menu),
                  ),
                  margin: EdgeInsets.all(10),
                ),

              ],
            ),
          ),
          Container(
            height: 350,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xFF2671B9),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    title: Text('Our Community', style: TextStyle(color: Colors.white, fontSize: 22)),
                    subtitle: Text(
                      merchant.descriptions['community'],
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xFF2671B9),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    title: Text('Our Origin', style: TextStyle(color: Colors.white, fontSize: 22)),
                    subtitle: Text(
                      merchant.descriptions['origin'],
                      style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xFF2671B9),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    title: Text('Our Future', style: TextStyle(color: Colors.white, fontSize: 22)),
                    subtitle: Text(
                      merchant.descriptions['future'],
                      style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}