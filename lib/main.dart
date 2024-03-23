import 'package:db_client/db_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/firebase_options.dart';
import 'package:flutter_ecommerce_web/repositories/category_repository.dart';
import 'package:flutter_ecommerce_web/repositories/product_repository.dart';
import 'package:flutter_ecommerce_web/router/router.dart';

final dbClient = DbClient();
final categoryRepository = CategoryRepository(dbClient: dbClient);
final productRepository = ProductRepository(dbClient: dbClient);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'e-commerce',
      //removing debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GRouter.router,
    );
  }
}
