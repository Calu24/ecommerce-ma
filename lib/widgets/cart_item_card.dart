import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/global_cubit.dart';

import 'package:flutter_ecommerce_web/main.dart';
import 'package:flutter_ecommerce_web/models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.cartItem,
    super.key,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                cartItem.product.imageUrl,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    maxLines: 2,
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${cartItem.subtotal.toStringAsFixed(2)}'),
                      Row(
                        children: [
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              // cartRepository.removeProductFromCart(
                              //   cartItem.product,
                              //   1,
                              // );
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('${cartItem.quantity}'),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () {
                              cartRepository.addProductToCart(
                                cartItem.product,
                                1,
                              );
                              context.read<GlobalCubit>().addOneToCart();
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
