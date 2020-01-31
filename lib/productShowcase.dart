import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:polar_ice_app/boxItemPage.dart';
import 'package:polar_ice_app/bundleItemPage.dart';
import 'package:polar_ice_app/product.dart';

class ProductShowcase extends StatefulWidget {
  final String title;
  final List<Product> list;
  ProductShowcase({Key key, @required this.title, @required this.list})
      : super(key: key);

  @override
  ProductShowcaseState createState() => ProductShowcaseState();
}

class ProductShowcaseState extends State<ProductShowcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2bbfff),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/polarScript.png'),
          alignment: Alignment(0.0, -0.9),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 70.0),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[800],
                          blurRadius: 20.0,
                          offset: Offset(1, 1))
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 15.0,
                        runSpacing: 20.0,
                        children: <Widget>[
                          for (int index = 0;
                              index < widget.list.length;
                              index++)
                            itemContainer(index),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemContainer(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: InkWell(
              onTap: () {
                switch (widget.title) {
                  case 'Bundles':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BundleItemPage(
                                  name: widget.list[index].name,
                                  imagePath: widget.list[index].imagePath,
                                  description: widget.list[index].descrip,
                                )));
                    break;
                  case 'Boxes':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BoxItemPage(
                                  name: widget.list[index].name,
                                  imagePath: widget.list[index].imagePath,
                                  description: widget.list[index].descrip,
                                  inside: Boxes.toList()[index],
                                )));
                    break;
                  default:
                }
              },
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.list[index].imagePath,
                      width: 180,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: Offset(
                    6,
                    7,
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(widget.list[index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'AdventPro',
              )),
        ),
      ],
    );
  }
}
