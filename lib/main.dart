import 'package:db_client/db_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/app.dart';
import 'package:flutter_ecommerce_web/firebase_options.dart';
import 'package:flutter_ecommerce_web/models/cart.dart';
import 'package:flutter_ecommerce_web/repositories/cart_repository.dart';
import 'package:flutter_ecommerce_web/repositories/category_repository.dart';
import 'package:flutter_ecommerce_web/repositories/product_repository.dart';

final dbClient = DbClient();
final categoryRepository = CategoryRepository(dbClient: dbClient);
final productRepository = ProductRepository(dbClient: dbClient);
const cartRepository = CartRepository();

const userId = 'user_1234';
Cart cart = const Cart(userId: userId, cartItems: []);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
