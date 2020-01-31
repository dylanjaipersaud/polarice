import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  double lat = 40.569782, long = -74.107430;

  @override
  Widget build(BuildContext context) {
    final LatLng _center = LatLng(lat, long);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xff23272A),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Text(
                'We Are',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'UltraCondensedSansSerif',
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Polar Ice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'UltraCondensedSansSerif',
                  fontSize: 100.0,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:17),
                child: Center(
                    child: Image.asset(
                  'assets/images/Polar Ice team.png',
                  fit: BoxFit.fitWidth,
                )),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '\"At Polar Ice we work our hardest so our Ice Cream is the best your money can buy. ' +
                      'We have the perfect ice cream for you no matter what you are looking for. We provide fast frere, ' +
                      'lactose free, and gluten free ice cream for the best price. Each of our units have been created ' +
                      'by Andi Tareneshi who sent out many surveys to find the best flavours anyone could want. But ' +
                      'that is not how it ended our amazing marketing team turned Andi\'s idea to reality creating ' +
                      'all his flavours exactly the way he wanted it. Here at Polar Ice we care about all our customer ' +
                      'so we provide the best tasting and healthiest form of ice cream on the market.\"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xffCCCCCCC),
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '\"At PolarIce westrive to deliver the best possible ice cream to our customers. We work hard everyday perfecting ' +
                      'our formulas in order to create the healthy, smooth and delicious treats that fill you with joy ' +
                      'instead of fat. Each of our departments is specifically tailored to fulfill the needs of each ' +
                      'and every unit of ice cream that we sell, from our cutting edge research and development ' +
                      'department led by our intuitive manager Andi tareneshi, to the artistic creativity of our ' +
                      'marketing department who designs and creates our view of spectacular treats, our company is ' +
                      'always ready to give it all for the sake of the customer enjoying the astonishing delicacy that ' +
                      'is PolarIce ice cream.\"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xffCCCCCCC),
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 300.0,
                child: getMap(_center),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '456 New Dorp Lane\nStaten Island, New York',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 25.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Center(
                          child: Text(
                            'Open in Google Maps',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print('hello');
                        launchMap();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: Text(
                  'Contact Us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  '(718) 667-8686',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                title: Text(
                  'Polariceve2020@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 2.5),
                child: Center(
                  child: Text(
                    'Office hours from 8:00 A.M to 9:36 A.M.',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffCCCCCCC),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 30.0),
                child: Center(
                  child: Text(
                    'Monday through Friday',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchMap() async {
    var mapSchema =
        'https://www.google.com/maps/place/New+Dorp+High+School/@40.5695781,-74.1095654,17z/data=!3m1!4b1!4m5!3m4!1s0x89c2494bf5d8ae9b:0xf233c5e32f29467e!8m2!3d40.5695781!4d-74.1073767';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  getMap(LatLng coords) {
    if (kIsWeb) {
      return Center(
          child: Text('Map on Web Coming Soon...',
              style: TextStyle(color: Colors.white)));
    } else {
      return GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: coords,
          zoom: 15.0,
        ),
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
        markers: Set<Marker>.of([
          Marker(
            markerId: MarkerId('New Dorp High School'),
            position: coords,
          ),
        ]),
      );
    }
  }
}
