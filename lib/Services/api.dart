import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GET;

class Api {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://app.nileclub.net/NileClubAPI/APIV4',
      receiveDataWhenStatusError: true,
    ),
  );

  //--------------------- initializeInterceptors --------------------------//
  static void initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var headers = {
            'accept': 'application/json',
            'content-Type': 'application/x-www-form-urlencoded',
            //'Authorization': 'Bearer ${token}',
          };
          request.headers.addAll(headers);
          debugPrint('${request.method} ${request.path}');
          debugPrint('${request.headers}');
          return handler.next(request); //continue
        },
        onResponse: (response, handler) {
          //debugPrint(response.data);
          //   final Map res = json.decode(response.data);
          //   print(res);

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          if (GET.Get.isDialogOpen == true) {
            GET.Get.back();
          }
          if (e.error is SocketException) {
            GET.Get.snackbar(
              'Erorr',
              'Connection lost'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          } else if (e.error is HttpException) {
            GET.Get.snackbar(
              'Erorr',
              'Bad Connection'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          } else if (e.type == DioErrorType.connectTimeout) {
            GET.Get.snackbar(
              'Erorr',
              'Connection time out'.tr,
              //'${e.error.message}',
              icon: SvgPicture.asset(
                "assets/icons/Close.svg",
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              borderRadius: 20,
              duration: const Duration(seconds: 5),
              snackPosition: GET.SnackPosition.TOP,
              backgroundColor: const Color(0xFFE84C5C),
              colorText: Colors.white,
              dismissDirection: DismissDirection.horizontal,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }

          throw e.error;
        },
      ),
    );
  } // end of initializeInterceptor

//--------------------- User Operations --------------------------//
//--------------------- Login --------------------------//

  static Future<Response> login({loginData}) async {
    FormData formData = FormData.fromMap(loginData);
    return dio.post('/login', data: formData);
  } //end of login

//--------------------- Register --------------------------//

  static Future<Response> register({registerData}) async {
    FormData formData = FormData.fromMap(registerData);
    return dio.post('/registration', data: formData);
  } //end of register

} //end of api
