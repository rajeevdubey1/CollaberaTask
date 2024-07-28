import 'package:collabera_task/model/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductRepo {
  static Future<List<ProductModel>> fetchProducts() async {
    var client = http.Client();
    List<ProductModel> posts = [];
    try {
      var response =
          await client.get(Uri.parse('https://fakestoreapi.com/products'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        ProductModel post =
            ProductModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      return [];
    }
  }
}
