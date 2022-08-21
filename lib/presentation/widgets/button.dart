import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  Color color, text_color;
  String? text;
  IconData? icon;
  EdgeInsetsGeometry padding;
  double radius;
  VoidCallback action;

  Button(
      {required this.color,
      this.text,
      this.text_color = Colors.white,
      required this.padding,
      this.icon,
      this.radius = 5,
      required this.action});

  Widget child(BuildContext context) {
    if (icon != null) {
      return Icon(
        icon,
        color: text_color,
      );
    } else if (text != null) {
      return Text(
        text!,
        style:
            Theme.of(context).textTheme.bodyText2?.copyWith(color: text_color),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius.r)),
        child: Padding(
          padding: padding,
          child: child(context),
        ),
      ),
    );
  }
}
