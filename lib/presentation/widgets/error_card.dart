/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 13:41
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';

class ErrorCard extends StatelessWidget {

  VoidCallback action;

  ErrorCard({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Card(
        elevation: 10,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              children: [
                Text(
                  "Ошибка при загрзузке данных. Повторить?", style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 16.h,),
                Icon(Icons.refresh, size:25.r),
                SizedBox(height: 16.h,),
                Button(text: "Повторить", action: action, color: ConstColors.orange, padding: EdgeInsets.all(8.r),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
