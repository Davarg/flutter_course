import 'package:flutter/material.dart';

import './price_tag.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(products[index]['price'].toString()),
              ],
            ),
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
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      '/product/${index.toString()}',
                    ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      '/product/${index.toString()}',
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget result = Center(
      child: Text('No products found, please add some'),
    );

    if (products.length > 0) {
      result = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
