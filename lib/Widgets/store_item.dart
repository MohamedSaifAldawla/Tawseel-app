import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

// ignore: must_be_immutable
class StoreItem extends StatelessWidget {
  StoreItem({Key? key, required this.name, required this.img})
      : super(key: key);

  String name, img;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(170),
      height: getProportionateScreenWidth(190),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? kPrimaryLightColor
            : kPrimaryDark3Color,
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? shadow
                : shadow2,
            blurRadius: 20.0,
            offset: const Offset(0, 8),
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getProportionateScreenWidth(110),
              height: getProportionateScreenWidth(110),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? kContainerColor
                    : kPrimaryDarkColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(55),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  img,
                  width: getProportionateScreenWidth(60),
                  color: kPrimaryColor,
                ),
              ),
            ),
            const Gap(15),
            BodyText(
              text: name,
              weight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(16),
            ),
          ],
        ),
      ),
    );
  }
}
