
/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:37
 *
 */

import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WindowBlock extends StatelessWidget {

  String body;
  String title;
  EdgeInsetsGeometry? padding;

  WindowBlock({Key? key, required this.body, required this.title, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ?  EdgeInsets.all(8.0.r) : padding!,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.2,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withAlpha(50))
        ),
        child: Column(
          children: [
            Container(

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                  border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(50)))
              ),
              child: Row(
                children: [
                  _ButtonCircle(Colors.red),
                  _ButtonCircle(Colors.orange),
                  _ButtonCircle(Colors.green),
        ]
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: mark700(context, size: 36)?.copyWith(color: Colors.grey),),
                  SizedBox(height: 30.h,),
                  Text(body, style: mark400(context, size: 28)?.copyWith(color: Colors.grey),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonCircle extends StatelessWidget{

  Color color;

  _ButtonCircle(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8).r,
      width: 16.r,
      height: 16.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }



}
