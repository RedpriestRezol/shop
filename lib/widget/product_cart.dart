import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widget/product_price.dart';

class ProductCart extends StatelessWidget {
  final Product product;

  const ProductCart({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          SizedBox(height: 100, child: Image.network(product.imageURL)),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ProductPrice(price: product.price),


              ],

            ),
          ),
          
        ],
      ),
    );
  }
}
