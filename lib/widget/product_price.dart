import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double price;

  const ProductPrice({
    required this.price,
});

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFEBE5DC),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text('\$ $price'),
    );
  }
}

