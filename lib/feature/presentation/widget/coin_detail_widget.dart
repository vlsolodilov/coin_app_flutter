import 'package:coin_app_flutter/common/app_style.dart';
import 'package:coin_app_flutter/feature/domain/entity/coin_detail.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_detail/coin_detail_state.dart';
import 'package:coin_app_flutter/feature/presentation/widget/circular_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../common/app_color.dart';
import '../bloc/coin_detail/coin_detail_bloc.dart';
import '../bloc/coin_detail/coin_detail_event.dart';
import 'error_fragment_widget.dart';

class CoinDetailWidget extends StatelessWidget {
  final String coinId;

  const CoinDetailWidget({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    final coinDetailBlock =
        BlocProvider.of<CoinDetailBloc>(context, listen: false);
    coinDetailBlock.add(LoadCoinDetail(coinId));
    return BlocBuilder<CoinDetailBloc, CoinDetailState>(
        builder: (context, state) {
      if (state is CoinDetailLoading) {
        return loadingIndicator();
      } else if (state is CoinDetailLoaded) {
        CoinDetail coinDetail = state.coinDetail;
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 34),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: Image.network(coinDetail.image),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Описание',
                  style: AppStyle.titleText2,
                ),
                const SizedBox(height: 8),
                Html(
                  data: coinDetail.description,
                  style: {
                    'body': Style(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      color: AppColor.black,
                      fontSize: const FontSize(16.0),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Категории',
                  style: AppStyle.titleText2,
                ),
                const SizedBox(height: 8),
                Text(
                  coinDetail.category,
                  style: AppStyle.regularText2,
                ),
              ],
            ),
          ),
        );
      } else if (state is CoinDetailError) {
        return ErrorLayoutWidget(
          pressAction: () {
            coinDetailBlock.add(LoadCoinDetail(coinId));
          },
        );
      }
      return Container();
    });
  }
}
