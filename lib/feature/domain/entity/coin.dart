import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String id;
  final String image;
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChangePercentage;
  final Currency currency;

  const Coin({
    required this.id,
    required this.image,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercentage,
    required this.currency,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        symbol,
        currentPrice,
        priceChangePercentage,
        currency,
      ];
}

enum Currency {
  usd("\$"),
  eur("\u20AC");

  const Currency(this.icon);

  final String icon;
}
