import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Center(child: Text('Latest Offers!', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
          )
        ),
        ),
      ),
    );
  }
}
