/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:38
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget{

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      child: Row(
        children: [
          SvgPicture.asset(LocalIcons.search),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: mark400(context, size: 12)?.copyWith(color: HexColor.fromHex("#003580").withOpacity(0.5)),
              ),
            ),
          ),
          Container(
            width: 34.r,
            height: 34.r,
            decoration: BoxDecoration(
                color: ConstColors.orange,
                shape: BoxShape.circle
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(LocalIcons.menu),
              ),
            ),
          ),
        ],
      ),
    );
  }

}