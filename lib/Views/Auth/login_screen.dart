import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawseel/Views/Auth/resetpass_screen.dart';
import 'package:tawseel/Views/Home/stores_screen.dart';
import 'package:tawseel/Widgets/primary_button.dart';
import '../../Animations/FadeAnimation.dart';
import '../../Globals/globals.dart';
import '../../Util/size_config.dart';
import '../../Util/theme.dart';
import '../../Widgets/form_error.dart';
import '../../Widgets/inputField.dart';
import '../../Widgets/intro.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? phone;
  String? password;

  bool remember = false;
  bool _hidePassword = true;
  final List<String> errors = [];
  final Map<String, dynamic> _loginData = {};

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    loadUserEmailPassword();
    // Future.delayed(Duration(seconds: 1), () async {
    //   Login();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text("Login".tr),
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
                bottom: 20,
              ),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FadeAnimation(
                        1.1,
                        Hero(
                          tag: "image",
                          child: Image.asset(
                            logo,
                            height: getProportionateScreenHeight(100),
                            width: getProportionateScreenWidth(100),
                          ),
                        ),
                      ),
                      Gap(getProportionateScreenWidth(20)),
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
                      Gap(getProportionateScreenWidth(80)),
                      Row(
                        children: [
                          FadeAnimation2(
                            1.4,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: BodyText(
                                text: "Login2".tr,
                                fontSize: getProportionateScreenWidth(32),
                                color: kPrimaryColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(getProportionateScreenWidth(5)),
                      Row(
                        children: [
                          FadeAnimation2(
                            1.5,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child:
                                  BodyText(text: "Log in to your account".tr),
                            ),
                          ),
                        ],
                      ),
                      Gap(getProportionateScreenWidth(30)),
                      FadeAnimation(
                        1.6,
                        InputField(
                          controller: _phoneController,
                          hint: "Phone".tr,
                          icon: "assets/icons/Phone.svg",
                          obscureText: false,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => phone = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(error: "Please Enter your Phone".tr);
                            }
                            if (value!.length >= 10) {
                              removeError(
                                  error: "Phone number is too short".tr);
                            }
                            if (value.isEmpty) {
                              addError(error: "Please Enter your Phone".tr);
                            }

                            if (value.length < 10) {
                              addError(error: "Phone number is too short".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your Phone".tr);
                              return "";
                            } else if (value.length < 10) {
                              addError(error: "Phone number is too short".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenWidth(5)),
                      FadeAnimation(
                        1.6,
                        SuffixInputField(
                          controller: _passwordController,
                          hint: "Password".tr,
                          icon: "assets/icons/Lock.svg",
                          suffixIcon: "assets/icons/Eye.svg",
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => password = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Enter your password".tr);
                            }
                            if (value!.length >= passLength) {
                              removeError(error: "Password is too short".tr);
                            }
                            if (value.isEmpty) {
                              addError(error: "Please Enter your password".tr);
                            }
                            if (value.length < passLength) {
                              addError(error: "Password is too short".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your password".tr);
                              return "";
                            } else if (value.length < passLength) {
                              addError(error: "Password is too short".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenWidth(10)),
                      FadeAnimation(
                        1.8,
                        Row(
                          children: [
                            Checkbox(
                              value: remember,
                              activeColor: kPrimaryColor,
                              onChanged: (value) {
                                setState(
                                  () {
                                    remember = value!;
                                    if (remember == true) {
                                      GetStorage().write('remember', remember);
                                      GetStorage().write(
                                          'phone', _phoneController.text);
                                      GetStorage().write(
                                          'password', _passwordController.text);

                                      debugPrint("$remember");
                                      debugPrint(GetStorage().read("phone"));
                                      debugPrint(GetStorage().read("password"));
                                    } else if (remember == false) {
                                      GetStorage().remove("phone");
                                      GetStorage().remove("password");
                                      GetStorage().remove("remember");
                                      debugPrint("$remember");
                                    }
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: BodyText(
                                text: "Remember me".tr,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: (() => Get.to(
                                  () => const ResetPassScreen(),
                                  transition: Transition.fadeIn)),
                              child: BodyText(
                                text: "Forgot Password".tr,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeAnimation(
                        1.8,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: FormError(errors: errors),
                        ),
                      ),
                      Gap(getProportionateScreenWidth(10)),
                      FadeAnimation(
                        1.9,
                        PrimaryButton(
                          text: "Login2".tr,
                          press: (() {
                            Get.to(() => const StoresScreen(),
                                transition: Transition.fadeIn);
                            // Get.to(() => const RootScreen(),
                            //     transition: Transition.fadeIn);
                            // if (_formKey.currentState!.validate()) {}
                          }),
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

  void loadUserEmailPassword() async {
    try {
      if (await GetStorage().read("remember")) {
        debugPrint("${GetStorage().read("remember")}");
        _phoneController.text = await GetStorage().read("phone");
        _passwordController.text = await GetStorage().read("password");
        setState(() {
          remember = true;
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}
