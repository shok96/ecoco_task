/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 14:12
 *
 */


import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/domain/repository/repository.dart';
import 'package:ecocotask/domain/usecases/intf/UCDetail.dart';

class UCDetailImpl extends UCDetail {
  Repository _repository;

  UCDetailImpl(this._repository);

  @override
  Future<MTaskResult<MDetail>> getDetail() {
    return _repository.getDetail();
  }

}
