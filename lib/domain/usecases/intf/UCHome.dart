
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 13:06
 *
 */

import 'package:ecocotask/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:ecocotask/data/models/MHome.dart';

abstract class UCHome {

  Future<MTaskResult<MHome>> getHome();

}