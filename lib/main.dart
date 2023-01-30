import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'Controllers/User/main_controller.dart';
import 'Globals/globals.dart';
import 'Services/api.dart';
import 'Util/routes.dart';
import 'Util/theme.dart';
import 'localization.dart';

Future<void> main() async {
  //------------- Init variable's ---------------//
  bool result = await InternetConnectionChecker().hasConnection;
  Api.initializeInterceptors();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await init();
  getThemeMode();

  //------------- DeviceOrientation ---------------//
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //------------- Internet Connection ---------------//
  if (result == true) {
    debugPrint('Connected');
    runApp(MyApp());
  } else {
    // await GetStorage().write("Live", null);
    // print("isLive : $isLive");
    debugPrint('No internet :(');
    runApp(MyApp());
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  MainController main = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tawseel App',
      locale: main.language,
      fallbackLocale: const Locale('en'),
      translations: Localization(),
      themeMode: ThemeMode.light,
      theme: theme(),
      darkTheme: themeDark(),
      getPages: routes,
    );
  }
}
