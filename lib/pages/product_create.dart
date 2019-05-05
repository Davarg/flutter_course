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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: NotificationListener(
            onNotification: (Notification n) {
              if (n is UserScrollNotification) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
            child: ListView(
              children: <Widget>[
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty == true) {
                      return 'Title must be not empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                  onSaved: (String value) {
                    _titleValue = value;
                  },
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty == true) {
                      return 'Price must be not empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Price',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (String value) {
                    if (value.isEmpty == false) {
                      _priceValue = double.parse(value);
                    }
                  },
                ),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty == true) {
                      return 'Description must be not empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  onSaved: (String value) {
                    _descValue = value;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('SAVE'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate() == true) {
                      _formKey.currentState.save();

                      final Map<String, dynamic> product = {
                        'title': _titleValue,
                        'description': _descValue,
                        'price': _priceValue,
                        'image': 'assets/food.jpg',
                      };
                      widget.addProduct(product);
                      Navigator.pushReplacementNamed(context, '/products');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
