import 'package:flutter_ecommerce_web/main.dart';
import 'package:flutter_ecommerce_web/models/cart_item.dart';
import 'package:flutter_ecommerce_web/models/product.dart';
import 'package:uuid/uuid.dart';

class CartRepository {
  const CartRepository();
  void addProductToCart(Product product, int quantity) {
    final existingProduct = cart.cartItems
        .where(
          (element) => element.product.id == product.id,
        )
        .firstOrNull;

    if (existingProduct != null) {
      final initialQuantity = existingProduct.quantity;
      cart = cart.copyWith(
        cartItems: List.from(cart.cartItems)
          ..remove(existingProduct)
          ..add(
            existingProduct.copyWith(
              quantity: initialQuantity + quantity,
            ),
          ),
      );
    } else {
      cart = cart.copyWith(
        cartItems: List.from(cart.cartItems)
          ..add(
            CartItem(
              id: const Uuid().v4(),
              product: product,
              quantity: quantity,
            ),
          ),
      );
    }
  }
}
