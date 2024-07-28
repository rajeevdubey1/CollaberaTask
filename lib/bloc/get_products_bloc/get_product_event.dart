import 'package:equatable/equatable.dart';

// Base class for product event
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// when application initialize, we will call this event to get one product in product list
class InitProductEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}

// Call when required more product from server
class GetNewProductEvent extends ProductEvent {
  final int itemCount;
  GetNewProductEvent(this.itemCount);

  @override
  List<Object> get props => [itemCount];
}
