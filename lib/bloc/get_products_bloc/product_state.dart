
import 'package:collabera_task/model/product_model.dart';

abstract class ProductState {}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}

class ProductFetchingLoadingState extends ProductState {}

class ProductFetchingErrorState extends ProductState {}

class ProductFetchingSuccessfulState extends ProductState {
  final List<ProductModel> products;
  ProductFetchingSuccessfulState({
    required this.products,
  });
}

