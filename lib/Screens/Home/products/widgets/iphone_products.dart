import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/model/iphone_model.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IPhoneProductCard extends StatelessWidget {
  const IPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 4,
      itemCount: iPhoneProducts.length,
      itemBuilder: (BuildContext context, int index) => IphoneProducts(
        press: () {},
        iPhoneproduct: iPhoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }
}

class MobiPhoneProductCard extends StatelessWidget {
  const MobiPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      itemCount: iPhoneProducts.length,
      itemBuilder: (BuildContext context, int index) => IphoneProducts(
        press: () {},
        iPhoneproduct: iPhoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }
}

class IphoneProducts extends StatefulWidget {
  const IphoneProducts({
    required this.iPhoneproduct,
    required this.press,
    Key? key,
  }) : super(key: key);
  final IphoneProduct iPhoneproduct;
  final VoidCallback press;

  @override
  State<IphoneProducts> createState() => _IphoneProductsState();
}

class _IphoneProductsState extends State<IphoneProducts> {
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
                    widget.iPhoneproduct.image,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.iPhoneproduct.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${widget.iPhoneproduct.price}',
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
