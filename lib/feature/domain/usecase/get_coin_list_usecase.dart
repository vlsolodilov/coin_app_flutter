import 'package:coin_app_flutter/core/error/failure.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin.dart';
import 'package:coin_app_flutter/feature/domain/repository/coin_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinListUseCase {
  final CoinRepository coinRepository;

  GetCoinListUseCase(this.coinRepository);

  Future<Either<Failure, List<Coin>>> call(Currency currency) async {
    return await coinRepository.getCoinList(currency);
  }
}