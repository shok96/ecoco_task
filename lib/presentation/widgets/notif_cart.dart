/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 19:10
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifCart extends StatelessWidget{

  MCart cart;

  NotifCart({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: -10.w,
        top: -10.h,
        child: Container(
            decoration: BoxDecoration(
                color: ConstColors.white,
                shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.all(4.0.r),
              child: Text(
                "${cart.totalItemSize > 10 ? "+10" : cart.totalItemSize}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(
                    color:
                    ConstColors.orange,
                    fontSize: 12.sp),
              ),
            )));
  }

}