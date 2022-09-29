import 'package:coin_app_flutter/common/app_color.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator() {
  return const Center(
    child: SizedBox(
      height: 44,
      width: 44,
      child: CircularProgressIndicator(
        color: AppColor.primary_500,
      ),
    ),
  );
}