import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Globals/globals.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../../Widgets/intro.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _thirdController = TextEditingController();
  final _fourthController = TextEditingController();
  String otpCode = "";
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

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
              "assets/images/intro2.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  top: 110,
                  bottom: 20),
              child: Center(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        1.1,
                        Hero(
                          tag: "image",
                          child: Center(
                            child: Image.asset(
                              logo,
                              height: getProportionateScreenHeight(100),
                              width: getProportionateScreenWidth(100),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      FadeAnimation(
                        1.2,
                        Center(
                          child: BodyText(
                            text: "Onboarding1".tr,
                            fontSize: getProportionateScreenWidth(32),
                            color: kPrimary2Color,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FadeAnimation2(
                        1.3,
                        Center(
                          child: BodyText(
                            text: "Onboarding2".tr,
                            fontSize: getProportionateScreenWidth(25),
                            color: kPrimary2Color,
                          ),
                        ),
                      ),
                      const Gap(120),
                      FadeAnimation2(
                        1.4,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BodyText(
                            text: "Verification code".tr,
                            fontSize: getProportionateScreenWidth(32),
                            color: kPrimaryColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(5),
                      FadeAnimation2(
                        1.5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BodyText(
                            text: "Verification body".tr,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const Gap(30),
                      FadeAnimation(
                        1.2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(60),
                              child: TextFormField(
                                controller: _firstController,
                                autofocus: true,
                                focusNode: pin1FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: otpInputDecoration,
                                onChanged: (value) {
                                  nextField(value, pin2FocusNode);
                                },
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(60),
                              child: TextFormField(
                                  controller: _secondController,
                                  focusNode: pin2FocusNode,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: otpInputDecoration,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      pin1FocusNode!.previousFocus();
                                    }
                                    nextField(value, pin3FocusNode);
                                  }),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(60),
                              child: TextFormField(
                                  controller: _thirdController,
                                  focusNode: pin3FocusNode,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 24),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: otpInputDecoration,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      pin2FocusNode!.previousFocus();
                                    }
                                    nextField(value, pin4FocusNode);
                                  }),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(60),
                              child: TextFormField(
                                controller: _fourthController,
                                focusNode: pin4FocusNode,
                                obscureText: true,
                                style: const TextStyle(fontSize: 24),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: otpInputDecoration,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    pin3FocusNode!.previousFocus();
                                  }
                                  if (value.length == 1) {
                                    pin4FocusNode!.unfocus();
                                    otpCode = _firstController.text +
                                        _secondController.text +
                                        _thirdController.text +
                                        _fourthController.text;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
