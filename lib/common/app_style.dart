import 'package:coin_app_flutter/common/app_color.dart';
import 'package:flutter/cupertino.dart';

class AppStyle {
  static const regularText = TextStyle(
    color: AppColor.gray,
    fontSize: 16,
    fontFamily: 'Plus Jakarta Sans',
  );

  static const secondaryText = TextStyle(
    color: AppColor.secondary_text_color,
    fontSize: 14,
    fontFamily: 'Plus Jakarta Sans',
  );

  static const titleText = TextStyle(
    color: AppColor.black,
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static const regularText2 = TextStyle(
    color: AppColor.black,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
  static const titleText2 = TextStyle(
    color: AppColor.black,
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static const buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColor.white,
  );
}
