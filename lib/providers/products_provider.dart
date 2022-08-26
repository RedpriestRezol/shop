import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductsProvider {
  final _dio = Dio();

  Future<List<Product>> getProducts({
    String? category,
  }) async {
    final route = category != null
        ? 'https://fakestoreapi.com/products/category/$category'
        : 'https://fakestoreapi.com/products';

    final response = await _dio.get(route);
    final data = response.data as List;
    return data.map((product) => Product.FromJson(product)).toList();
  }

  Future<Product> getProduct({required int id}) async {
    final response = await _dio.get('https://fakestoreapi.com/products/$id');
    return Product.FromJson(response.data);
  }

  Future<List<String>> getCategories() async {
    final response = await _dio.get('https://fakestoreapi.com/products/categories');
    final data = response.data as List;
    return data.cast<String>();
  }
}
