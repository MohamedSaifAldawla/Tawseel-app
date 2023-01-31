import 'package:get/get.dart';

class Localization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //----------------------------------- Auth Pages -------------------------//
          "Select Language": "Select Language",
          "AppName": "Tawseel",
          "Welcome": "Welcome",
          "WelcomeText": "Welcome to Tawseel App \nLet's book your order",
          "Please Enter your user name": "Please Enter your user name",
          "Please Enter your Phone": "Please enter your Phone",
          "Please Enter your address": "Please Enter your address",
          "Phone number is too short": "Phone number is too short from 10",
          "Please Enter your password": "Please enter your password",
          "Please Re-Enter your password": "Please Re-Enter your password",
          "Password is too short":
              "Password is too short must bee\n at least 8 digits",
          "Password did not matched": "Password did not matched",
          "Reset Password": "Reset Password",
          //--------------------------- OnBoarding --------------//
          "Skip": "Skip",
          "Onboarding1": "Mall",
          "Onboarding2": "Shopping",
          "Onboarding3":
              "Now you can shop and order all your family supplies at any time and from anywhere without going to super market",
          "Onboarding4": "Fastest",
          "Onboarding5": "Delivery",
          "Onboarding6":
              "Your order will be received and dispatched immediately by our best and fastest delivery",

          //--------------------------- Welcome --------------//
          "Login": "Login",
          "Register": "Register",
          "Delivery account": "Delivery account",
          "Extra income":
              "Or make extra income and start delivery and register now",

          //--------------------------- Login --------------//
          "Login2": "Login",
          "Log in to your account":
              "Log in to your account to place your orders",
          "Phone": "Phone number",
          "Password": "Password",
          "Remember me": "Remember me",
          "Forgot Password": "Forgot Password ?",

          //--------------------------- Register --------------//
          "Register2": "Register",
          "Enter the data below":
              "Enter the data below and agree to the conditions for creating an account",
          "User name": "User name",
          "Address": "Address",
          "Re-Enter password": "Re-Enter password",

          //--------------------------- Reset Pass --------------//
          "Reset Pass Body":
              "Please enter your phone number and \n we will send you reset code",
          "Continue": "Continue",

          //--------------------------- OTP --------------//
          "Verification code": "Verification code",
          "OTP Verification": "OTP Verification",
          "Verification body": "We texted you a code please enter it below",

          //--------------------------- Home --------------//
          "Home": "Home",
          "Orders": "Orders",
          "Cart": "Cart",
          "Fav": "Favorites",
          "Profile": "Profile",
          "Choose store": "Choose store",
          "PromoTitle": "at the end of the year",
          "PromoBody":
              "Get a discount on your purchases during the day from Al-Anfal Al-Manshia branch, and fast delivery",
          "Order now": "Order now",
          "Categories": "Categories",
          "Popular": "Popular",
          "SDG": "SDG",
          "K": "K",

          //--------------------------- Profile --------------//
          "Account": "Account",
          "General settings": "General settings",
          "Language": "Language",
          "Night mode": "Night mode",
          "Dark": "Dark",
          "Light": "Light",
          "Help center": "Help center",
          "Rate the app": "Rate the app",
          "Delete account": "Delete account",
          "Log out": "Log out",

          //--------------------------- Cart --------------//
          "Add to cart": "Add to cart",
          "Added successfully": "Added successfully",
          "Item already in cart": "Item already in cart",
          "Total items": "Total items",
          "Delivery": "Delivery",
          "Total invoice": "Total invoice",
          "Confirm": "Confirm order",
          "no items in cart": "There is no items in the cart",

          //----------------------------------- Other Page -------------------------//
          "Maintenance": "Sorry the app is under maintenance",
          "No connection":
              "No internet, Please check your cellular data or wifi connection and restart the app",
          "Restart app": "Restart app",
          "Redeem account": "Redeem account",
          "Successful": "Completed Successfully",
          "Error": "Error",
          "Success": "Success",
        },
        'ar': {
          //----------------------------------- Auth Pages -------------------------//
          "Select Language": "أختيار اللغة",
          "AppName": "توصيل",
          "Welcome": "مرحبا بك",
          "WelcomeText": "مرحبا بك في تطبيق توصيل \n هيا بنا لحجز منتجاتك",
          "Please Enter your user name": "الرجاء إدخال إسم المستخدم",
          "Please Enter your Phone": "الرجاء قم بإدخال رقم هاتفك",
          "Phone number is too short": "رقم الهاتف اقل من 10",
          "Please Enter your address": "الرجاء إدخال العنوان",
          "Please Enter your password": "الرجاء إدخال كلمة المرور",
          "Please Re-Enter your password": "الرجاء قم بتأكيد كلمة المرور",
          "Password is too short": "كلمة المرور يجب ان تكون علي الأقل 8 أحرف",
          "Password did not matched": "كلمة المرور غير متطابقه",
          "Reset Password": "إستعادة كلمة المرور",

          //--------------------------- OnBoarding --------------//
          "Skip": "تخطي",
          "Onboarding1": "مول",
          "Onboarding2": "للتسوق",
          "Onboarding3":
              "الأن يمكنك التسوق و طلب كل ما تحتاج من مستلزماتك الأسرية في آي وقت ومن آي مكان دون الذهاب الى السوبر ماركت",
          "Onboarding4": "توصيل",
          "Onboarding5": "سريع",
          "Onboarding6":
              "سيتم استلام طلبك وارساله على الفور عن طريق التوصيل الأفضل والأسرع لدينا",

          //--------------------------- Welcome --------------//
          "Login": "تسجيل دخول",
          "Register": "إنشاء حساب جديد",
          "Delivery account": "حساب توصيل",
          "Extra income": "او حقق دخل اضافي وابدا التوصيل وسجل الأن",

          //--------------------------- Login --------------//
          "Login2": "دخول",
          "Log in to your account": "قم بالدخول لحسابك لإختيار طلباتك",
          "Phone": "رقم الهاتف ",
          "Password": "كلمة المرور",
          "Remember me": "حفظ بيانات الدخول",
          "Forgot Password": "نسيت كلمة المرور ؟",

          //--------------------------- Register --------------//
          "Register2": "انشاء حساب",
          "Enter the data below":
              "قم بإدخال البيانات ادناه والموافقه على الشروط لإنشاء الحساب",
          "User name": "اسم المستخدم",
          "Address": "مكان السكن",
          "Re-Enter password": "إعادة كلمة المرور",

          //--------------------------- Reset Pass --------------//
          "Reset Pass Body":
              "الرجاء إدخال رقم الهاتف وسوف نقوم بإرسال رابط لإستعادة كلمة المرور",
          "Continue": "تأكيد",

          //--------------------------- OTP --------------//
          "OTP Verification": "التحقق",
          "Verification code": "رمز التحقق",
          "Verification body":
              "لقد ارسلنا اليك رساله نصيه في رقم هاتفك الرجاء إدخاله في الأسفل",

          //--------------------------- Home --------------//
          "Home": "الرئيسيه",
          "Orders": "طلباتي",
          "Cart": "سله المشتريات",
          "Fav": "المفضله",
          "Profile": "صفحتي الشخصية",
          "Choose store": "إختيار المتجر",
          "PromoTitle": "تخفيضات اخر السنة",
          "PromoBody":
              "احصل على تخفيض على مشترياتك خلال اليوم من الانفال فرع المنشية وتوصيل سريع",
          "Order now": "اطلب الأن",
          "Categories": "التصنيفات",
          "Popular": "الأكثر طلبآ",
          "SDG": "ج",
          "K": "ك",

          //--------------------------- Profile --------------//
          "Account": "الحساب",
          "General settings": "الإعدادات العامة",
          "Language": "اللغة",
          "Night mode": "المظهر الليلي",
          "Dark": "الوضع الليلي",
          "Light": "الوضع الطبيعي",
          "Help center": "مركز المساعده",
          "Rate the app": "تقييم التطبيق",
          "Delete account": "حذف الحساب",
          "Log out": "خروج من التطبيق",

          //--------------------------- Cart --------------//
          "Add to cart": "اضف الى السلة",
          "Added successfully": "تم إضافة المنتج للسله",
          "Item already in cart": "هذا المنتج موجود مسبقآ",
          "Total items": "مجموع المشتريات",
          "Delivery": "التوصيل",
          "Total invoice": "مجموع الفاتورة",
          "Confirm": "تأكيد الطلبية",
          "no items in cart": "لا توجد منتجات في سله المشتريات",

          //----------------------------------- Other Page -------------------------//
          "Maintenance": "عذرآ التطبيق في وضع الصيانه",
          "No connection":
              "عذرا لايوجد هناك إتصال بالأنترنت ,قم بمراجعه الإتصال وإعاده تشغيل التطبيق",
          "Restart app": "إعاده تشغيل التطبيق",
          "Redeem account": "إستعاده الحساب",
          "Successful": "نجاح",
          "Error": "خطأ",
          "Success": "نجحت العملية",
        },
      };
}
