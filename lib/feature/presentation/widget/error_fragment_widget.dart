import 'package:coin_app_flutter/common/app_color.dart';
import 'package:coin_app_flutter/common/app_style.dart';
import 'package:flutter/material.dart';
class ErrorLayoutWidget extends StatelessWidget {
  final VoidCallback pressAction;
  const ErrorLayoutWidget({super.key, required this.pressAction});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/ic_logo.jpg'),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Случилась какая-то ошибка :(\nПопробуем снова?',
                style: AppStyle.secondaryText.copyWith(color: AppColor.black),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: pressAction,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty
                        .all<Color>(AppColor.primary_500),
                  ),
                  child: const Text(
                    'ПОПРОБОВАТЬ',
                    style: AppStyle.buttonText,
                  )
              ),
            ],
          )
      ),
    );
  }
}
