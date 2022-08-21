import 'dart:ffi';

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category extends StatelessWidget{

  ValueNotifier<int> index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: index,
      builder: (context, data, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Items(icon: LocalIcons.phones, title: "Phones", isActive: data == 0, action: () => index.value = 0,),
            _Items(icon: LocalIcons.computer, title: "Computer", isActive: data == 1, action: () => index.value = 1,),
            _Items(icon: LocalIcons.heart, title: "Health", isActive: data == 2, action: () => index.value = 2,),
            _Items(icon: LocalIcons.books, title: "Books", isActive: data == 3, action: () => index.value = 3,),
          ],
        );
      }
    );
  }

}


class _Items extends StatelessWidget{

  String icon, title;
  bool isActive;
  VoidCallback action;

  _Items({required this.icon, this.isActive = false, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        action();
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isActive ? ConstColors.orange : Colors.transparent,
              shape: BoxShape.circle,
            ),
            width: 71.r,
            height: 71.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: SvgPicture.asset(icon, color: isActive ? ConstColors.white : Colors.grey,),
            ),
          ),
          SizedBox(height: 7.h,),
          Text(title, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12.sp, color: isActive ? ConstColors.orange : ConstColors.bluewDark))
        ],
      ),
    );
  }

}