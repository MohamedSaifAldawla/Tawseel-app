import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Models/product.dart';

import '../../Models/cart.dart';
import '../../Util/theme.dart';

class ProductController extends GetxController {
  List<Product> favProduct = [];
  List<Product> product = [
    Product(
      id: 1,
      name: "Lettuce",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product1.png",
      price: 600,
      isFav: false,
      weight: "1K",
      color: 0xffA7C551,
    ),
    Product(
      id: 2,
      name: "Tomato",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product2.png",
      price: 200,
      isFav: true,
      weight: "1K",
      color: 0xffFA5B4f,
    ),
    Product(
      id: 3,
      name: "Eggplant",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product3.png",
      price: 500,
      isFav: false,
      weight: "1K",
      color: 0xff78838E,
    ),
    Product(
      id: 4,
      name: "Carrot",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product4.png",
      price: 300,
      isFav: false,
      weight: "1K",
      color: 0xffFEB392,
    ),
    Product(
      id: 5,
      name: "Onion",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product5.png",
      price: 100,
      isFav: false,
      weight: "1K",
      color: 0xffD86B7F,
    ),
    Product(
      id: 6,
      name: "Potato",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product6.png",
      price: 300,
      isFav: true,
      weight: "1K",
      color: 0xffE7D59F,
    ),
    Product(
      id: 7,
      name: "Pumpkin",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product7.png",
      price: 400,
      isFav: false,
      weight: "1K",
      color: 0xffFFD574,
    ),
    Product(
      id: 8,
      name: "Red onion",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product8.png",
      price: 200,
      isFav: true,
      weight: "1K",
      color: 0xff4E760D,
    ),
    Product(
      id: 9,
      name: "Beet",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product9.png",
      price: 800,
      isFav: false,
      weight: "1K",
      color: 0xffB9203F,
    ),
    Product(
      id: 10,
      name: "Red chili",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product10.png",
      price: 500,
      isFav: true,
      weight: "1K",
      color: 0xffF97B75,
    ),
    Product(
      id: 11,
      name: "Cabbage",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product11.png",
      price: 100,
      isFav: false,
      weight: "1K",
      color: 0xffADCD85,
    ),
    Product(
      id: 12,
      name: "Cucumber",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product12.png",
      price: 200,
      isFav: true,
      weight: "1K",
      color: 0xffC0D926,
    ),
    Product(
      id: 13,
      name: "Okra",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product13.png",
      price: 200,
      isFav: false,
      weight: "1K",
      color: 0xff91D35F,
    ),
    Product(
      id: 14,
      name: "White onion",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product14.png",
      price: 200,
      isFav: true,
      weight: "1K",
      color: 0xffCEDE93,
    ),
    Product(
      id: 15,
      name: "Garlic",
      disc:
          "Green zucchini contains fiber that aids digestion, calcium that strengthens bones, magnesium that is good for mood, potassium that works and helps build muscles, helps regulate blood sugar levels, fights harmful cholesterol, helps lose weight and strengthens eyesight.",
      image: "assets/images/product15.png",
      price: 200,
      isFav: true,
      weight: "1K",
      color: 0xffBF844B,
    ),
  ];

  RxInt counter = 1.obs;
  RxInt total = 0.obs;

  @override
  void onInit() async {
    getFav();
    super.onInit();
  }

  void getFav() {
    favProduct.clear();
    for (var i = 0; i < product.length; i++) {
      if (product[i].isFav == true) {
        favProduct.add(product[i]);
      }
    }
    debugPrint("Fav Products :$favProduct");
  }

  void addToCart(Cart cartItem) {
    debugPrint("${cartItem.id}");
    var index =
        cartController.cart.indexWhere((element) => element.id == cartItem.id);
    debugPrint("$index");
    if (index == -1) {
      cartController.cart.add(cartItem);
      debugPrint("${cartController.cart}");
      mainController.SnackBar(
        "Success".tr,
        "Added successfully".tr,
        SvgPicture.asset(
          "assets/icons/Success2.svg",
          color: Colors.white,
        ),
        success,
        SnackPosition.TOP,
        2,
      );
      cartController.totalPrice(item: cartItem);
    } else if (cartController.cart[index].id == cartItem.id) {
      mainController.SnackBar(
        "Error".tr,
        "Item already in cart".tr,
        SvgPicture.asset(
          "assets/icons/Close2.svg",
          color: Colors.white,
        ),
        error,
        SnackPosition.TOP,
        2,
      );
    }
  }

  void increment() {
    counter++;
  }

  void decrement() {
    if (counter.value <= 1) {
      counter.value = 1;
    } else {
      counter--;
    }
  }
}
