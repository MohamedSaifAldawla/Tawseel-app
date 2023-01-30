import 'package:get/get.dart';
import 'package:tawseel/Models/store.dart';

class StoreController extends GetxController {
  String? title;
  List<Store> store = [
    Store(
      id: "1",
      image: "assets/icons/Shop.svg",
      name: "Mall",
    ),
    Store(
      id: "2",
      image: "assets/icons/Hamburger.svg",
      name: "Restaurants",
    ),
    Store(
      id: "3",
      image: "assets/icons/Clinic.svg",
      name: "Pharmacy",
    ),
    Store(
      id: "4",
      image: "assets/icons/Shop.svg",
      name: "Store",
    ),
  ];
}
