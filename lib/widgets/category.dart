import 'package:flutter/material.dart';
import './category_card.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
         CatCard(
           icon: Icon(Icons.book, size: 40,),
            name: 'Books',
          ),
          CatCard(
            icon: Icon(Icons.computer, size: 40,),
            name: 'Laptops',
          ),
          CatCard(
            icon: Icon(Icons.videogame_asset, size: 40,),
            name: 'Games',
          ),
          CatCard(
            icon: Icon(Icons.videocam, size: 40,),
            name: 'Movies',
          ),
          CatCard(
            icon: Icon(Icons.watch, size: 40,),
            name: 'Watches',
          ),
          CatCard(
            icon: Icon(Icons.weekend, size: 40,),
            name: 'Furniture',
          )
        ],
      ),
    );
  }
}