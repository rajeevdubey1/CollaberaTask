import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:collabera_task/screens/product_details_screen.dart';
import 'package:collabera_task/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // calculate total price
    double totalPrice = 0;
    final cartBloc = context.read<CartBloc>();
    for (var element in cartBloc.state.cardItems) {
      totalPrice = totalPrice + element.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext context, CartState state) {
          if (state.cardItems.isEmpty == true) {
            // if cart is empty
            return const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            // if there are some products added in the cart
            return ListView.builder(
                itemCount: state.cardItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                product: state.cardItems[index])));
                      },
                      leading: ProductImage(
                          imageUrlString: state.cardItems[index].image!),
                      title: Text(
                        state.cardItems[index].title!,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        '\$${state.cardItems[index].price}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            final cartBloc = BlocProvider.of<CartBloc>(context);
                            cartBloc
                                .add(RemoveFromCart(state.cardItems[index]));
                            setState(
                                () {}); // update total price after removing product from the cart
                          },
                          icon:
                              const Icon(Icons.remove_shopping_cart_outlined)),
                    ),
                  );
                });
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Price',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            Text(
              '\$$totalPrice',
              style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
