import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../Widgets/intro.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Controllers/User/main_controller.dart';
import '../../../Globals/globals.dart';
import '../../../Util/routes.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../../Widgets/image_button.dart';

class IntroScreen extends GetView<MainController> {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Select Language".tr),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FadeAnimation2(
            1.1,
            Image.asset(
              "assets/images/intro.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    FadeAnimation2(
                      1,
                      Hero(
                        tag: "image",
                        child: Image.asset(
                          logo,
                          height: getProportionateScreenHeight(300),
                          width: getProportionateScreenWidth(300),
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(70)),
                    FadeAnimation2(
                      1.1,
                      ScreenTitle(text: "AppName".tr),
                    ),
                    FadeAnimation(
                      1.2,
                      BodyText(text: "WelcomeText".tr),
                    ),
                    Gap(getProportionateScreenWidth(70)),
                    FadeAnimation(
                      1.3,
                      ImageButton(
                        text: "العربيه       ",
                        image: "assets/images/saudi.png",
                        press: () {
                          GetStorage().write("intro", "1");
                          controller.changeLang("ar");
                          Get.offAllNamed(Routes.obBoarding);
                        },
                      ),
                    ),
                    Gap(getProportionateScreenWidth(20)),
                    FadeAnimation(
                      1.4,
                      ImageButton(
                        text: "English",
                        image: "assets/images/english.png",
                        press: () {
                          GetStorage().write("intro", '1');
                          controller.changeLang("en");
                          Get.offAllNamed(Routes.obBoarding);
                        },
                      ),
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
