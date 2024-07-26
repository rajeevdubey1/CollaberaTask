// Product Model Class
class Product {
  final int id;
  final double price;
  final String name;
  final String thumbnail;
  final String imageUrl;
  int quantity;

  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.thumbnail,
    required this.imageUrl,
    this.quantity = 0,
  });
  
}