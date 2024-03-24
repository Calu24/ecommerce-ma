import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_web/models/cart_item.dart';

class Cart extends Equatable {
  const Cart({
    required this.userId,
    required this.cartItems,
  });
  final String userId;
  final List<CartItem> cartItems;

  double get totalPrice => cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.subtotal,
      );

  double get totalQuantity => cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  @override
  List<Object?> get props => [userId, cartItems];

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItems,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
    };
  }
}
