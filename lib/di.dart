/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:45
 *
 */

import 'package:ecocotask/data/datasource/network/RemoteDataSource.dart';
import 'package:ecocotask/data/datasource/network/net.dart';
import 'package:ecocotask/data/datasource/network/net_controller.dart';
import 'package:ecocotask/data/datasource/store/StoreCart.dart';
import 'package:ecocotask/data/repository/repositoryImpl.dart';

import 'package:ecocotask/domain/repository/repository.dart';

import 'package:ecocotask/domain/usecases/impl/UCCartImpl.dart';
import 'package:ecocotask/domain/usecases/impl/UCDetailImpl.dart';
import 'package:ecocotask/domain/usecases/impl/UCHomeImpl.dart';
import 'package:ecocotask/domain/usecases/intf/UCCart.dart';
import 'package:ecocotask/domain/usecases/intf/UCDetail.dart';
import 'package:ecocotask/domain/usecases/intf/UCHome.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CubitBottomNav());

  sl.registerFactory(() => BlocHome(sl()));

  sl.registerFactory(() => BlocCart(sl()));

  sl.registerLazySingleton<UCHome>(() => UCHomeImpl(sl()));
  sl.registerLazySingleton<UCDetail>(() => UCDetailImpl(sl()));
  sl.registerLazySingleton<UCCart>(() => UCCartImpl(sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<StoreCart>(() => StoreCart());

  sl.registerLazySingleton(() => Api(sl()));

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => NetController(sl()));
}
