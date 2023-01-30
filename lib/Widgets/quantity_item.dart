import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

// ignore: must_be_immutable
class QuantityItem extends StatelessWidget {
  QuantityItem({
    Key? key,
    required this.quantity,
    required this.plusTap,
    required this.minusTap,
  }) : super(key: key);
  String quantity;
  void Function()? plusTap, minusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenWidth(50),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/addProduct.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: minusTap,
            child: Container(
              width: getProportionateScreenWidth(30),
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(5),
                ),
                child: SvgPicture.asset(
                  "assets/icons/minus.svg",
                  width: getProportionateScreenWidth(100),
                ),
              ),
            ),
          ),
          BodyText(
            text: quantity,
            fontSize: getProportionateScreenWidth(16),
            weight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: plusTap,
            child: Container(
              width: getProportionateScreenWidth(30),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(5),
                ),
                child: SvgPicture.asset(
                  "assets/icons/add.svg",
                  width: getProportionateScreenWidth(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartQuantityItem extends StatelessWidget {
  CartQuantityItem({
    Key? key,
    this.quantity = "1",
    required this.plusTap,
    required this.minusTap,
  }) : super(key: key);
  String quantity;
  Function() plusTap, minusTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      width: getProportionateScreenWidth(90),
      height: getProportionateScreenWidth(40),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/addProduct.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: minusTap,
            child: Container(
              width: getProportionateScreenWidth(20),
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(3),
                ),
                child: SvgPicture.asset(
                  "assets/icons/minus.svg",
                  width: getProportionateScreenWidth(50),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenWidth(2)),
            child: BodyText(
              text: quantity,
              fontSize: getProportionateScreenWidth(16),
              weight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: plusTap,
            child: Container(
              width: getProportionateScreenWidth(20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(5),
                ),
                child: SvgPicture.asset(
                  "assets/icons/add.svg",
                  width: getProportionateScreenWidth(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
