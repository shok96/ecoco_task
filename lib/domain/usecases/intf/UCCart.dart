
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


abstract class UCCart {

  StoreCart get storeCart;
  Future<MTaskResult<MCart>> getCart();

}