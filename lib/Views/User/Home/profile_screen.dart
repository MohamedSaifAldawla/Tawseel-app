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
import '../../../Widgets/profile_item.dart';

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
                        onTap: (() => langThemeDialog(
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

  langThemeDialog(
      {required context,
      required Function()? onTap1,
      required Function()? onTap2}) {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        ),
        child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(5),
              right: getProportionateScreenWidth(5),
              bottom: getProportionateScreenWidth(10)),
          width: double.infinity,
          height: getProportionateScreenWidth(180),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/Close2.svg",
                      color: error,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTap1,
                    child: Container(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? shadow
                                    : shadow2,
                            blurRadius: 20.0,
                            offset: const Offset(0, 8),
                            blurStyle: BlurStyle.normal,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/english.png",
                            height: getProportionateScreenHeight(60),
                            width: getProportionateScreenWidth(60),
                          ),
                          Gap(getProportionateScreenWidth(10)),
                          BodyText(
                            text: "English".toUpperCase(),
                            weight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kTextColor
                                    : kPrimaryLightColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(getProportionateScreenWidth(40)),
                  GestureDetector(
                    onTap: onTap2,
                    child: Container(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? shadow
                                    : shadow2,
                            blurRadius: 20.0,
                            offset: const Offset(0, 8),
                            blurStyle: BlurStyle.normal,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/saudi.png",
                            height: getProportionateScreenHeight(60),
                            width: getProportionateScreenWidth(60),
                          ),
                          Gap(getProportionateScreenWidth(10)),
                          BodyText(
                            text: "العربيه".toUpperCase(),
                            weight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kTextColor
                                    : kPrimaryLightColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
