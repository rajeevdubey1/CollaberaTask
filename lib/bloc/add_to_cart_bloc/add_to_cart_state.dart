import 'package:collabera_task/model/product.dart';

// Cart state will carry all items of the cart
class CartState {
  final List<Product> cardItems;
  CartState(this.cardItems);
}
