import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Util/theme.dart';

import '../../Animations/FadeAnimation.dart';
import '../../Globals/globals.dart';
import '../../Widgets/intro.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders".tr),
      ),
      body: FadeAnimation(
        1,
        ListView.separated(
          padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => const OrderItem(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        width: double.infinity,
        height: getProportionateScreenWidth(90),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
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
        child: Row(
          children: [
            Image.asset(
              logo,
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenWidth(40),
            ),
            Gap(getProportionateScreenWidth(15)),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyText(
                    text: "Order number",
                    fontSize: getProportionateScreenWidth(10),
                    color: Colors.grey,
                    weight: FontWeight.bold,
                  ),
                  const BodyText(
                    text: "#0012567",
                    weight: FontWeight.bold,
                  ),
                  const BodyText(
                    text: "4" + " " + "items",
                    color: success,
                    weight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BodyText(
                          text: "Preparing",
                          fontSize: getProportionateScreenWidth(13),
                          color: kPrimary2Color,
                          weight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BodyText(
                        text: "12-12-2022",
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(12),
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(getProportionateScreenWidth(10)),
            SvgPicture.asset(
              "assets/icons/Line2.svg",
              color: error,
              height: getProportionateScreenWidth(40),
            ),
            Gap(getProportionateScreenWidth(10)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyText(
                  text: "Total",
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(12),
                  weight: FontWeight.bold,
                ),
                BodyText(
                  text: "4400" + " " + "SDG",
                  color: error,
                  fontSize: getProportionateScreenWidth(14),
                  weight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
