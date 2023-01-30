import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Util/theme.dart';
import 'package:tawseel/Views/User/Home/cart_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.event_note,
      Icons.favorite_border,
      Icons.person_outline,
    ];

    List<String> title = [
      'Home'.tr,
      'Favorite'.tr,
      'Orders'.tr,
      'Profile'.tr,
    ];
    return Obx(
      () => Scaffold(
        body: mainController.screens[mainController.currentIndex.value],
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomNavigationBar(
          isFloating: true,
          borderRadius: Radius.circular(getProportionateScreenHeight(40)),
          strokeColor: kPrimaryLightColor,
          scaleFactor: 0.1,
          backgroundColor: kPrimaryColor,
          currentIndex: mainController.currentIndex.value,
          iconSize: getProportionateScreenWidth(25.0),
          onTap: (index) {
            if (index == 2) {
              Get.to(() => const CartScreen(), transition: Transition.fadeIn);
              Future.delayed(const Duration(seconds: 1), () async {
                mainController.currentIndex.value = 0;
              });
            } else {
              if (index == 3) {
                productController.getFav();
              }
              mainController.currentIndex.value = index;
            }
          },
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/home.svg"),
              selectedIcon: SvgPicture.asset("assets/icons/homef.svg"),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/note.svg"),
              selectedIcon: SvgPicture.asset("assets/icons/notef.svg"),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/cart.svg"),
              selectedIcon: SvgPicture.asset("assets/icons/cartf.svg"),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Heart.svg"),
              selectedIcon: SvgPicture.asset("assets/icons/Heartf.svg"),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/profile.svg"),
              selectedIcon: SvgPicture.asset("assets/icons/profilef.svg"),
            ),
          ],
        ),
      ),
    );
  }
}

 // floatingActionButton: FloatingActionButton(
        //   onPressed: (() => Get.toNamed(Routes.cart)),
        //   backgroundColor: kPrimaryColor,
        //   child: SvgPicture.asset(
        //     "assets/icons/cart.svg",
        //     height: getProportionateScreenWidth(30),
        //   ),
        // ),
        
   // bottomNavigationBar: AnimatedBottomNavigationBar(
        //   backgroundColor: kPrimaryColor,
        //   splashColor: kPrimaryLightColor,
        //   activeColor: kPrimaryLightColor,
        //   inactiveColor: kTextColor,
        //   icons: icons,
        //   activeIndex: mainController.currentIndex.value,
        //   gapLocation: GapLocation.center,
        //   notchSmoothness: NotchSmoothness.softEdge,
        //   onTap: (index) {
        //     mainController.currentIndex.value = index;
        //   },
        // ),