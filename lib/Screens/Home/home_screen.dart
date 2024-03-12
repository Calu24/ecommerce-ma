import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/Screens/Home/products/product_section.dart';
import 'package:flutter_ecommerce_web/Screens/Home/widgets/banner.dart';
import 'package:flutter_ecommerce_web/Screens/Home/widgets/bottomnav.dart';
import 'package:flutter_ecommerce_web/Screens/Home/widgets/menu.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/cubit/home_cubit.dart';
import 'package:flutter_ecommerce_web/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..load(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          return Scaffold(
            backgroundColor: kWhiteColor,
            //scrollable widget
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Center(
                      child: Text(
                        'E-Commerce MA',
                        textScaler: TextScaler.linear(1.6),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        MenuItems(
                          isActive: true,
                          title: 'Home',
                          press: () {
                            setState(
                              () => context.read<HomeCubit>().changePage(1),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MenuItems(
                          title: 'Products',
                          press: () {
                            setState(
                              () => context.read<HomeCubit>().changePage(2),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MenuItems(
                          title: 'Category',
                          press: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MenuItems(
                          title: 'Contact Us',
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: ListView(
              controller: context.read<HomeCubit>().homePageController,
              children: const [
                //now we create menu and header
                Navigation(),
                //now we create banner
                //for this import packages
                HeroBanner(),
                ProductSection(),
                BottomNav(),
                //now we will make our site responsive
              ],
            ),
          );
        },
      ),
    );
  }
}
