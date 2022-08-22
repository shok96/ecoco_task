/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 14:13
 *
 */

import 'dart:async';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/domain/usecases/intf/UCDetail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_detail.freezed.dart';

class BlocDetail extends Bloc<BlocDetailEvent, BlocDetailState> {
  UCDetail _detail;

  BlocDetail(this._detail) : super(BlocDetailState.idle()){
    on<BlocDetailEvent>((event, emit) async{
      await event.when(getDetail: () async{
        emit(BlocDetailState.proceed());
        final res = await _detail.getDetail();
        if(res.isSuccessfull){
          emit(BlocDetailState.fetchedDetail(res.body!));
        }
        else{
          emit(BlocDetailState.error(res.error ?? "Unknown error"));
        }
      });
    });
  }
}

@freezed
class BlocDetailEvent with _$BlocDetailEvent {
  const factory BlocDetailEvent.getDetail()= _GetDetailState;
}

@freezed
class BlocDetailState with _$BlocDetailState {
  const factory BlocDetailState.idle() = _IdleState;
  const factory BlocDetailState.proceed() = _ProceedSate;
  const factory BlocDetailState.fetchedDetail(MDetail detail) = _FetchedDetailState;
  const factory BlocDetailState.error(String error) = _ErrorState;
}
