import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/global_cubit.dart';
import 'package:flutter_ecommerce_web/extensiones/two_decimals.dart';
import 'package:flutter_ecommerce_web/main.dart';
import 'package:flutter_ecommerce_web/widgets/cart_item_card.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Cart', style: textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              // ignore: lines_longer_than_80_chars
                '${context.watch<GlobalCubit>().state.cartTotalQuantity} Items in the Cart',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              if (cart.cartItems.isEmpty)
                const Text('No items in the cart')
              else
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart.cartItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final cartItem = cart.cartItems[index];
                    return CartItemCard(cartItem: cartItem);
                  },
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(child: Text('Total: \$${cart.totalPrice.twoDecimals}')),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pushNamed('checkout');
                },
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
