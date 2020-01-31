import 'package:flutter/material.dart';
import 'package:polar_ice_app/aboutUs.dart';
import 'package:polar_ice_app/boxItemPage.dart';
import 'package:polar_ice_app/bundleItemPage.dart';
import 'package:polar_ice_app/product.dart';
import 'package:polar_ice_app/productShowcase.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2bbfff),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/iceberg.jpg",
          fit: BoxFit.cover,),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Image.asset(
                    'assets/images/PolariceLogo.png',
                    height: 120.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Text(
                    'WELCOME',
                    style:
                        TextStyle(fontSize: 50.0, fontFamily: 'ArchivoBlack', color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    'to a new world of flavour',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'OpenSans',
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0, left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Shop',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cookies.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          seasonSpecial.name,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BundleItemPage(
                              name: seasonSpecial.name,
                              imagePath: seasonSpecial.imagePath,
                              description: seasonSpecial.descrip,
                            )),
                  ),
                ),
                selectionContainer(context, 'Bundles',
                    'assets/images/Sprinkles.png', Bundles.toList()),
                selectionContainer(context, 'Boxes',
                    'assets/images/scoops.jpg', Boxes.toList()),
                GestureDetector(
                  child: Container(
                    height: 35.0,
                    width: 170.0,
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.info,
                            color: Color(0xff2bbfff),
                          ),
                          Text(
                            '  Learn More',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff2bbfff),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs())),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectionContainer(
      BuildContext context, String text, String imagePath, List<Product> list) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, width: 2.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Center(
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductShowcase(
                    title: text,
                    list: list,
                  ))),
    );
  }
}
