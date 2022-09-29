class CoinDetailDto {
  final String name;
  final String image;
  final String description;
  final String category;

  const CoinDetailDto({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
  });

  factory CoinDetailDto.fromJson(Map<String, dynamic> json) {
    return CoinDetailDto(
      name: json['name'] as String,
      image: json['image'] != null
          ? ImageDto.fromJson(json['image']).large
          : '',
      description: json['description'] != null
          ? DescriptionDto.fromJson(json['description']).en
          : '',
      category: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
          .join(', '),
    );
  }
}

class DescriptionDto {
  final String en;

  const DescriptionDto({required this.en});

  factory DescriptionDto.fromJson(Map<String, dynamic> json) {
    return DescriptionDto(en: json['en'] as String);
  }
}

class ImageDto {
  final String large;

  const ImageDto({required this.large});

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(large: json['large'] as String);
  }
}
