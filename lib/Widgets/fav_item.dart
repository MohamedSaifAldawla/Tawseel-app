import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Util/size_config.dart';

// ignore: must_be_immutable
class FavItem extends StatelessWidget {
  FavItem({
    Key? key,
    required this.isFav,
    required this.onTap,
  }) : super(key: key);

  String isFav;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(10),
      ),
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 48, 139, 133),
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(50),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          isFav == "true"
              ? "assets/icons/fav.svg"
              : "assets/icons/favorite.svg",
        ),
      ),
    );
  }
}
