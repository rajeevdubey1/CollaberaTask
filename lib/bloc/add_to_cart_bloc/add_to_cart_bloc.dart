import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:collabera_task/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:collabera_task/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_mapEventToState);
  }

// Adding/Removing products from the Cart screen using Bloc
  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<ProductModel>.from(state.cardItems)
        ..add(event.product);
      emit(CartState(updatedCart));
    } else if (event is RemoveFromCart) {
      final updatedCart = List<ProductModel>.from(state.cardItems)
        ..remove(event.product);
      emit(CartState(updatedCart));
    }
  }
}
