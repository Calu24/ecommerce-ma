import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/model/headphone_model.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HeadPhoneProductCard extends StatelessWidget {
  const HeadPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 4,
      itemCount: headphoneProducts.length,
      itemBuilder: (BuildContext context, int index) => HeadPhoneProducts(
        press: () {},
        headphoneproduct: headphoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }
}

class MobHeadPhoneProductCard extends StatelessWidget {
  const MobHeadPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      itemCount: headphoneProducts.length,
      itemBuilder: (BuildContext context, int index) => HeadPhoneProducts(
        press: () {},
        headphoneproduct: headphoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }
}

class HeadPhoneProducts extends StatefulWidget {
  const HeadPhoneProducts({
    required this.headphoneproduct,
    required this.press,
    Key? key,
  }) : super(key: key);
  final HeadPhoneProduct headphoneproduct;
  final VoidCallback press;

  @override
  State<HeadPhoneProducts> createState() => _HeadPhoneProductsState();
}

class _HeadPhoneProductsState extends State<HeadPhoneProducts> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kgreyColor, width: 3),
          boxShadow: [if (isHover) kDefaultShadow],
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.asset(
                    widget.headphoneproduct.image,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.headphoneproduct.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${widget.headphoneproduct.price}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            if (isHover)
              ColoredBox(
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 40,
                      onPressed: () {},
                      child: const Text(
                        'Quick View',
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: kSecondaryColor,
                      height: 40,
                      onPressed: () {},
                      child: const Text(
                        'Shop Now',
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
