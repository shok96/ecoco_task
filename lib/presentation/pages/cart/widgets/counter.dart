/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:49
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatelessWidget{

  int id, count;

  Counter({required this.count, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor.fromHex("#282843"),
        borderRadius: BorderRadius.circular(26.r)
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.read<BlocCart>().add(BlocCartEvent.decrementItem(id)),
                child: Text("-", style: mark500(context, size: 16)?.copyWith(color: ConstColors.white))),
            Text(count.toString(), style: mark500(context, size: 16)?.copyWith(color: ConstColors.white)),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.read<BlocCart>().add(BlocCartEvent.incrementItem(id)),
                child: Text("+", style: mark500(context, size: 16)?.copyWith(color: ConstColors.white))),
          ],
        ),
      ),
    );
  }

}