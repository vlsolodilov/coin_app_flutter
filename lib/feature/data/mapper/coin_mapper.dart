import 'package:coin_app_flutter/feature/data/model/coin_detail_dto.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin_detail.dart';

import '../../domain/entity/coin.dart';
import '../model/coin_dto.dart';

class CoinMapper {
   Coin mapCoinDtoToCoin(CoinDto coinDto, Currency currency) {
    return Coin(
        id: coinDto.id,
        image: coinDto.image,
        name: coinDto.name,
        symbol: coinDto.symbol,
        currentPrice: coinDto.currentPrice.toDouble(),
        priceChangePercentage: coinDto.priceChangePercentage.toDouble(),
        currency: currency,
    );
  }
  CoinDetail mapCoinDetailDtoToCoinDetail(CoinDetailDto coinDetailDto) {
     return CoinDetail(
         name: coinDetailDto.name,
         image: coinDetailDto.image,
         description: coinDetailDto.description,
         category: coinDetailDto.category,
     );
  }
}