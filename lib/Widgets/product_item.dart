import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Globals/globals.dart';
import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.id,
    required this.name,
    required this.contColor,
    required this.price,
    required this.img,
    required this.weight,
    required this.isFav,
    required this.onTap,
    required this.favTap,
  }) : super(key: key);

  String name, img, weight;
  double price;
  int contColor, id;
  bool isFav;
  Function() onTap, favTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: getProportionateScreenWidth(100),
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(15),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(10),
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: favTap,
                  child: SvgPicture.asset(
                    isFav == true
                        ? "assets/icons/fav.svg"
                        : "assets/icons/favorite.svg",
                    width: getProportionateScreenWidth(13),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: getProportionateScreenWidth(80),
                height: getProportionateScreenWidth(80),
                decoration: BoxDecoration(
                  color: kContainer2Color,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenWidth(60),
                      decoration: BoxDecoration(
                        color: contColor == 0
                            ? const Color(0xff78838E)
                            : Color(contColor),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: getProportionateScreenWidth(-10),
                left: getProportionateScreenWidth(10),
                child: Hero(
                  tag: id,
                  child: Image.asset(
                    img,
                    width: getProportionateScreenWidth(60),
                    height: getProportionateScreenWidth(60),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          BodyText(
            text: name,
            weight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(16),
          ),
          Container(
            padding: lang == 'en'
                ? EdgeInsets.only(
                    left: getProportionateScreenWidth(10),
                  )
                : EdgeInsets.only(
                    right: getProportionateScreenWidth(10),
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BodyText(
                    text: '$price ${'SDG'.tr} / ${weight.tr}',
                    fontSize: getProportionateScreenWidth(10),
                    weight: FontWeight.bold,
                  ),
                ),
                if (lang == 'en')
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: getProportionateScreenWidth(25),
                      height: getProportionateScreenWidth(25),
                      decoration: BoxDecoration(
                        color: const Color(0xffe6e6e6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getProportionateScreenWidth(5),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          getProportionateScreenWidth(5),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                        ),
                      ),
                    ),
                  ),
                if (lang == 'ar')
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: getProportionateScreenWidth(25),
                      height: getProportionateScreenWidth(25),
                      decoration: BoxDecoration(
                        color: const Color(0xffe6e6e6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            getProportionateScreenWidth(5),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          getProportionateScreenWidth(5),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
