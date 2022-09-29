import 'package:coin_app_flutter/core/error/exception.dart';
import 'package:coin_app_flutter/core/error/failure.dart';
import 'package:coin_app_flutter/feature/data/datasource/coin_remote_datasource.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin_detail.dart';
import 'package:coin_app_flutter/feature/domain/repository/coin_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/platform/network_info.dart';
import '../mapper/coin_mapper.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinRemoteDataSource coinRemoteDataSource;
  final CoinMapper coinMapper;
  final NetworkInfo networkInfo;

  CoinRepositoryImpl({
    required this.coinRemoteDataSource,
    required this.coinMapper,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Coin>>> getCoinList(Currency currency) async {
    if (await networkInfo.isConnected) {
      try {
        final coinListDto = await coinRemoteDataSource.getCoinList(currency.name);
        return Right(coinListDto
            .map((coinDto) => coinMapper.mapCoinDtoToCoin(coinDto, currency))
            .toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }

  }

  @override
  Future<Either<Failure, CoinDetail>> getCoinDetail(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final coinDetailDto = await coinRemoteDataSource.getCoinDetail(id);
        return Right(coinMapper.mapCoinDetailDtoToCoinDetail(coinDetailDto));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
