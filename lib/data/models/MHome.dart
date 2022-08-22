/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 14:06
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MHome.freezed.dart';

part 'MHome.g.dart';

@freezed
class MHome with _$MHome {

  const factory MHome({
    required List<MHomeStore> home_store,
    required List<MBestSeller> best_seller
  }) = _MHome;


  factory MHome.fromJson(Map<String, dynamic> json) => _$MHomeFromJson(json);

}

@freezed
class MHomeStore with _$MHomeStore {

  const factory MHomeStore({
    required int id,
    bool? is_new,
    required String title,
    required String subtitle,
    required String picture,
    required bool is_buy,
  }) = _MHomeStore;


  factory MHomeStore.fromJson(Map<String, dynamic> json) => _$MHomeStoreFromJson(json);

}


@freezed
class MBestSeller with _$MBestSeller {

  const factory MBestSeller({
    required int id,
    required bool is_favorites,
    required int price_without_discount,
    required int discount_price,
    required String picture,
    required String title,
  }) = _MBestSeller;


  factory MBestSeller.fromJson(Map<String, dynamic> json) => _$MBestSellerFromJson(json);

}