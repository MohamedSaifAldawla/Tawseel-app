import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tawseel/Globals/globals.dart';
import 'package:tawseel/Util/theme.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Util/size_config.dart';
import '../../../Widgets/inputField.dart';
import '../../../Widgets/intro.dart';
import '../../../Widgets/lang_dialog.dart';
import '../../../Widgets/profile_item.dart';
import '../../../Widgets/theme_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile".tr),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Gap(getProportionateScreenWidth(10)),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenWidth(150),
                      child: FadeAnimation(
                        1,
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? kPrimaryLightColor
                                  : kPrimaryDark3Color,
                          backgroundImage: const AssetImage(
                              "assets/images/FullSizeRender.JPG"),
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(20)),
                    FadeAnimation(
                      1.1,
                      BodyText(
                        text: "Mohamed Saif",
                        weight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(25)),
                    FadeAnimation(
                      1.2,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: [
                            BodyText(
                              text: "Account".tr,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(20)),
                    FadeAnimation(
                      1.3,
                      InputField(
                        label: "Phone".tr,
                        hint: "0123588984".tr,
                        icon: "assets/icons/Phone.svg",
                        obscureText: false,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(getProportionateScreenWidth(3)),
                    FadeAnimation(
                      1.4,
                      InputField(
                        label: "Address".tr,
                        hint: "Khartoum, 60 Street".tr,
                        icon: "assets/icons/Location.svg",
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Gap(getProportionateScreenWidth(30)),
                    FadeAnimation(
                      1.5,
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: [
                            BodyText(
                              text: "General settings".tr,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(getProportionateScreenWidth(5)),
                    FadeAnimation(
                      1.7,
                      ProfileItem(
                        firstIcon: "assets/icons/lang.svg",
                        title: "Language".tr,
                        onTap: (() => langDialog(
                              context: context,
                              onTap1: () {
                                mainController.changeLang("en");
                                Get.back();
                              },
                              onTap2: () {
                                mainController.changeLang("ar");
                                Get.back();
                              },
                            )),
                      ),
                    ),
                    FadeAnimation(
                      1.8,
                      ProfileItem(
                        firstIcon: "assets/icons/night.svg",
                        title: "Night mode".tr,
                        onTap: (() => themeDialog(
                              context: context,
                              onTap1: () {
                                mainController.changeTheme(true);
                                Get.back();
                              },
                              onTap2: () {
                                mainController.changeTheme(false);
                                Get.back();
                              },
                            )),
                      ),
                    ),
                    FadeAnimation(
                      1.9,
                      ProfileItem(
                        firstIcon: "assets/icons/Info.svg",
                        title: "Help center".tr,
                      ),
                    ),
                    FadeAnimation(
                      2,
                      ProfileItem(
                        firstIcon: "assets/icons/appRate.svg",
                        title: "Rate the app".tr,
                      ),
                    ),
                    FadeAnimation(
                      2.1,
                      ProfileItem(
                        firstIcon: "assets/icons/delete.svg",
                        title: "Delete account".tr,
                      ),
                    ),
                    FadeAnimation(
                      2.1,
                      ProfileItem(
                          firstIcon: lang == "en"
                              ? "assets/icons/log.svg"
                              : "assets/icons/logar.svg",
                          title: "Log out".tr),
                    ),
                    Gap(getProportionateScreenWidth(100)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
