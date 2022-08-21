import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HardSwitch extends StatelessWidget {
  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: count,
        builder: (context, data, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Item(
                text: "128 GB",
                action: () => count.value = 0,
                isActive: data == 0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: _Item(
                  text: "256 GB",
                  action: () => count.value = 1,
                  isActive: data == 1,
                ),
              ),
            ],
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
    return Button(
      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize:13.sp, color:isActive ? ConstColors.white : Colors.grey, ),
      radius: 10.r,
      color: isActive ? ConstColors.orange : Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      text: text,
      action: action,
    );
  }
}
