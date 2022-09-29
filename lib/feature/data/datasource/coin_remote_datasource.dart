import 'dart:convert';
import 'dart:developer';
import 'package:coin_app_flutter/feature/data/model/coin_detail_dto.dart';
import 'package:coin_app_flutter/feature/data/model/coin_dto.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/exception.dart';

abstract class CoinRemoteDataSource {
  Future<List<CoinDto>> getCoinList(String currency);
  Future<CoinDetailDto> getCoinDetail(String id);
}

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CoinDto>> getCoinList(String currency) async {
    final response = await client.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=30&page=1&sparkline=false'),
        headers: {'Content-Type': 'application/json'}
    );
    log('CoinRemoteDataSourceImpl getCoinList');
    if (response.statusCode == 200) {
      final coinList = json.decode(response.body);
      return (coinList as List)
          .map((coin) => CoinDto.fromJson(coin))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CoinDetailDto> getCoinDetail(String id) async {
    final response = await client.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/$id?localization=false&tickers=false&market_data=false&community_data=false'),
        headers: {'Content-Type': 'application/json'}
    );
    if (response.statusCode == 200) {
      final coinDetail = json.decode(response.body);
      return CoinDetailDto.fromJson(coinDetail);
    } else {
      throw ServerException();
    }
  }
}