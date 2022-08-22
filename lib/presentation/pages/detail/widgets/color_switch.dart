/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 15:20
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSwitch extends StatelessWidget{

  List<Color> colors;

  ColorSwitch({required this.colors});

  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: count,
      builder: (context, data, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(colors.length, (index) => _Item(colors: colors[index], action: () => count.value = index, isActive: data == index,))
        );
      }
    );
  }

}

class _Item extends StatelessWidget{

  Color colors;
  bool isActive;
  VoidCallback action;

  _Item({this.isActive = false, required this.colors, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: GestureDetector(
        onTap: action,
        child: Container(
          width: 39.r,
          height: 39.r,
          decoration: BoxDecoration(
            color: colors,
            shape: BoxShape.circle
          ),
          child: Icon(Icons.check, color: isActive ? ConstColors.white : Colors.transparent,),
        ),
      ),
    );
  }

}