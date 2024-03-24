import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/responsive.dart';
import 'package:flutter_ecommerce_web/widgets/headphone_product.dart';
import 'package:flutter_ecommerce_web/widgets/iphone_products.dart';
import 'package:flutter_ecommerce_web/widgets/samsung_products.dart';

class AllBrandsProduct extends StatefulWidget {
  const AllBrandsProduct({super.key});

  @override
  State<AllBrandsProduct> createState() => _AllBrandsProductState();
}

class _AllBrandsProductState extends State<AllBrandsProduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TabBar(
              indicatorColor: kPrimaryColor,
              unselectedLabelColor: Colors.black,
              labelColor: kPrimaryColor,
              unselectedLabelStyle: TextStyle(
                fontSize: size.width >= 414 ? 18 : 12,
              ),
              labelStyle: TextStyle(
                fontSize: size.width >= 414 ? 18 : 12,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(
                  text: 'iPhone',
                ),
                Tab(
                  text: 'Samsung',
                ),
                Tab(
                  text: 'Headphone',
                ),
              ],
            ),
            if (Responsive.isDesktop(context))
              const SizedBox(
                height: 350,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: IPhoneProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: SamsungProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: HeadPhoneProductCard(),
                    ),
                  ],
                ),
              ),
            if (!Responsive.isDesktop(context))
              const SizedBox(
                height: 600,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobiPhoneProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobSamsungProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobHeadPhoneProductCard(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
