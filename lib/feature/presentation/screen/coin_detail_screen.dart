import 'package:flutter/material.dart';

import '../../../common/app_color.dart';
import '../../../common/app_style.dart';
import '../widget/coin_detail_widget.dart';

class CoinDetailScreen extends StatelessWidget {
  final String coinId;
  final String coinName;

  const CoinDetailScreen(
      {super.key, required this.coinId, required this.coinName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinName,
          style: AppStyle.titleText,
        ),
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CoinDetailWidget(coinId: coinId),
    );
  }
}
