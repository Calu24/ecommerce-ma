import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/Screens/Home/details_screen.dart';
import 'package:flutter_ecommerce_web/Screens/Home/home_screen.dart';
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
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsScreen();
            },
          ),
        ],
      ),
    ],
  );
}
