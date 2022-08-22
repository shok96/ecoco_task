
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 18:27
 *
 */

import 'package:ecocotask/core/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dev_icon.dart';


class PhotoCardAurhor extends StatelessWidget {
  const PhotoCardAurhor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300.w),
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 15.h),
            blurRadius: 20,
            color: Colors.grey.withAlpha(50))
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withAlpha(20))),
              child: Image.asset(LocalImages.author)),
          SizedBox(
            height: 30.h,
          ),
          GridView(
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 16, childAspectRatio: 2, mainAxisSpacing: 16),
              children: [
                DevIcon(mode: DevMode.Flutter),
                DevIcon(mode: DevMode.Android),
                DevIcon(mode: DevMode.Java),
                DevIcon(mode: DevMode.Python),
                DevIcon(mode: DevMode.Django),
                DevIcon(mode: DevMode.Postgre),
                DevIcon(mode: DevMode.React),
                DevIcon(mode: DevMode.Kotlin),
                DevIcon(mode: DevMode.Firebase),
              ]),
        ],
      ),
    );
  }
}
