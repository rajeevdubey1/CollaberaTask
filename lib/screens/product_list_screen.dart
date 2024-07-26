import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:collabera_task/bloc/get_products_bloc/get_product_bloc.dart';
import 'package:collabera_task/bloc/get_products_bloc/get_product_event.dart';
import 'package:collabera_task/bloc/get_products_bloc/get_product_state.dart';
import 'package:collabera_task/screens/cart_list_screen.dart';
import 'package:collabera_task/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Check if UI build first time, add initial product in the product list
    final productBloc = context.read<ProductBloc>();
    if(productBloc.state.allProducts.isEmpty) 
    {
      // initialize product list with one item after that you can add more using pull to refresh option
      productBloc.add(InitProductEvent());
    }

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
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh:() async{
          // fetch new products 
          productBloc.add(GetNewProductEvent(productBloc.state.allProducts.length));
        },
        child: BlocBuilder<ProductBloc, ProductState>(builder:(context, state) {
      
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.allProducts.length,
            itemBuilder: (context, index) {
              final product = state.allProducts[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)));
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(product.thumbnail),
                  radius: 25,
                ),
                title: Text(product.name, style: const TextStyle(fontSize: 18,),),
                subtitle: Text('\$${product.price}', style: const TextStyle(fontSize: 15,),),
              );
            });
        },)
      ),
    );
  }
}
