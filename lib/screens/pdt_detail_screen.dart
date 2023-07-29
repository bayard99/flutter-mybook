import 'package:flutter/material.dart';
import 'package:my_book/models/cart.dart';
import 'package:my_book/models/products.dart';
import 'package:provider/provider.dart';

class PdtDetail extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedPdt.name,
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                loadedPdt.imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Price: \$${loadedPdt.price}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              loadedPdt.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // RaisedButton(
          //   onPressed: () {
          //     Provider.of<Cart>(context)
          //         .addItem(productId, loadedPdt.name, loadedPdt.price);
          //   },
          //   child: Text('Cart'),
          // )
        ],
      ),
    );
  }
}
