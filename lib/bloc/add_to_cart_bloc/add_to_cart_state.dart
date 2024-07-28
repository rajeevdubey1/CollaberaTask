import 'package:collabera_task/model/product_model.dart';

// Cart state will carry all items of the cart
class CartState {
  final List<ProductModel> cardItems;
  CartState(this.cardItems);
}
