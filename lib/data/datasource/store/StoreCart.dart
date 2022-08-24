/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:33
 *
 */

import 'package:ecocotask/data/models/MCart.dart';
import 'package:collection/collection.dart';
import 'package:ecocotask/data/models/MDetail.dart';

class StoreCart {
  List<MBasket> _mBaskets = [];
  String _delivery = "";
  int _total = 0;
  String _id = "";

  void setStoreCart(MCart mCart) {
    clear();
    addAll(mCart.basket);
    _delivery = mCart.delivery;
    _total = mCart.total;
    _id = mCart.id;
  }

  MCart getCart() {
    calculateTotal();
    return MCart(
        id: _id, delivery: _delivery, total: _total, basket: _mBaskets);
  }

  MCart add(MBasket basket) {
    final res =
        _mBaskets.firstWhereOrNull((element) => element.id == basket.id);
    if (res != null) {
      increment(res.id);
    } else
      _mBaskets.add(basket);
    return getCart();
  }

  MCart addToCart(MDetail mDetail) {
    add(MBasket(id: int.tryParse(mDetail.id) ?? 0, images: mDetail.images.firstOrNull ?? "", price: mDetail.price, title: mDetail.title));
    return getCart();
  }

  void calculateTotal() {
    _total = 0;
    _total = _mBaskets.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.price * element.count));
  }

  MCart addAll(List<MBasket> basket) {
    _mBaskets.addAll(basket);
    return getCart();
  }

  MCart clear() {
    _mBaskets.clear();
    return getCart();
  }

  MCart update(MBasket mBasket) {
    final res =
        _mBaskets.firstWhereOrNull((element) => element.id == mBasket.id);
    if (res != null) {
      _mBaskets[_mBaskets.indexOf(res)] = mBasket;
    }
    return getCart();
  }

  MCart increment(int id) {
    final res = _mBaskets.firstWhereOrNull((element) => element.id == id);
    if (res != null) {
      var count = res.count;
      update(res.copyWith(count: ++count));
    }
    return getCart();
  }

  MCart decrement(int id) {
    final res = _mBaskets.firstWhereOrNull((element) => element.id == id);
    if (res != null) {
      if (res.count > 1) {
        var count = res.count;
        update(res.copyWith(count: --count));
      } else {
        removeElement(res);
      }
    }
    return getCart();
  }

  MCart removeElement(MBasket basket) {
    _mBaskets.removeWhere((element) => element.id == basket.id);
    return getCart();
  }

  List<MBasket> get baskets => _mBaskets;
}
