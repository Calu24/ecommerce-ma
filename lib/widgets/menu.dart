import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/cubit/global_cubit.dart';
import 'package:flutter_ecommerce_web/responsive.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: kMaxWidth,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        ),
                      //title
                      AutoSizeText(
                        'E-Commerce MA',
                        maxLines: 1,
                        minFontSize: 16,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width >= 348
                              ? 22
                              : 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (Responsive.isDesktop(context)) const WebMenu(),

                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: kDarkgreyColor,
                          size: 25,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.pushNamed('cart'),
                        icon: Badge(
                          isLabelVisible: context
                                  .watch<GlobalCubit>()
                                  .state
                                  .cartTotalQuantity !=
                              0,
                          label: Text(
                            context
                                .watch<GlobalCubit>()
                                .state
                                .cartTotalQuantity
                                .toString(),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: kDarkgreyColor,
                            size: 25,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_outline,
                          color: kDarkgreyColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WebMenu extends StatelessWidget {
  const WebMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItems(
          isActive: true,
          title: 'Home',
          press: () {},
        ),
        MenuItems(
          title: 'Products',
          press: () {},
        ),
        MenuItems(
          title: 'Category',
          press: () {},
        ),
        MenuItems(
          title: 'Contact Us',
          press: () {},
        ),
      ],
    );
  }
}

class MobMenu extends StatelessWidget {
  const MobMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MenuItems(
              isActive: true,
              title: 'Home',
              press: () {},
            ),
            MenuItems(
              title: 'Products',
              press: () {},
            ),
          ],
        ),
        Row(
          children: [
            MenuItems(
              title: 'Category',
              press: () {},
            ),
            MenuItems(
              title: 'Contact Us',
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class MenuItems extends StatefulWidget {
  const MenuItems({
    required this.title,
    required this.press,
    super.key,
    this.isActive = false,
  });
  final String title;
  final VoidCallback press;
  final bool isActive;

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.press,
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive == true
                    ? kPrimaryColor
                    : isHover
                        ? kPrimaryColor
                        : Colors.transparent,
                width: 4,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: widget.isActive == true
                  ? FontWeight.bold
                  : isHover
                      ? FontWeight.bold
                      : FontWeight.normal,
              fontSize: size.width >= 370 ? 18 : 14,
              color: widget.isActive == true
                  ? kPrimaryColor
                  : isHover
                      ? kPrimaryColor
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
