import 'package:equatable/equatable.dart';

import '../../../domain/entity/coin.dart';

abstract class CoinListState extends Equatable {
  const CoinListState();

  @override
  List<Object> get props => [];
}

class CoinListEmpty extends CoinListState {}

class CoinListLoading extends CoinListState {}

class CoinListLoaded extends CoinListState {
  final List<Coin> coinList;

  const CoinListLoaded(this.coinList);

  @override
  List<Object> get props => [coinList];
}

class CoinListError extends CoinListState {
  final String message;

  const CoinListError({required this.message});

  @override
  List<Object> get props => [message];
}