import 'package:coin_app_flutter/feature/domain/entity/coin.dart';
import 'package:equatable/equatable.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinList extends CoinListEvent {
  final Currency currency;

  const LoadCoinList(this.currency);
}