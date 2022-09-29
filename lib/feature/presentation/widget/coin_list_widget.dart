import 'dart:developer';

import 'package:coin_app_flutter/feature/presentation/bloc/coin_list/coin_list_bloc.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_list/coin_list_event.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_list/coin_list_state.dart';
import 'package:coin_app_flutter/feature/presentation/widget/error_fragment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/coin.dart';
import 'circular_indicator_widget.dart';
import 'coin_card_widget.dart';

class CoinListWidget extends StatelessWidget {
  final Currency currency;

  const CoinListWidget({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coinListBlock = BlocProvider.of<CoinListBloc>(context, listen: false);
    coinListBlock.add(LoadCoinList(currency));
    return BlocBuilder<CoinListBloc, CoinListState>(
      builder: (context, state) {
        List<Coin> coinList = [];

        if (state is CoinListLoading) {
          log('CoinListLoading');
          return loadingIndicator();
        } else if (state is CoinListLoaded) {
          log('CoinListLoaded');
          coinList = state.coinList;
        } else if (state is CoinListError) {
          log('CoinListError');
          log(state.message);
          return ErrorLayoutWidget(pressAction: () {
            log('CoinListWidget pressAction');
            coinListBlock.add(LoadCoinList(currency));
          },
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return CoinCardWidget(coin: coinList[index]);//CoinCardWidget(coin: coinList[index]);
          },
          itemCount: coinList.length,
        );
      },
    );
  }


}
