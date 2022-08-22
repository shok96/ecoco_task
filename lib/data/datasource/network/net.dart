/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 11:34
 *
 */
import 'package:ecocotask/core/common/constants.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;

part 'net.g.dart';

@RestApi(baseUrl: URL)
abstract class Api{

  factory Api(Dio dio, {String baseUrl}) = _Api;

  //home
  @GET("654bd15e-b121-49ba-a588-960956b15175")
  Future<MHome> getHome();
  //details
  @GET("6c14c560-15c6-4248-b9d2-b4508df7d4f5")
  Future<MDetail> getDetail();
  //cart
  @GET("53539a72-3c5f-4f30-bbb1-6ca10d42c149")
  Future<MCart> getCart();


}