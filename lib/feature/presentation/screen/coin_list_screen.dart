import 'package:coin_app_flutter/common/app_color.dart';
import 'package:coin_app_flutter/common/app_style.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/coin.dart';
import '../widget/coin_list_widget.dart';

class CoinListScreen extends StatefulWidget {
  const CoinListScreen({Key? key}) : super(key: key);

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  Currency _lastCurrency = Currency.usd;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Список криптовалют',
            style: AppStyle.titleText,
          ),
          backgroundColor: AppColor.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                children: List.generate(Currency.values.length, (index) {
                  return ChoiceChip(
                    label: Text(
                      Currency.values[index].name.toUpperCase(),
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: _selectedIndex == index
                          ? AppColor.primary_500
                          : AppColor.black,
                    ),
                    labelPadding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    selected: _selectedIndex == index,
                    selectedColor: AppColor.primary_500.withOpacity(0.12),
                    onSelected: (value) {
                      setState(() {
                        _selectedIndex = value ? index : _selectedIndex;
                        _lastCurrency = Currency.values[index];
                      });
                    },
                  );
                }),
              ),
            ),
          )),
      body: CoinListWidget(currency: _lastCurrency),
    );
  }
}
