import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Models/cart.dart';
import 'package:tawseel/Models/product.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Util/theme.dart';
import '../../Animations/FadeAnimation.dart';
import '../../Widgets/fav_item.dart';
import '../../Widgets/intro.dart';
import '../../Widgets/primary_button.dart';
import '../../Widgets/quantity_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("${product.name}"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
            vertical: getProportionateScreenWidth(10)),
        child: PrimaryButton2(
          text: "Add to cart".tr,
          press: (() {
            productController.addToCart(
              Cart(
                id: product.id,
                name: "${product.name}",
                image: "${product.image}",
                price: product.price,
                weight: "${product.weight}",
                quantity: productController.counter.value,
                color: product.color,
              ),
            );
          }),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: getProportionateScreenWidth(50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenWidth(350),
                decoration: BoxDecoration(
                  color: Color(product.color!),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getProportionateScreenWidth(80),
                      ),
                      child: Center(
                        child: Hero(
                          tag: "${product.id}",
                          child: Image.asset(
                            '${product.image}',
                            width: getProportionateScreenWidth(200),
                            height: getProportionateScreenWidth(200),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenWidth(325),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        child: FadeAnimation2(
                          1,
                          FavItem(
                            isFav: "${product.isFav}",
                            onTap: (() {}),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(getProportionateScreenWidth(50)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: FadeAnimation2(
                  1.1,
                  BodyText(
                    text: "${product.name}",
                    fontSize: getProportionateScreenWidth(30),
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(getProportionateScreenWidth(15)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: FadeAnimation(
                  1.2,
                  NormalBodyText(
                    text: "${product.disc}",
                    fontSize: getProportionateScreenWidth(14),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Gap(getProportionateScreenWidth(15)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: FadeAnimation(
                  1.3,
                  Obx(
                    () => Row(
                      children: [
                        QuantityItem(
                            quantity: "${productController.counter.value}",
                            plusTap: () {
                              productController.increment();
                            },
                            minusTap: () {
                              productController.decrement();
                            }),
                        const Spacer(),
                        BodyText(
                          text:
                              "${product.price} ${'SDG'.tr} / ${product.weight}",
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
