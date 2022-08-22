/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 13:37
 *
 */



import 'package:ecocotask/data/datasource/network/RemoteDataSource.dart';
import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/datasource/store/StoreCart.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:ecocotask/domain/repository/repository.dart';

class RepositoryImpl extends Repository{

  late RemoteDataSource remoteDataSource;
  late StoreCart storeCart;

  RepositoryImpl(this.storeCart, this.remoteDataSource);

  @override
  StoreCart get getStoreCart => storeCart;

  @override
  Future<MTaskResult<MCart>> getCart() {
    return remoteDataSource.getCart();
  }

  @override
  Future<MTaskResult<MDetail>> getDetail() {
    return remoteDataSource.getDetail();
  }

  @override
  Future<MTaskResult<MHome>> getHome() {
    return remoteDataSource.getHome();
  }

}