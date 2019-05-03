import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreatePage> {
  String _titleValue = '';
  double _priceValue = 0.0;
  String _descValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: NotificationListener(
          onNotification: (Notification n) {
            if (n is UserScrollNotification) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
                onChanged: (String value) {
                  _titleValue = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Price',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (String value) {
                  _priceValue = double.parse(value);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onChanged: (String value) {
                  _descValue = value;
                },
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('SAVE'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: () {
                  final Map<String, dynamic> product = {
                    'title': _titleValue,
                    'description': _descValue,
                    'price': _priceValue,
                    'image': 'assets/food.jpg',
                  };
                  widget.addProduct(product);
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
