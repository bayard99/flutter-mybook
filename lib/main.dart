import 'package:flutter/material.dart';
import 'package:my_book/screens/pdt_detail_screen.dart';
import './screens/home_page.dart';
import 'package:provider/provider.dart';
import './models/products.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.white),
        title: 'My Book Store',
        home: HomePage(),
        routes: {
            PdtDetail.routeName: (ctx) => PdtDetail(),
            CartScreen.routeName: (ctx) => CartScreen(),
            // OrdersScreen.routName: (ctx)=> OrdersScreen()
          }
      ),
    );
  }
}
