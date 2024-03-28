import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/checkout_cubit.dart';
import 'package:flutter_ecommerce_web/cubit/checkout_state.dart';
import 'package:flutter_ecommerce_web/main.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String route = 'checkout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return const InjectedCheckout();
        },
      ),
    );
  }
}

class InjectedCheckout extends StatelessWidget {
  const InjectedCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Checkout', style: textTheme.headlineSmall),
      ),
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Insert your card details',
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CardField(
                    enablePostalCode: true,
                    onCardChanged: (card) {
                      if (card != null) {
                        context.read<CheckoutCubit>().setCard(card);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(child: Text('Total: \$${cart.totalPrice}')),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: context.watch<CheckoutCubit>().state.isLoading
                    ? null
                    : () async {
                        await handlePayment(context);
                      },
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handlePayment(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _card = context.read<CheckoutCubit>().state.card;
    if (_card?.complete != true) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Please fill in your card details'),
      //   ),
      // );
      return;
    }

    context.read<CheckoutCubit>().isLoading(value: true);

    try {
      await processPayment();
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      if (context.mounted) {
        context.read<CheckoutCubit>().isLoading(value: false);
      }
    }
  }

  Future<void> processPayment() async {
    final paymentMethod = await Stripe.instance.createPaymentMethod(
      params: const PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );

    final response = await paymentClient.processPayment(
      paymentMethodId: paymentMethod.id,
      items: cart.cartItems.map((cartItem) => cartItem.toJson()).toList(),
    );

    print(paymentMethod);
    // if (response['requiresAction'] == true &&
    //     response['clientSecret'] != null) {
    // final paymentIntent =
    //     await Stripe.instance.handleNextAction(response['clientSecret']);

    // print(paymentIntent);
    // if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
    // final response = await paymentClient.confirmPayment(
    //   paymentIntentId: paymentIntent.id,
    // );
    print('HOla: ');
    print(response);
    // }
    // }
  }
}
