import 'package:flutter/material.dart';
import 'package:polar_ice_app/product.dart';
//import 'package:polarice/main.dart';

class BoxItemPage extends StatefulWidget {
  final String name, imagePath, description;
  final Box inside;

  BoxItemPage(
      {Key key,
      @required this.imagePath,
      @required this.name,
      @required this.description,
      @required this.inside})
      : super(key: key);

  @override
  BoxItemPageState createState() => BoxItemPageState();
}

class BoxItemPageState extends State<BoxItemPage> {
  List<String> options = ['Choose Your Sizes'];

  String dropdownValueOption;

  Color defaultWidgetColor = Colors.grey;

  String displayedImage;

  String getImageFromStringSearchList(List<Product> items, String title){
    if(title == options[0])
      return displayedImage;


    for (int i = 0; i < items.length; i++) {
      if (items[i].name == title)
        return items[i].imagePath;
    }
  }

  @override
  void initState() {
    super.initState();
    dropdownValueOption = options[0];
    displayedImage = widget.imagePath;

    for (Product item in widget.inside.inside) {
      options.add(item.name);
    }
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
                  displayedImage,
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
                            'Options:',
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
                          'Flavor: ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: DropdownButton<String>(
                          value: dropdownValueOption,
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
                              dropdownValueOption = newValue;
                              displayedImage = getImageFromStringSearchList(widget.inside.inside, newValue);
                            });

                            print(dropdownValueOption);
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                        ),
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
