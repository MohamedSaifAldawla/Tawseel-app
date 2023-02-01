import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Views/User/Auth/register_screen.dart';
import 'package:tawseel/Widgets/primary_button.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Globals/globals.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../../Widgets/intro.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                right: horizontalPadding,
                left: horizontalPadding,
                top: 100,
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
                          logo,
                          height: getProportionateScreenHeight(200),
                          width: getProportionateScreenWidth(200),
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(15)),
                    FadeAnimation(
                      1.2,
                      BodyText(
                        text: "Onboarding1".tr,
                        fontSize: getProportionateScreenWidth(32),
                        color: kPrimary2Color,
                        weight: FontWeight.bold,
                      ),
                    ),
                    FadeAnimation2(
                      1.3,
                      BodyText(
                        text: "Onboarding2".tr,
                        fontSize: getProportionateScreenWidth(25),
                        color: kPrimary2Color,
                      ),
                    ),
                    Gap(getProportionateScreenWidth(120)),
                    FadeAnimation2(
                      1.4,
                      PrimaryButton(
                        text: "Login".tr,
                        press: (() => Get.to(() => const LoginScreen(),
                            transition: Transition.fadeIn)),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(15)),
                    FadeAnimation(
                      1.5,
                      PrimaryButton(
                        text: "Register".tr,
                        color: kPrimary3Color,
                        textcolor: kTextColor,
                        press: (() => Get.to(() => const RegisterScreen(),
                            transition: Transition.fadeIn)),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(40)),
                    FadeAnimation(
                      1.6,
                      BodyText(
                        text: "Extra income".tr,
                        fontSize: getProportionateScreenWidth(12),
                        maxLines: 2,
                      ),
                    ),
                    Gap(getProportionateScreenWidth(20)),
                    FadeAnimation(
                      1.2,
                      PrimaryButton(
                        text: "Delivery account".tr,
                        color: kPrimary2Color,
                        press: (() {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          // const TopBar(
          //     img: "assets/images/logo.png",
          //     text1: "Onboarding1",
          //     text2: "Onboarding2"),
        ],
      ),
    );
  }
}
