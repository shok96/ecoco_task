/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 13:10
 *
 */


import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/datasource/store/StoreCart.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/data/models/MHome.dart';

abstract class Repository{

  StoreCart get getStoreCart;
  Future<MTaskResult<MHome>> getHome();
  Future<MTaskResult<MDetail>> getDetail();
  Future<MTaskResult<MCart>> getCart();

}