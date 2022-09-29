import 'package:coin_app_flutter/feature/data/mapper/coin_mapper.dart';
import 'package:coin_app_flutter/feature/domain/usecase/get_coin_detail_usecase.dart';
import 'package:coin_app_flutter/feature/domain/usecase/get_coin_list_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/platform/network_info.dart';
import 'feature/data/datasource/coin_remote_datasource.dart';
import 'feature/data/repository/coin_repository_impl.dart';
import 'feature/domain/repository/coin_repository.dart';
import 'feature/presentation/bloc/coin_detail/coin_detail_bloc.dart';
import 'feature/presentation/bloc/coin_list/coin_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => CoinListBloc(getCoinListUseCase: sl()),
  );
  sl.registerFactory(
    () => CoinDetailBloc(getCoinDetailUseCase: sl()),
  );

  // UseCase
  sl.registerLazySingleton(() => GetCoinListUseCase(sl()));
  sl.registerLazySingleton(() => GetCoinDetailUseCase(sl()));

  // Repository
  sl.registerLazySingleton<CoinRepository>(
    () => CoinRepositoryImpl(
      coinRemoteDataSource: sl(),
      coinMapper: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<CoinRemoteDataSource>(
    () => CoinRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<CoinMapper>(() => CoinMapper());

  //Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
