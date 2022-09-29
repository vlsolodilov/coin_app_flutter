import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/get_coin_detail_usecase.dart';
import 'coin_detail_event.dart';
import 'coin_detail_state.dart';

class CoinDetailBloc extends Bloc<CoinDetailEvent, CoinDetailState> {
  final GetCoinDetailUseCase getCoinDetailUseCase;

  CoinDetailBloc({required this.getCoinDetailUseCase})
      : super(CoinDetailLoading()) {
    on<LoadCoinDetail>(_onEvent);
  }

  FutureOr<void> _onEvent(
      LoadCoinDetail event,
      Emitter<CoinDetailState> emit
      ) async {
    emit(CoinDetailLoading());
    final failureOrCoinList = await getCoinDetailUseCase(event.id);
    emit(failureOrCoinList.fold((failure) => CoinDetailError(),
        (coinDetail) => CoinDetailLoaded(coinDetail)));
  }
}
