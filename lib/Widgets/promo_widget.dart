import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Widgets/intro.dart';
import '../Globals/globals.dart';
import '../Util/theme.dart';

class Promo extends StatelessWidget {
  const Promo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenWidth(15)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(20),
        ),
        decoration: BoxDecoration(
          //color: Colors.amberAccent,
          image: DecorationImage(
            image: lang == "en"
                ? const AssetImage("assets/images/promo.png")
                : const AssetImage("assets/images/promoAr.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: lang == "en"
                    ? EdgeInsets.only(right: getProportionateScreenWidth(35))
                    : EdgeInsets.only(left: getProportionateScreenWidth(35)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyText(
                      text: "20%".tr,
                      weight: FontWeight.bold,
                      color: kPrimaryLightColor,
                      fontSize: getProportionateScreenWidth(35),
                      maxLines: 3,
                    ),
                    BodyText(
                      text: "PromoTitle".tr,
                      weight: FontWeight.bold,
                      color: kPrimaryLightColor,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: lang == "en"
                        ? EdgeInsets.only(
                            right: getProportionateScreenWidth(10),
                          )
                        : EdgeInsets.only(
                            left: getProportionateScreenWidth(10),
                          ),
                    child: BodyText(
                      text: "PromoBody".tr,
                      weight: FontWeight.bold,
                      color: kPrimaryLightColor,
                      fontSize: getProportionateScreenWidth(13),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: (() => {}),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(3),
                          vertical: getProportionateScreenWidth(3)),
                      width: getProportionateScreenWidth(65),
                      height: getProportionateScreenWidth(15),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      child: Center(
                        child: BodyText(
                          text: "Order now".tr,
                          fontSize: getProportionateScreenWidth(10),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? kTextColor
                                  : kPrimaryDark3Color,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
