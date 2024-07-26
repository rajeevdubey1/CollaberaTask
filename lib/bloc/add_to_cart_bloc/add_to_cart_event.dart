import 'package:collabera_task/model/product.dart';
import 'package:equatable/equatable.dart';

// Base Cart event class
abstract class CartEvent extends Equatable{
  @override
  List<Object> get props => [];
}

// event to add product in cart
class AddToCart extends CartEvent 
{
  final Product product;
  AddToCart(this.product); 

  @override
  List<Object> get props => [product];
}

// event to remove product from the cart
class RemoveFromCart extends CartEvent 
{
  final Product product;
  RemoveFromCart(this.product); 

  @override
  List<Object> get props => [product];
}