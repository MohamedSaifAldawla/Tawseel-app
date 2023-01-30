import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawseel/Controllers/cart_controller.dart';
import 'package:tawseel/Controllers/cat_controller.dart';
import 'package:tawseel/Controllers/product_controller.dart';
import 'package:tawseel/Controllers/store_controller.dart';
import 'package:tawseel/Views/Home/cart_screen.dart';
import 'package:tawseel/Views/Home/fav_screen.dart';
import 'package:tawseel/Views/Home/home_screen.dart';
import 'package:tawseel/Views/Home/orders_screen.dart';
import 'package:tawseel/Views/Home/profile_screen.dart';

import '../Globals/globals.dart';

class MainController extends GetxController {
  CatController catController = Get.put(CatController());
  ProductController productController = Get.put(ProductController());
  StoreController storeController = Get.put(StoreController());
  CartController cartController = Get.put(CartController());

  Locale? language;
  var currentIndex = 0.obs;
  List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];
  changeLang(String code) async {
    Locale locale = Locale(code);
    GetStorage().write("lang", code);
    Get.updateLocale(locale);
    init();
  }

  @override
  void onInit() async {
    debugPrint(lang);
    debugPrint("isDark:$isDark");
    if (lang == "ar") {
      language = const Locale("ar");
    } else if (lang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      Get.changeThemeMode(ThemeMode.light);
    }

    super.onInit();
  }

  //--------------------- Snack Bar --------------------------//
  // ignore: non_constant_identifier_names
  SnackbarController SnackBar(String title, String message, Widget icon,
      Color backgroundColor, SnackPosition? snackPosition, int duration) {
    return Get.snackbar(
      title,
      message,
      icon: icon,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      borderRadius: 20,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      dismissDirection: DismissDirection.vertical,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
