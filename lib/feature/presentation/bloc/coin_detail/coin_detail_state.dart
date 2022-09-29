import 'package:equatable/equatable.dart';

import '../../../domain/entity/coin_detail.dart';

abstract class CoinDetailState extends Equatable {
  const CoinDetailState();

  @override
  List<Object> get props => [];
}

class CoinDetailLoading extends CoinDetailState {}

class CoinDetailLoaded extends CoinDetailState {
  final CoinDetail coinDetail;

  const CoinDetailLoaded(this.coinDetail);

  @override
  List<Object> get props => [coinDetail];
}

class CoinDetailError extends CoinDetailState {}