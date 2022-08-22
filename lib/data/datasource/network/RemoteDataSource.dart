/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 12:42
 *
 */

import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/data/models/MHome.dart';

import 'net_controller.dart';

abstract class RemoteDataSource{

  Future<MTaskResult<MHome>> getHome();
  Future<MTaskResult<MDetail>> getDetail();
  Future<MTaskResult<MCart>> getCart();

}

class RemoteDataSourceImpl implements RemoteDataSource{

  NetController _net;

  RemoteDataSourceImpl(this._net);


  @override
  Future<MTaskResult<MHome>> getHome() async{
    return await _net.asyncResult<MHome>(
            () => _net.api.getHome());
  }

  @override
  Future<MTaskResult<MCart>> getCart() async{
    return await _net.asyncResult<MCart>(
            () => _net.api.getCart());
  }

  @override
  Future<MTaskResult<MDetail>> getDetail() async{
    return await _net.asyncResult<MDetail>(
            () => _net.api.getDetail());
  }



}