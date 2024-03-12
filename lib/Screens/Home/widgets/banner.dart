import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/constants.dart';

//change the name of class
class HeroBanner extends StatefulWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          items: [
            SliderCard(
              title: 'Headphone',
              image: 'assets/products/banner/banner_1.png',
              press: () {},
            ),
            SliderCard(
              title: 'Mobile',
              image: 'assets/products/banner/banner_2.png',
              press: () {},
            ),
            SliderCard(
              title: 'Headphone',
              image: 'assets/products/banner/banner_3.png',
              press: () {},
            ),
            SliderCard(
              title: 'Headphone',
              image: 'assets/products/banner/banner_4.png',
              press: () {},
            ),
          ],
          options: CarouselOptions(
            height: size.width == 300
                ? 250
                : size.width >= 500
                    ? 500
                    : 300,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            onPageChanged: (int p, carouselPageChangedReason) {
              setState(() {
                index = p;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 4,
          position: index.toDouble(),
          decorator: DotsDecorator(
            activeColor: kPrimaryColor.withOpacity(0.5),
            activeSize: const Size(18, 9),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    required this.title,
    required this.image,
    required this.press,
    Key? key,
  }) : super(key: key);
  final String title;
  final String image;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: kgreyColor,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  '$title Made For You',
                  textAlign: TextAlign.center,
                  minFontSize: 16,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: size.width >= 500 ? 28 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: press,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        fontSize: size.width >= 500 ? 18 : 12,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: size.width >= 500 ? 400 : 200,
                  width: size.width >= 500 ? 400 : 200,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
