import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Models/cart.dart';

class CartController extends GetxController {
  RxList<Cart> cart = <Cart>[].obs;
  int itemCount = 0;
  double totalItems = 0;
  double cartTotal = 0;

  void totalPrice({required Cart item}) {
    totalItems = cart.fold(
      0,
      (sum, element) => sum += (element.quantity!) * (element.price!),
    );
    debugPrint("$totalItems");
    cartTotal = delivery + totalItems;
  }

  void increment({required Cart item}) {
    var index = cart.indexWhere((element) => element.id == item.id);
    if (cart[index].id == item.id) {
      int quantity = cart[index].quantity!;
      quantity++;
      cart[index].quantity = quantity;
      debugPrint(cart[index].quantity.toString());
    }
    totalPrice(item: item);
    cart.refresh();
  }

  void decrement({required Cart item}) {
    var index = cart.indexWhere((element) => element.id == item.id);
    if (cart[index].id == item.id) {
      int quantity = cart[index].quantity!;
      if (quantity <= 1) {
        cart[index].quantity = 1;
      } else {
        quantity--;
        cart[index].quantity = quantity;
        debugPrint(cart[index].quantity.toString());
      }
    }
    totalPrice(item: item);
    cart.refresh();
  }

  void removeItem(Cart cartItem) {
    var index =
        cartController.cart.indexWhere((element) => element.id == cartItem.id);
    debugPrint("$index");
    if (cart[index].id == cartItem.id) {
      cart.remove(cart[index]);
      debugPrint("${cartController.cart}");
      cartController.totalPrice(item: cartItem);
    }
    cart.refresh();
  }
}
