import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_web/models/product.dart';

class CartItem extends Equatable {
  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });
  final String id;
  final Product product;
  final int quantity;

  double get subtotal => product.price * quantity;

  @override
  List<Object?> get props => [id, product, quantity];

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
