/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 12:59
 *
 */

import 'package:bloc/bloc.dart';
import 'package:ecocotask/presentation/bloc/nav_bottom/cubit_bottom_nav_state.dart';
import 'package:meta/meta.dart';


class CubitBottomNav extends Cubit<CubitBottomNavState> {
  CubitBottomNav() : super(CubitBottomNavState.Home());

  void setBaseMenuState(CubitBottomNavState value) =>
      emit(value);
}
