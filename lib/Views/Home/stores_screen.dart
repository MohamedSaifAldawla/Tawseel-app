import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawseel/Views/Home/root_screen.dart';
import '../../Animations/FadeAnimation.dart';
import '../../Globals/globals.dart';
import '../../Util/size_config.dart';
import '../../Util/theme.dart';
import '../../Widgets/store_item.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Choose store".tr),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          FadeAnimation2(
            1.1,
            Image.asset(
              "assets/images/intro3.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(
                right: horizontalPadding,
                left: horizontalPadding,
                top: 130,
                bottom: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    FadeAnimation(
                      1.1,
                      Hero(
                        tag: "image",
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: getProportionateScreenHeight(100),
                          width: getProportionateScreenWidth(100),
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: storeController.store.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: getProportionateScreenWidth(190),
                        mainAxisSpacing: getProportionateScreenWidth(10),
                        crossAxisSpacing: getProportionateScreenWidth(10),
                      ),
                      itemBuilder: (context, index) {
                        return FadeAnimation(
                          1.3,
                          GestureDetector(
                            onTap: () {
                              mainController.currentIndex.value = 0;
                              storeController.title =
                                  storeController.store[index].name;
                              Get.to(() => const RootScreen(),
                                  transition: Transition.fadeIn);
                            },
                            child: StoreItem(
                                name: "${storeController.store[index].name}",
                                img: "${storeController.store[index].image}"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
