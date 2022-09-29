import 'package:equatable/equatable.dart';

abstract class CoinDetailEvent extends Equatable {
  const CoinDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetail extends CoinDetailEvent {
  final String id;

  const LoadCoinDetail(this.id);
}