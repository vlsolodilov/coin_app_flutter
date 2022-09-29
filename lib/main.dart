import 'package:coin_app_flutter/common/app_color.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_detail/coin_detail_bloc.dart';
import 'package:coin_app_flutter/feature/presentation/bloc/coin_list/coin_list_bloc.dart';
import 'package:coin_app_flutter/feature/presentation/screen/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:coin_app_flutter/locator_service.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoinListBloc>(create: (context) => sl<CoinListBloc>()..getCoinListUseCase),
        BlocProvider<CoinDetailBloc>(create: (context) => sl<CoinDetailBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: AppColor.mainBackground,
          scaffoldBackgroundColor: AppColor.mainBackground,
        ),
        home: const CoinListScreen(),
      ),
    );
  }
}
