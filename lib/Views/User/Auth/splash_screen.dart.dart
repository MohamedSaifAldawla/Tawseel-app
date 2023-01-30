import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Globals/globals.dart';
import '../../../Util/routes.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../../Widgets/intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: splashtime),
      () async {
        Get.offAllNamed(Routes.intro);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: kPrimaryLightColor),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "image",
                  child: Image.asset(
                    logo,
                    height: getProportionateScreenHeight(200),
                    width: getProportionateScreenWidth(220),
                  ),
                ),
                Lottie.asset(
                  'assets/icons/loading.json',
                  width: 250,
                  height: 170,
                  fit: BoxFit.fill,
                ),
                const Gap(100),
                const BodyText(text: "Powered by"),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/2.PNG",
                      width: getProportionateScreenWidth(150),
                    ),
                    // const BodyText(
                    //   text: "NGT information technology",
                    //   color: kPrimaryLightColor,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
State<StatefulWidget> createState() {
  throw UnimplementedError();
}
