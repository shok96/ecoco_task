/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:50
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Total extends StatelessWidget{

  MCart mCart;

  Total({required this.mCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade300,
          height: 2.h,
        ),
        SizedBox(height: 15.h,),
        _Item(title: "Total", subTitle: "\$${mCart.total} us"),
        SizedBox(height: 12.h,),
        _Item(title: "Delivery", subTitle: mCart.delivery),
        SizedBox(height: 26.h,),
        Divider(
          color: Colors.grey.shade300,
          height: 1.h,
        ),
      ],
    );
  }

}

class _Item extends StatelessWidget{

  String title, subTitle;

  _Item({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 55.w, right: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex:5, child: Text(title, style: mark400(context, size: 15)?.copyWith(color: ConstColors.white),)),
          Expanded(flex:2, child: Text(subTitle, style: mark700(context, size: 15)?.copyWith(color: ConstColors.white),)),
        ],
      ),
    );
  }

}