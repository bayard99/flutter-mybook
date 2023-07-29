import 'package:flutter/material.dart';
import 'package:my_book/screens/pdt_detail_screen.dart';
import '../models/cart.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';

class BookItem extends StatelessWidget {
  final String name;
  final String imagUrl;

  BookItem({this.name, this.imagUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(PdtDetail.routeName, arguments: pdt.id);
        },
        child: GridTile(
          child: Image.network(imagUrl),
          footer: GridTileBar(
            title: Text(name),
            trailing: IconButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Added to Cart')));
                cart.addItem(pdt.id, pdt.name, pdt.price);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
