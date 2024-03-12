import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/Screens/Home/widgets/menu.dart';
import 'package:flutter_ecommerce_web/constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kgreyColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'E-Commerce MA',
                        style: TextStyle(
                          fontSize: size.width >= 370 ? 22 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (size.width >= 550) const WebMenu() else const MobMenu(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
