import 'package:collabera_task/bloc/get_products_bloc/get_product_event.dart';
import 'package:collabera_task/bloc/get_products_bloc/get_product_state.dart';
import 'package:collabera_task/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState([])) {
    on<ProductEvent>(_getNewProductToList);
  }

  Future<void> _getNewProductToList(
      ProductEvent event, Emitter<ProductState> emit) async {
    // Adding one product in the list at initial stage of the APP.
    if (event is InitProductEvent) {
      final firstProduct = Product(
          id: 1,
          price: 10,
          name: 'Product 1',
          thumbnail: 'assets/images/product.png',
          imageUrl:
              'https://i.pinimg.com/736x/51/d3/88/51d38806d50482762c700eca5717a32f.jpg');

      final newProductList = List<Product>.from(state.allProducts)
        ..add(firstProduct);
      emit(ProductState(newProductList));
    } else if (event is GetNewProductEvent) {
      // Getting new products
      final newProduct = Product(
          id: event.itemCount + 1,
          price: 10 * (event.itemCount + 1),
          name: 'Product ${event.itemCount + 1}',
          thumbnail: 'assets/images/product.png',
          imageUrl:
              'https://i.pinimg.com/736x/51/d3/88/51d38806d50482762c700eca5717a32f.jpg');

      final newProductList = List<Product>.from(state.allProducts)
        ..add(newProduct);
      emit(ProductState(newProductList));
    }
  }
}
