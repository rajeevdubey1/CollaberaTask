import 'dart:async';

import 'package:collabera_task/bloc/get_products_bloc/product_event.dart';
import 'package:collabera_task/bloc/get_products_bloc/product_state.dart';
import 'package:collabera_task/model/product_model.dart';
import 'package:collabera_task/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialFetchEvent>(productInitialFetchEvent);
  }

  FutureOr<void> productInitialFetchEvent(
      ProductInitialFetchEvent event, Emitter<ProductState> emit) async {
    emit(ProductFetchingLoadingState());
    List<ProductModel> products = await ProductRepo.fetchProducts();
    if (products.isNotEmpty) {
      emit(ProductFetchingSuccessfulState(products: products));
    } else {
      emit(ProductFetchingErrorState());
    }
  }
}
