class CoinDto {
  final String id;
  final String image;
  final String name;
  final String symbol;
  final num currentPrice;
  final num priceChangePercentage;

  const CoinDto({
    required this.id,
    required this.image,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercentage,
  });

  factory CoinDto.fromJson(Map<String, dynamic> json) {
    return CoinDto(
        id: json['id'] as String,
        image: json['image'] as String,
        name: json['name'] as String,
        symbol: json['symbol'] as String,
        currentPrice: json['current_price'] as num,
        priceChangePercentage: json['price_change_percentage_24h'] as num,
    );
  }
}