import 'package:flutter/material.dart';

import './products.dart';
import './product_list.dart';
import './product_create.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All products'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}