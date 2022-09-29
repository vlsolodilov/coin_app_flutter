import 'package:equatable/equatable.dart';

class CoinDetail extends Equatable {
  final String name;
  final String image;
  final String description;
  final String category;

  const CoinDetail({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        description,
        category,
      ];
}
