class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  final String category;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageURL,
    required this.category,
  });

  Product.FromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        price = json['price']+.0,
        imageURL = json['image'],
        category = json['category'];
}
