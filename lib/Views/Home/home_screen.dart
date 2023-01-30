import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Util/size_config.dart';
import 'package:tawseel/Views/Home/cat_screen.dart';
import 'package:tawseel/Views/Home/product_screen.dart';
import '../../Animations/FadeAnimation.dart';
import '../../Models/cart.dart';
import '../../Widgets/cat_item.dart';
import '../../Widgets/intro.dart';
import '../../Widgets/product_item.dart';
import '../../Widgets/promo_widget.dart';
import '../../Widgets/sections.title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/Location.svg",
              width: getProportionateScreenWidth(20),
              height: getProportionateScreenWidth(20),
            ),
            Gap(getProportionateScreenWidth(5)),
            BodyText(
              text: storeController.title!,
              weight: FontWeight.bold,
            ),
          ],
        ),
        // backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              width: getProportionateScreenWidth(15),
              height: getProportionateScreenWidth(15),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const FadeAnimation2(
              1,
              Promo(),
            ),
            Gap(getProportionateScreenWidth(26)),
            FadeAnimation2(
              1.1,
              IconSectionsTitle(
                title: "Categories".tr,
                icon: lang == "en"
                    ? "assets/icons/Arrow.svg"
                    : "assets/icons/Arrow_Right.svg",
                onTap: () {},
              ),
            ),
            Container(
              padding: lang == "en"
                  ? EdgeInsets.only(left: getProportionateScreenWidth(18))
                  : EdgeInsets.only(right: getProportionateScreenWidth(18)),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: getProportionateScreenWidth(100),
                      child: FadeAnimation3(
                        2,
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: catController.cat.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => CatScreen(
                                        cat: catController.cat[index],
                                      ),
                                  transition: Transition.fadeIn);
                            },
                            child: CatItem(
                              icon: '${catController.cat[index].image}',
                              title: '${catController.cat[index].title}',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(getProportionateScreenWidth(10)),
            FadeAnimation(
              1.2,
              IconSectionsTitle(
                title: "Popular".tr,
                icon: lang == "en"
                    ? "assets/icons/Arrow.svg"
                    : "assets/icons/Arrow_Right.svg",
                onTap: () {},
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
              ),
              shrinkWrap: true,
              itemCount: productController.product.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: getProportionateScreenWidth(165),
                mainAxisSpacing: getProportionateScreenWidth(10),
                crossAxisSpacing: getProportionateScreenWidth(5),
              ),
              itemBuilder: (context, index) {
                return FadeAnimation(
                  1.3,
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
                      onTap: (() => {
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
                            ),
                          }),
                      favTap: (() {}),
                    ),
                  ),
                );
              },
            ),
            Gap(getProportionateScreenWidth(100)),
          ],
        ),
      ),
    );
  }
}
