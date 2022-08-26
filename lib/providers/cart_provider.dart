import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  double getTotalPrice (){
    double total = 0;
    for (Product i in products){
      total += i.price;

    }
    return total;
  }
  List<Product> products = [];
  void addProducrt(Product product) {
    products.add(product);
    notifyListeners();
  }

}