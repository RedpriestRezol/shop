import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/filtter.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/product_screen.dart';

import '../providers/products_provider.dart';
import '../widget/productCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _productsProvider = ProductsProvider();
  List<Product>? products;
  List<String> _categories = [];

  void _navigateCart(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));

  }

  @override
  void initState() {
    _productsProvider
        .getProducts()
        .then((value) => setState(() => products = value));
    super.initState();
    _productsProvider
        .getCategories()
        .then((categories) => setState(() => _categories = categories));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog'),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () {
                _navigateCart();
              }, icon: Icon(Icons.shopping_cart)),
              Container(
                width: 15,
                height: 15,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Center(
                    child: Consumer<CartProvider>(
                  builder: (context, provider, child) =>
                      Text(provider.products.length.toString()),
                )),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: products == null
            ? Center(child: const CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(children: [
                  Filter(
                    categories: _categories,
                    onChange: (category) {
                      _productsProvider
                          .getProducts(category: category)
                          .then((value) => setState(() => products = value));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...products!.map(
                    (product) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(id: product.id))),
                        child: ProductCard(
                          product: product,
                          callback: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(id: product.id))),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
