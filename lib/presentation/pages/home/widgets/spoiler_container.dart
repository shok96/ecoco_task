/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 19:33
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpoilerContainer extends StatelessWidget{

  String title, subtitle;
  Widget child;

  SpoilerContainer({required this.child, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: mark700(context, size: 25)),
            Text(subtitle, style: mark400(context, size: 15)?.copyWith(color: ConstColors.orange))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: child,
        )
      ],
    );
  }

}