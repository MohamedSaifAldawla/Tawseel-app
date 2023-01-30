import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawseel/Controllers/cart_controller.dart';
import 'package:tawseel/Controllers/cat_controller.dart';
import 'package:tawseel/Controllers/product_controller.dart';
import 'package:tawseel/Controllers/store_controller.dart';

import '../Controllers/main_controller.dart';
import '../Util/size_config.dart';
import '../Util/theme.dart';

//-------------------------- Controllers -------------------//
final mainController = Get.find<MainController>();
final catController = Get.find<CatController>();
final productController = Get.find<ProductController>();
final storeController = Get.find<StoreController>();
final cartController = Get.find<CartController>();
//-------------------------- Variables -------------------//
String logo = "assets/images/logo.png";
int delivery = 2000;
var passLength = 8;
var lang = GetStorage().read("lang");
var isDark = GetStorage().read('isDark');

Future<void> init() async {
  lang = await GetStorage().read("lang");
}

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  ),
);

void getThemeMode() async {
  if (isDark == true) {
    Get.changeThemeMode(ThemeMode.dark);
  }
  if (isDark == false) {
    Get.changeThemeMode(ThemeMode.light);
  }
}
