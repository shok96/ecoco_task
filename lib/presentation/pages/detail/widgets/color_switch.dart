import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSwitch extends StatelessWidget{

  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: count,
      builder: (context, data, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Item(colors: HexColor.fromHex("#772D03"), action: () => count.value = 0, isActive: data == 0,),
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: _Item(colors: ConstColors.bluewDark, action: () => count.value = 1, isActive: data == 1,),
            ),
          ],
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
    return GestureDetector(
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
    );
  }

}