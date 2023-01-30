import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Animations/FadeAnimation.dart';
import '../../../Globals/globals.dart';
import '../../../Models/cart.dart';
import '../../../Util/size_config.dart';
import '../../../Widgets/product_item.dart';
import 'product_screen.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav".tr),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
          ),
          child: Column(
            children: [
              GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                ),
                shrinkWrap: true,
                itemCount: productController.favProduct.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: getProportionateScreenWidth(160),
                  mainAxisSpacing: getProportionateScreenWidth(10),
                  crossAxisSpacing: getProportionateScreenWidth(10),
                ),
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    1,
                    GestureDetector(
                      onTap: () {
                        productController.counter.value = 1;
                        Get.to(
                            () => ProductScreen(
                                  product: productController.favProduct[index],
                                ),
                            transition: Transition.fadeIn);
                      },
                      child: ProductItem(
                          id: productController.favProduct[index].id!,
                          name: "${productController.favProduct[index].name}",
                          contColor: productController.favProduct[index].color!,
                          price: productController.favProduct[index].price!,
                          img: "${productController.favProduct[index].image}",
                          isFav: productController.favProduct[index].isFav!,
                          weight:
                              "${productController.favProduct[index].weight}",
                          favTap: (() {}),
                          onTap: (() {
                            productController.addToCart(
                              Cart(
                                id: productController.favProduct[index].id,
                                name:
                                    "${productController.favProduct[index].name}",
                                image:
                                    "${productController.favProduct[index].image}",
                                price:
                                    productController.favProduct[index].price,
                                weight:
                                    "${productController.favProduct[index].weight}",
                                quantity: 1,
                                color:
                                    productController.favProduct[index].color,
                              ),
                            );
                          })),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
