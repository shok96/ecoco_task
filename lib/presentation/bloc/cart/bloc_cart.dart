/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:19
 *
 */

import 'dart:async';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/domain/usecases/intf/UCCart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_cart.freezed.dart';

class BlocCart extends Bloc<BlocCartEvent, BlocCartState> {
  UCCart _cart;

  BlocCart(this._cart) : super(BlocCartState.idle()) {
    on<BlocCartEvent>((event, emit) async {
      await event.when(
          getCart: () async {
          getCart();
          },
          decrementItem: (id) {
            emit(BlocCartState.fetchedCart(_cart.storeCart.decrement(id)));
          },
          incrementItem: (id) {
            emit(BlocCartState.fetchedCart(_cart.storeCart.increment(id)));
          },
          removeItem: (MBasket mBasket) {
            emit(BlocCartState.fetchedCart(
                _cart.storeCart.removeElement(mBasket)));
          },
          addItem: (MDetail mDetail) {
            emit(BlocCartState.fetchedCart(
                _cart.storeCart.addToCart(mDetail)));
          }, refresh: () {
            if(state is _FetchedCartState)
              return;
            getCart();
      });
    });
  }

  Future getCart() async{
    emit(BlocCartState.proceed());
    final res = await _cart.getCart();
    if (res.isSuccessfull) {
      emit(BlocCartState.fetchedCart(res.body!));
    } else {
      emit(BlocCartState.error(res.error ?? "Unknown error"));
    }
  }
}

@freezed
class BlocCartEvent with _$BlocCartEvent {
  const factory BlocCartEvent.getCart() = _GetCartState;
  const factory BlocCartEvent.refresh() = _RefreshState;

  const factory BlocCartEvent.addItem(MDetail mDetail) = _AddItemState;

  const factory BlocCartEvent.incrementItem(int id) = _IncrementItemState;

  const factory BlocCartEvent.decrementItem(int id) = _DecrementItemState;

  const factory BlocCartEvent.removeItem(MBasket mBasket) = _RemoveItemState;
}

@freezed
class BlocCartState with _$BlocCartState {
  const factory BlocCartState.idle() = _IdleState;

  const factory BlocCartState.proceed() = _ProceedSate;

  const factory BlocCartState.fetchedCart(MCart cart) = _FetchedCartState;

  const factory BlocCartState.error(String error) = _ErrorState;
}
