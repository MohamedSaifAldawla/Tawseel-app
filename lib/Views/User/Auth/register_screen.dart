import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tawseel/Widgets/primary_button.dart';
import '../../../Animations/FadeAnimation.dart';
import '../../../Globals/globals.dart';
import '../../../Util/size_config.dart';
import '../../../Util/theme.dart';
import '../../../Widgets/form_error.dart';
import '../../../Widgets/inputField.dart';
import '../../../Widgets/intro.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? username;
  String? phone;
  String? password;
  String? confirm;

  bool remember = false;

  bool _hidePassword = true;
  final List<String> errors = [];
  Map<String, dynamic> _registerData = {};

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text("Login".tr),
        backgroundColor: kPrimary3Color,
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
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                text: "Register2".tr,
                                fontSize: getProportionateScreenWidth(32),
                                color: kPrimaryColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(getProportionateScreenWidth(5)),
                      FadeAnimation2(
                        1.5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BodyText(
                            text: "Enter the data below".tr,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Gap(getProportionateScreenWidth(30)),
                      FadeAnimation(
                        1.6,
                        InputField(
                          controller: _usernameController,
                          hint: "User name".tr,
                          icon: "assets/icons/Person.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => username = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Enter your user name".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your user name".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your user name".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenWidth(20)),
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
                      Gap(getProportionateScreenWidth(3)),
                      FadeAnimation(
                        1.6,
                        InputField(
                          controller: _usernameController,
                          hint: "Address".tr,
                          icon: "assets/icons/Location.svg",
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => username = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Enter your address".tr);
                            }
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your address".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(error: "Please Enter your address".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Gap(getProportionateScreenWidth(20)),
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
                      Gap(getProportionateScreenWidth(20)),
                      FadeAnimation(
                        1.6,
                        SuffixInputField(
                          controller: _confirmPasswordController,
                          hint: "Re-Enter password".tr,
                          icon: "assets/icons/Lock.svg",
                          suffixIcon: "assets/icons/Eye.svg",
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) => confirm = newValue,
                          onChanged: (value) {
                            if (value == null || value.isNotEmpty) {
                              removeError(
                                  error: "Please Re-Enter your password".tr);
                            }
                            if (value!.length >= passLength) {
                              removeError(
                                  error:
                                      "Confirmation Password is too short".tr);
                            }
                            if (_passwordController.value ==
                                _confirmPasswordController.value) {
                              removeError(error: "Password did not matched".tr);
                            }
                            if (value.isEmpty) {
                              addError(
                                  error: "Please Re-Enter your password".tr);
                            }
                            if (value.length < 8) {
                              addError(
                                  error:
                                      "Confirmation Password is too short".tr);
                            }
                            if (_passwordController.value !=
                                _confirmPasswordController.value) {
                              addError(error: "Password did not matched".tr);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              addError(
                                  error: "Please Re-Enter your password".tr);
                              return "";
                            } else if (value.length < passLength) {
                              addError(
                                  error:
                                      "Confirmation Password is too short".tr);
                              return "";
                            } else if (_passwordController.value !=
                                _confirmPasswordController.value) {
                              addError(error: "Password did not matched".tr);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      FadeAnimation(
                        1.7,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: FormError(errors: errors),
                        ),
                      ),
                      Gap(getProportionateScreenWidth(20)),
                      FadeAnimation(
                        1.8,
                        PrimaryButton(
                          text: "Register2".tr,
                          press: (() {
                            if (_formKey.currentState!.validate()) {}
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
}
