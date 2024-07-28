import 'package:collabera_task/model/product_model.dart';
import 'package:collabera_task/screens/product_details_screen.dart';
import 'package:collabera_task/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product)));
        },
        leading: ProductImage(imageUrlString: product.image!),
        title: Text(
          product.title!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
        subtitle: Text(
          '\$${product.price}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF7165D6)),
        ),
      ),
    );
  }
}
