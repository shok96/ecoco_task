/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:31
 *
 */

import 'dart:async';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:ecocotask/domain/usecases/intf/UCHome.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_home.freezed.dart';

class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  UCHome _home;

  BlocHome(this._home) : super(BlocHomeState.idle()){
    on<BlocHomeEvent>((event, emit) async{
      await event.when(getHome: () async{
        if(state is _FetchedHomeState)
          return;
        getHome();
      }, refresh: () {
        getHome();
      });
    });
  }

  Future getHome() async{
    emit(BlocHomeState.proceed());
    final res = await _home.getHome();
    if(res.isSuccessfull){
      emit(BlocHomeState.fetchedHome(res.body!));
    }
    else{
      emit(BlocHomeState.error(res.error ?? "Unknown error"));
    }
  }

}

@freezed
class BlocHomeEvent with _$BlocHomeEvent {
  const factory BlocHomeEvent.getHome()= _GetHomeState;
  const factory BlocHomeEvent.refresh()= _RefreshState;
}

@freezed
class BlocHomeState with _$BlocHomeState {
  const factory BlocHomeState.idle() = _IdleState;
  const factory BlocHomeState.proceed() = _ProceedSate;
  const factory BlocHomeState.fetchedHome(MHome home) = _FetchedHomeState;
  const factory BlocHomeState.error(String error) = _ErrorState;
}
