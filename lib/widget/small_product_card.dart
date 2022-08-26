import 'package:flutter/material.dart';
import 'package:shop/widget/product_price.dart';
import '../models/product.dart';





class SmallProductCard  extends StatelessWidget {
  final Product product;

  const SmallProductCard({
    required this.product,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          SizedBox(
            height: 100,
              width: 100,
              child: Image.network(product.imageURL)),
          Text(product.title, maxLines: 1,overflow: TextOverflow.ellipsis,),
          ProductPrice(price: product.price)


        ],
      ),
    );
  }
}
