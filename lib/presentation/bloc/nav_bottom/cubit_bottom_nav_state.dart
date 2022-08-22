/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 19:03
 *
 */

import "package:freezed_annotation/freezed_annotation.dart";

part  'cubit_bottom_nav_state.freezed.dart';

@freezed
class CubitBottomNavState with _$CubitBottomNavState{

  const factory CubitBottomNavState.Home() = _Home;
  const factory CubitBottomNavState.Cart() = _Cart;
  const factory CubitBottomNavState.Favorites() = _Favorites;
  const factory CubitBottomNavState.About() = _About;

}
