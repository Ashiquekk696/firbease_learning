import 'package:flutter/rendering.dart';

import 'app_colors.dart';

class AppStyles {
  largeText({color, fontWeight}) {
    var largeText = TextStyle(
        fontSize: 25.5,
        color: color ??
            Color(
              AppColors.naviBlueColor,
            ),
        fontWeight: fontWeight ?? FontWeight.w500);
    return largeText;
  }

  mediumText({color, fontWeight}) {
    var mediumText = TextStyle(
        fontSize: 15,
        color: color ??
            Color(
              AppColors.naviBlueColor,
            ),
        fontWeight: fontWeight ?? FontWeight.w400);
    return mediumText;
  }

  mediumSmallText({color, fontWeight}) {
    var smallText = TextStyle(
        fontSize: 15,
        color: color ??
            Color(
              AppColors.naviBlueColor,
            ),
        fontWeight: fontWeight ?? FontWeight.w400);
    return smallText;
  }

  smallText({color, fontWeight}) {
    var smallText = TextStyle(
        fontSize: 13,
        color: color ??
            Color(
              AppColors.naviBlueColor,
            ),
        fontWeight: fontWeight ?? FontWeight.w300);
    return smallText;
  }

  verySmallText({color, fontWeight}) {
    var verySmallText = TextStyle(
        fontSize: 12,
        color: color ??
            Color(
              AppColors.naviBlueColor,
            ),
        fontWeight: fontWeight ?? FontWeight.w300);
    return verySmallText;
  }
}
