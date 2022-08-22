/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 19:31
 *
 */

import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/pages/home/widgets/bottom_sheet_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        SvgPicture.asset(LocalIcons.location_point),
        SizedBox(
          width: 11.w,
        ),
        Text("Zihuatanejo, Gro", style: mark500(context, size: 15)),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        Spacer(),
        GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BottomSheetFilterContent();
                  });
            },
            child: SvgPicture.asset(
              LocalIcons.filter,
              width: 15.w,
              height: 18.h,
            ))
      ],
    );
  }
}
