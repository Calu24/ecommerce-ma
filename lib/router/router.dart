import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/Screens/cart_screen.dart';
import 'package:flutter_ecommerce_web/Screens/checkout_screen.dart';
import 'package:flutter_ecommerce_web/Screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class GRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'Home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'cart',
            name: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            path: 'checkout',
            name: 'checkout',
            builder: (BuildContext context, GoRouterState state) {
              return const CheckoutScreen();
            },
          ),
        ],
      ),
    ],
  );
}
