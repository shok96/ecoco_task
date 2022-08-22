/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:33
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part 'MCart.freezed.dart';

part 'MCart.g.dart';

@freezed
class MCart with _$MCart {

  const MCart._();

  const factory MCart({
    required String id,
    required String delivery,
    required int total,
    required List<MBasket> basket
  }) = _MCart;

  int get totalItemSize => this.basket.fold(0, (previousValue, element) => previousValue + element.count);

  factory MCart.fromJson(Map<String, dynamic> json) => _$MCartFromJson(json);

}

@freezed
class MBasket with _$MBasket {

  const factory MBasket({
    required int id,
    required String images,
    required int price,
    required String title,
    @Default(1) int count
  }) = _MBasket;


  factory MBasket.fromJson(Map<String, dynamic> json) => _$MBasketFromJson(json);

}
