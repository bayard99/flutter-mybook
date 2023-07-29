import 'package:flutter/material.dart';
import '../widgets/home_body.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Flutter Ecom',
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
        actions: <Widget>[
          IconButton(
                onPressed: () =>
                    null,
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
          Badge(
            child: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
            value: cartData.items.length,
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
