import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Models/cart.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Util/theme.dart';
import 'package:tawseel/Widgets/quantity_item.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Widgets/intro.dart';
import '../../../Widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Cart".tr),
        ),
        bottomNavigationBar: cartController.cart.isEmpty == true
            ? const SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenWidth(10)),
                child: PrimaryButton(
                  text: "Confirm".tr,
                  press: (() {}),
                ),
              ),
        body: cartController.cart.isEmpty == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/icons/cart.json',
                      width: 350,
                      height: 350,
                      fit: BoxFit.fill,
                    ),
                    BodyText(
                      text: "no items in cart".tr,
                      weight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ],
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  FadeAnimation(
                    1,
                    ListView.separated(
                      padding:
                          EdgeInsets.only(top: getProportionateScreenWidth(20)),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartController.cart.length,
                      itemBuilder: (context, index) =>
                          CartProductItem(cartItem: cartController.cart[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.1,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: getProportionateScreenWidth(40),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Line.svg",
                          height: getProportionateScreenWidth(50),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BodyText(
                            text: "Total items".tr,
                            weight: FontWeight.bold,
                          ),
                          BodyText(
                            text: "${cartController.totalItems}" " ${"SDG".tr}",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.1,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: SvgPicture.asset(
                        "assets/icons/Line.svg",
                        height: getProportionateScreenWidth(30),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.3,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BodyText(
                            text: "Delivery".tr,
                            weight: FontWeight.bold,
                          ),
                          BodyText(
                            text: "$delivery" " ${"SDG".tr}",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.1,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: SvgPicture.asset(
                        "assets/icons/Line.svg",
                        height: getProportionateScreenWidth(30),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BodyText(
                            text: "Total invoice".tr,
                            color: error,
                            weight: FontWeight.bold,
                          ),
                          BodyText(
                            text: "${cartController.cartTotal}" " ${"SDG".tr}",
                            color: error,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(getProportionateScreenWidth(10)),
                ],
              ),
      ),
    );
  }
}

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final Cart cartItem;
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
            getProportionateScreenWidth(25),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: getProportionateScreenWidth(70),
                  height: getProportionateScreenWidth(70),
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
                        width: getProportionateScreenWidth(50),
                        height: getProportionateScreenWidth(50),
                        decoration: BoxDecoration(
                          color: cartItem.color == 0
                              ? const Color(0xff78838E)
                              : Color(cartItem.color!),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: getProportionateScreenWidth(-5),
                  left: getProportionateScreenWidth(15),
                  child: Image.asset(
                    cartItem.image!,
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenWidth(45),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  text: "${cartItem.name}",
                  weight: FontWeight.bold,
                ),
                BodyText(
                  text: "${cartItem.weight}",
                  color: kPrimary2Color,
                  weight: FontWeight.bold,
                ),
                BodyText(
                  text: "${cartItem.price} ${"SDG".tr}",
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            CartQuantityItem(
              quantity: "${cartItem.quantity}",
              plusTap: () {
                cartController.increment(item: cartItem);
              },
              minusTap: () {
                cartController.decrement(item: cartItem);
              },
            ),
            GestureDetector(
              onTap: () {
                cartController.removeItem(Cart(id: cartItem.id));
              },
              child: SvgPicture.asset(
                "assets/icons/close.svg",
                width: getProportionateScreenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
