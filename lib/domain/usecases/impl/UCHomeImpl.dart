/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 13:06
 *
 */


import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:ecocotask/domain/repository/repository.dart';
import 'package:ecocotask/domain/usecases/intf/UCHome.dart';

class UCHomeImpl extends UCHome {
  Repository _repository;

  UCHomeImpl(this._repository);

  @override
  Future<MTaskResult<MHome>> getHome() {
    return _repository.getHome();
  }

}
