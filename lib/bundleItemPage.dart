import 'package:flutter/material.dart';
import 'package:polar_ice_app/product.dart';
//import 'package:polarice/main.dart';

class BundleItemPage extends StatefulWidget {
  final String name, imagePath, description;

  BundleItemPage(
      {Key key,
      @required this.imagePath,
      @required this.name,
      @required this.description})
      : super(key: key);

  @override
  BundleItemPageState createState() => BundleItemPageState();
}

class BundleItemPageState extends State<BundleItemPage> {
  List<String> sizes = ['Choose Your Sizes', 'Small', 'Medium', 'Large'];
  List<String> accom = [
    'Choose an Option',
    'None',
    'Lactose',
    'Fat-Free',
    'Sugar-Free'
  ];

  String dropdownValueSize;
  String dropdownValueAccom;

  Color defaultWidgetColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    dropdownValueSize = sizes[0];
    dropdownValueAccom = accom[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.38,
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.33,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.8,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff302f2e),
                          blurRadius: 15.0,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Includes:',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ListTile(
                        leading: Text(
                          'Size: ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: DropdownButton<String>(
                          value: dropdownValueSize,
                          icon: Icon(
                            Icons.arrow_downward,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                            height: 2.0,
                          ),
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValueSize = newValue;
                            });

                            print(dropdownValueSize);
                          },
                          items: sizes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: SizedBox(
                                width: 100.0,
                                child: Text(value, textAlign: TextAlign.right),
                              ),
                              value: value,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      widget.name != seasonSpecial.name
                          ? ListTile(
                              leading: Text(
                                'Accommodations: ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: DropdownButton<String>(
                                value: dropdownValueAccom,
                                icon: Icon(
                                  Icons.arrow_downward,
                                ),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2.0,
                                ),
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValueAccom = newValue;
                                  });

                                  print(accom.indexOf(dropdownValueAccom) - 1);
                                },
                                items: accom.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    child: SizedBox(
                                      width: 135.0,
                                      child: Text(value,
                                          textAlign: TextAlign.right),
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                              ),
                            )
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('Place Order'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
