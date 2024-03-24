import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/global_cubit.dart';
import 'package:flutter_ecommerce_web/router/router.dart';


class App extends StatelessWidget {
const App({ super.key });

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => GlobalCubit()..load(),
      child: const EcommerceMaApp(),
    );
  }
}

class EcommerceMaApp extends StatelessWidget {
  const EcommerceMaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'e-commerce MA',
      //removing debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GRouter.router,
    );
  }
}
