import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawseel/Views/User/Home/cart_screen.dart';
import 'package:tawseel/Views/User/Home/fav_screen.dart';
import 'package:tawseel/Views/User/Home/home_screen.dart';
import 'package:tawseel/Views/User/Home/orders_screen.dart';
import 'package:tawseel/Views/User/Home/profile_screen.dart';

import '../../Globals/globals.dart';
import 'cart_controller.dart';
import 'cat_controller.dart';
import 'product_controller.dart';
import 'store_controller.dart';

class MainController extends GetxController {
  CatController catController = Get.put(CatController());
  ProductController productController = Get.put(ProductController());
  StoreController storeController = Get.put(StoreController());
  CartController cartController = Get.put(CartController());

  Locale? language;
  var currentIndex = 0.obs;
  bool darkMode = false;
  List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];

  //--------------------- Change Lang --------------------------//

  changeLang(String code) async {
    Locale locale = Locale(code);
    GetStorage().write("lang", code);
    Get.updateLocale(locale);
    init();
  }

  //--------------------- Change Theme --------------------------//
  void changeTheme(value) {
    if (value == true) {
      darkMode = true;
      Get.changeThemeMode(ThemeMode.dark);
      GetStorage().write("isDark", true);
    } else if (value == false) {
      darkMode = false;
      Get.changeThemeMode(ThemeMode.light);
      GetStorage().write("isDark", false);
    }
  }

  @override
  void onInit() async {
    debugPrint(lang);
    debugPrint("isDark:$isDark");
    if (isDark == true) {
      darkMode = true;
    }
    if (isDark == false || isDark == null) {
      darkMode = false;
    }
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
