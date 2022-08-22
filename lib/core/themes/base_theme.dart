/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:36
 *
 */


import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle? mark800(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w800, fontSize: size?.sp);
TextStyle? mark700(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700, fontSize: size?.sp);
TextStyle? mark500(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w500, fontSize: size?.sp);
TextStyle? mark400(BuildContext context, {double? size}) => Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, fontSize: size?.sp);

ThemeData themeData(BuildContext context) {
    return ThemeData(fontFamily: 'Mark Pro')..textTheme.bodyText2?.copyWith(color: ConstColors.bluewDark, fontSize: 16.sp);
}
