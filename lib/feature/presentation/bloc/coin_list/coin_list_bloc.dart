import 'dart:async';

import 'package:coin_app_flutter/feature/domain/usecase/get_coin_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_list/coin_list_state.dart';
import '../../../../core/error/failure.dart';
import 'coin_list_event.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  final GetCoinListUseCase getCoinListUseCase;

  CoinListBloc({required this.getCoinListUseCase}) : super(CoinListEmpty()) {
    on<LoadCoinList>(_onEvent);
  }

  FutureOr<void> _onEvent(
      LoadCoinList event,
      Emitter<CoinListState> emit
      ) async {
    emit(CoinListLoading());
    final failureOrCoinList = await getCoinListUseCase(event.currency);
    emit(failureOrCoinList.fold(
            (failure) => CoinListError(message: _mapFailureToMessage(failure)),
            (coinList) => CoinListLoaded(coinList)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

}