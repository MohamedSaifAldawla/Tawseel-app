import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Globals/globals.dart';
import '../Util/size_config.dart';
import '../Util/theme.dart';
import 'intro.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({
    Key? key,
    required this.firstIcon,
    required this.title,
    this.onTap,
  }) : super(key: key);
  String firstIcon, title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(10),
            top: getProportionateScreenWidth(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              firstIcon,
              width: getProportionateScreenWidth(20),
              height: getProportionateScreenWidth(20),
            ),
            Gap(getProportionateScreenWidth(15)),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(6)),
              child: BodyText(
                text: title,
                weight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              width: getProportionateScreenWidth(25),
              height: getProportionateScreenWidth(25),
              decoration: BoxDecoration(
                color: kTextColor,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                child: SvgPicture.asset(
                  lang == "en"
                      ? "assets/icons/right.svg"
                      : "assets/icons/Back.svg",
                  color: kPrimaryLightColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
