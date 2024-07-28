import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrlString});

  final String imageUrlString;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrlString,
      fit: BoxFit.cover,
    );
  }
}
