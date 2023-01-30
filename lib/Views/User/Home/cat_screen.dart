import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawseel/Models/cat.dart';
import 'package:tawseel/Util/size_config.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Globals/globals.dart';
import '../../../Models/cart.dart';
import '../../../Widgets/product_item.dart';
import 'product_screen.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key, required this.cat});

  final Categories cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cat.title}"),
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
                itemCount: productController.product.length,
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
                                  product: productController.product[index],
                                ),
                            transition: Transition.fadeIn);
                      },
                      child: ProductItem(
                          id: productController.product[index].id!,
                          name: "${productController.product[index].name}",
                          contColor: productController.product[index].color!,
                          price: productController.product[index].price!,
                          img: "${productController.product[index].image}",
                          isFav: productController.product[index].isFav!,
                          weight: "${productController.product[index].weight}",
                          favTap: (() {}),
                          onTap: (() {
                            productController.addToCart(
                              Cart(
                                id: productController.product[index].id,
                                name:
                                    "${productController.product[index].name}",
                                image:
                                    "${productController.product[index].image}",
                                price: productController.product[index].price,
                                weight:
                                    "${productController.product[index].weight}",
                                quantity: 1,
                                color: productController.product[index].color,
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
