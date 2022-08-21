/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 06.08.2022, 20:24
 *
 */

import 'dart:ffi';

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/presentation/widgets/measure_size.dart';
import 'package:flutter/material.dart';
import "package:ecocotask/di.dart" as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget{

  ValueNotifier<double> sizeLogo = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: ConstColors.bluewDark,
          ),
          Center(
            child: ValueListenableBuilder<double>(
              valueListenable: sizeLogo,
              builder: (context, data, __) {
                return Padding(
                  padding: EdgeInsets.only(left: data),
                  child: MeasureSize(
                    onChange: (size){
                      sizeLogo.value = size.width / 3;
                    },
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 132.r,
                          width: 132.r,
                          decoration: BoxDecoration(
                              color: ConstColors.orange, shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 34.w, top: 16.h),
                          child: Text(
                            """Ecommerce 
Concept """,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: ConstColors.white, fontSize: 20.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
