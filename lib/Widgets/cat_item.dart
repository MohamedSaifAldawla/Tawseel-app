import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

// ignore: must_be_immutable
class CatItem extends StatelessWidget {
  CatItem({
    Key? key,
    required this.icon,
    required this.title,
    this.color,
  }) : super(key: key);

  String icon, title;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(10),
        right: getProportionateScreenWidth(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(55),
            decoration: BoxDecoration(
              color: const Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              child: Image.asset(
                icon,
                width: getProportionateScreenWidth(32),
                height: getProportionateScreenWidth(32),
              ),
            ),
          ),
          const Gap(9),
          BodyText(
            text: title,
            weight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(13),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CatItem2 extends StatelessWidget {
  CatItem2({
    Key? key,
    required this.icon,
    required this.title,
    this.color,
  }) : super(key: key);

  String icon, title;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(110),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(55),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(8),
          BodyText(
            text: title,
            weight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(13),
          ),
        ],
      ),
    );
  }
}
