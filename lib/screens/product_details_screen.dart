import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:collabera_task/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product; // receiving product data from it's parent class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              // showing product original image
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  // showing product name
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  // showing product price
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              // showing product description with dummy data
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                maxLines: 7,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          // showing message when new product added to Cart or duplicate product matched
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          final cartBloc = context.read<CartBloc>();
          final cartItems = cartBloc.state.cardItems;
          if (cartItems.any((item) => item.id == product.id)) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Product already addded to cart'),
              duration: Duration(seconds: 1),
            ));
          } else {
            cartBloc.add(AddToCart(product));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Product addded to cart'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        child: Container(
          // adding Add to Cart button
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
