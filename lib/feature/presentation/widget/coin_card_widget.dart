import 'package:coin_app_flutter/common/app_color.dart';
import 'package:coin_app_flutter/common/app_style.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin.dart';
import 'package:coin_app_flutter/feature/presentation/screen/coin_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinCardWidget extends StatelessWidget {
  final Coin coin;

  const CoinCardWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoinDetailScreen(
                    coinId: coin.id,
                    coinName: coin.name,
                ),
            )
        );
      },
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Image.network(coin.image),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    coin.name,
                    style: AppStyle.regularText,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    coin.symbol.toUpperCase(),
                    style: AppStyle.secondaryText,
                  )
                ]
              ),
            ),
            Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    _formatPrice(coin.currentPrice, coin.currency),
                    style: AppStyle.regularText,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  _textPriceChange(coin.priceChangePercentage),
                ]
            ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price, Currency currency) {
    final NumberFormat format = NumberFormat('#,##0.00', 'en_US');
    return '${currency.icon} ${format.format(price)}';
  }

  Text _textPriceChange(double value) {
    final NumberFormat format = NumberFormat('#0.00', 'en_US');
    final Color color;
    final String sign;
    if (value >= 0) {
      color = AppColor.green;
      sign = '+';
    } else {
      color = AppColor.red;
      sign = '';
    }
    return Text(
      '$sign${format.format(value)}%',
      style: AppStyle.secondaryText.copyWith(
        color: color,
      ),
    );
  }
}
