import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/constants.dart';
import 'package:flutter_ecommerce_web/cubit/global_cubit.dart';
import 'package:flutter_ecommerce_web/main.dart';
import 'package:flutter_ecommerce_web/models/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrendingProductCard extends StatelessWidget {
  const TrendingProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: StaggeredGridView.countBuilder(
        //shrink wrap to avoid error
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisCount: MediaQuery.of(context).size.width > 770 ? 4 : 2,
        itemCount: state.products.length,
        itemBuilder: (BuildContext context, int index) => TrendingProducts(
          press: () {
            cartRepository.addProductToCart(
              state.products[index]!,
              1,
            );
            context.read<GlobalCubit>().addOneToCart();
          },
          products: state.products[index],
        ),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}

class TrendingProducts extends StatefulWidget {
  const TrendingProducts({
    required this.press,
    this.products,
    super.key,
  });
  final Product? products;
  final VoidCallback press;

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
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
                  Image.network(
                    widget.products?.imageUrl ?? '',
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.products?.name ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${widget.products?.price}',
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
