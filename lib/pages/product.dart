import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/products/price_tag.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String desc;
  final double price;
  final String imageUrl;

  ProductPage(this.title, this.desc, this.price, this.imageUrl);

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action can\'t be undone!'),
            actions: <Widget>[
              FlatButton(
                  child: Text('DISCARD'),
                  onPressed: () => Navigator.pop(
                        context,
                      )),
              FlatButton(
                  child: Text('CONTINUE'),
                  onPressed: () {
                    Navigator.pop(context); //Modal dialog
                    Navigator.pop(context, true);
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    PriceTag(price.toString()),
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.9,
                      ),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    child: Text('Union Square, San Francisco'),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Oswald',
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('DELETE'),
                  onPressed: () => _showWarningDialog(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
