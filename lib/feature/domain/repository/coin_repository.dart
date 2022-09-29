import 'package:coin_app_flutter/feature/domain/entity/coin.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin_detail.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class CoinRepository{
  Future<Either<Failure, List<Coin>>> getCoinList(Currency currency);
  Future<Either<Failure, CoinDetail>> getCoinDetail(String id);
}