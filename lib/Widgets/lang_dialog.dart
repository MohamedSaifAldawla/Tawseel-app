import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Globals/globals.dart';
import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

langDialog(
    {required context,
    required Function()? onTap1,
    required Function()? onTap2}) {
  return Get.dialog(
    Dialog(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? kPrimaryLightColor
          : kPrimaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(5),
            right: getProportionateScreenWidth(5),
            bottom: getProportionateScreenWidth(10)),
        width: double.infinity,
        height: getProportionateScreenWidth(180),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/Close2.svg",
                    color: error,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap1,
                  child: Container(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? kPrimaryLightColor
                          : kPrimaryDark3Color,
                      border: Border.all(
                        color: lang == "en"
                            ? kPrimaryColor
                            : Theme.of(context).brightness == Brightness.light
                                ? kPrimaryLightColor
                                : kPrimaryDark3Color,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? shadow
                                  : shadow2,
                          blurRadius: 20.0,
                          offset: const Offset(0, 8),
                          blurStyle: BlurStyle.normal,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/english.png",
                          height: getProportionateScreenHeight(60),
                          width: getProportionateScreenWidth(60),
                        ),
                        Gap(getProportionateScreenWidth(10)),
                        BodyText(
                          text: "English".toUpperCase(),
                          weight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? kTextColor
                                  : kPrimaryLightColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(getProportionateScreenWidth(40)),
                GestureDetector(
                  onTap: onTap2,
                  child: Container(
                    width: getProportionateScreenWidth(100),
                    height: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? kPrimaryLightColor
                          : kPrimaryDark3Color,
                      border: Border.all(
                        color: lang == "ar"
                            ? kPrimaryColor
                            : Theme.of(context).brightness == Brightness.light
                                ? kPrimaryLightColor
                                : kPrimaryDark3Color,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? shadow
                                  : shadow2,
                          blurRadius: 20.0,
                          offset: const Offset(0, 8),
                          blurStyle: BlurStyle.normal,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/saudi.png",
                          height: getProportionateScreenHeight(60),
                          width: getProportionateScreenWidth(60),
                        ),
                        Gap(getProportionateScreenWidth(10)),
                        BodyText(
                          text: "العربيه".toUpperCase(),
                          weight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? kTextColor
                                  : kPrimaryLightColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
