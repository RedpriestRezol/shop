import 'package:flutter/material.dart';
import 'package:shop/providers/cart_provider.dart';

import 'package:provider/provider.dart';
import 'package:shop/widget/product_price.dart';

import '../../models/product.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final Function()? callback;
  final bool showBorder;

  ProductCard({
   required this.product,
    this.callback,
    this.showBorder = true,
  });
  void _addToCart(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    cartProvider.addProducrt(product);

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback!();
        }
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: showBorder
              ? Border.all(
                  width: 5,
                  color: Colors.black54,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      product.imageURL,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(price: product.price),
                      Consumer<CartProvider>(
                        builder:(context, provider, child) {
                          if (provider.products.indexWhere((element) => element.id == product.id) != -1){
                            return Icon(Icons.check, color: Colors.green,);
                          }
                          return TextButton(
                              onPressed: () => _addToCart(context), child: const Text('Add to cart'));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
