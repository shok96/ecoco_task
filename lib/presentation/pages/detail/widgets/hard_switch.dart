/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:44
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HardSwitch extends StatelessWidget {

  List<String> volumes;

  HardSwitch({required this.volumes});

  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: count,
        builder: (context, data, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children:
            List.generate(volumes.length, (index) => _Item(
              text: volumes[index],
              action: () => count.value = index,
              isActive: data == index,
            ))

          );
        });
  }
}

class _Item extends StatelessWidget {
  String text;
  bool isActive;
  VoidCallback action;

  _Item({this.isActive = false, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Button(
        style: mark700(context, size: 13)?.copyWith(color:isActive ? ConstColors.white : Colors.grey, ),
        radius: 10.r,
        color: isActive ? ConstColors.orange : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        text: "${text} GB",
        action: action,
      ),
    );
  }
}
