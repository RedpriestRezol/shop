import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

import '../providers/products_provider.dart';
import '../widget/productCard.dart';
import '../widget/small_product_card.dart';

class ProductScreen extends StatefulWidget {
  final int id;

  const ProductScreen({
    required this.id,
  });
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productsProvider = ProductsProvider();
  Product? _product;
  List<Product> _relatedProducts = [];

  @override
  void initState() {
    _productsProvider
        .getProduct(id: widget.id)
        .then((product) => setState(() => _product = product))
        .then((_) => _productsProvider.getProducts(category: _product!.category))
        .then((value) => setState(() => _relatedProducts = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product screen'),
      ),
      body: _product == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ProductCard(
                    product: _product!,
                    showBorder: false,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: _relatedProducts
                            .where((product) => _product?.id != product.id)
                            .map((product) => SmallProductCard(product: product))
                            .toList()),
                  )
                ],
              ),
            ),
    );
  }
}
