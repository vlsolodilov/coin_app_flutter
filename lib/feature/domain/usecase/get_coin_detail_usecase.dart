import 'package:coin_app_flutter/core/error/failure.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin_detail.dart';
import 'package:coin_app_flutter/feature/domain/repository/coin_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinDetailUseCase {
  final CoinRepository coinRepository;

  GetCoinDetailUseCase(this.coinRepository);

  Future<Either<Failure, CoinDetail>> call(String id) async {
    return await coinRepository.getCoinDetail(id);
  }
}