import 'package:get/get.dart';
import 'package:tawseel/Views/Auth/login_screen.dart';
import 'package:tawseel/Views/Auth/onBoarding_screen.dart';
import 'package:tawseel/Views/Auth/otp_screen.dart';
import 'package:tawseel/Views/Auth/register_screen.dart';
import 'package:tawseel/Views/Auth/resetpass_screen.dart';
import 'package:tawseel/Views/Auth/welcome_screen.dart';
import 'package:tawseel/Views/Home/cart_screen.dart';
import 'package:tawseel/Views/Home/cat_screen.dart';
import 'package:tawseel/Views/Home/product_screen.dart';
import 'package:tawseel/Views/Home/root_screen.dart';
import 'package:tawseel/Views/Home/stores_screen.dart';
import '../Services/middleware.dart';
import '../Views/Auth/intro_screen.dart';
import '../Views/Auth/splash_screen.dart.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/';
  static String intro = '/intro';
  static String obBoarding = '/onBoarding';
  static String welcome = '/welcome';
  static String login = '/login';
  static String register = '/register';
  static String reset = '/reset';
  static String otp = '/otp';
  static String root = '/root';
  static String stores = '/stores';
  static String cart = '/cart';
  static String cat = '/cat';
  static String product = '/product';
}

List<GetPage<dynamic>> routes = [
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
  GetPage(
    name: Routes.intro,
    page: () => const IntroScreen(),
    middlewares: [MiddleWare()],
  ),
  GetPage(name: Routes.obBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.register, page: () => const RegisterScreen()),
  GetPage(name: Routes.reset, page: () => const ResetPassScreen()),
  GetPage(name: Routes.otp, page: () => const OTPScreen()),
  GetPage(name: Routes.root, page: () => const RootScreen()),
  GetPage(name: Routes.cart, page: () => const CartScreen()),
  GetPage(name: Routes.stores, page: () => const StoresScreen()),
  GetPage(name: Routes.cat, page: () => CatScreen(cat: Get.arguments)),
  GetPage(
      name: Routes.product, page: () => ProductScreen(product: Get.arguments)),
];
