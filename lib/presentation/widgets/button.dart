import 'package:ecocotask/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  Color color, text_color;
  String? text, svg;
  IconData? icon;
  EdgeInsetsGeometry padding;
  double radius;
  TextStyle? style;
  VoidCallback action;
  Widget? widget;

  Button(
      {required this.color,
      this.text,
      this.text_color = Colors.white,
      required this.padding,
      this.icon,
      this.radius = 5,
      required this.action,
      this.svg,
      this.style,
      this.widget});

  Widget child(BuildContext context) {
    if (icon != null) {
      return Icon(
        icon,
        color: text_color,
      );
    } else if (text != null) {
      return Text(
        text!,
        style: style ??
            Theme.of(context).textTheme.bodyText2?.copyWith(color: text_color),
      );
    } else if (svg != null) {
      return SvgPicture.asset(svg!);
    } else if (widget != null) {
      return widget!;
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius.r)),
        child: Padding(
          padding: padding,
          child: child(context),
        ),
      ),
    );
  }
}
