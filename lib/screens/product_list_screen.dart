import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:collabera_task/bloc/get_products_bloc/product_event.dart';
import 'package:collabera_task/bloc/get_products_bloc/product_state.dart';
import 'package:collabera_task/bloc/get_products_bloc/product_bloc.dart';
import 'package:collabera_task/screens/cart_list_screen.dart';
import 'package:collabera_task/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductInitialFetchEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int count = state.cardItems.length;
              return Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                  Positioned(
                      child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 15,
                      minWidth: 10,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(onRefresh: () async {
        context.read<ProductBloc>().add(ProductInitialFetchEvent());
      }, child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductFetchingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductFetchingSuccessfulState) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductItem(product: product);
                });
          } else {
            return const Center(
              child: Text('Unable to fetch products, please try again!'),
            );
          }
        },
      )),
    );
  }
}
