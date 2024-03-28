import 'package:db_client/db_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/app.dart';
import 'package:flutter_ecommerce_web/firebase_options.dart';
import 'package:flutter_ecommerce_web/models/cart.dart';
import 'package:flutter_ecommerce_web/repositories/cart_repository.dart';
import 'package:flutter_ecommerce_web/repositories/category_repository.dart';
import 'package:flutter_ecommerce_web/repositories/product_repository.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_client/payment_client.dart';

final dbClient = DbClient();
final paymentClient = PaymentClient();
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
  Stripe.publishableKey =
      // ignore: lines_longer_than_80_chars
      'pk_test_51OyKEt2NSFWUxqZpvAEu9Bxz2pbUzLjVJHGEV0X557ueWyayKEi2gzzRAtjBsNKLHO0w3ARRLY2h3Wy7Dcg14LZl00OrWtCFKR';
  await Stripe.instance.applySettings();
  runApp(const App());
}
