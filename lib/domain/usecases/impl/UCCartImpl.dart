/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 16:19
 *
 */


import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/datasource/store/StoreCart.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/domain/repository/repository.dart';
import 'package:ecocotask/domain/usecases/intf/UCCart.dart';

class UCCartImpl extends UCCart {
  Repository _repository;

  UCCartImpl(this._repository);

  @override
  Future<MTaskResult<MCart>> getCart() async{
    final res = await _repository.getCart();
    if(res.isSuccessfull) {
      _repository.getStoreCart.setStoreCart(res.body!);
    }
    return res.copyWith(body: _repository.getStoreCart.getCart());
  }

  @override
  StoreCart get storeCart => _repository.getStoreCart;

}
