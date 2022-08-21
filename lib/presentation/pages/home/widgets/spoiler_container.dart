import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpoilerContainer extends StatelessWidget{

  String title, subtitle;
  Widget child;

  SpoilerContainer({required this.child, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 25.sp)),
            Text(subtitle, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ConstColors.orange, fontSize: 15.sp))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: child,
        )
      ],
    );
  }

}