import 'package:flutter/material.dart';
import '../widgets/cart_body.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
                      child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) => CartPdt(
              cart.items.values.toList()[i].id,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price,
               cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].name,
            ),
    ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(onPressed: (){}, child: Text('Checkout',style: TextStyle(color: Colors.blue, fontSize: 20),)),
          )
        ],
      ),
    );
  }
}
