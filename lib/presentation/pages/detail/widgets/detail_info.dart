import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/color_switch.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/hard_switch.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Galaxy Note 20 Ultra"),
              Button(
                action: () => Navigator.of(context).pop(),
                color: ConstColors.bluewDark,
                icon: Icons.favorite_border,
                padding: EdgeInsets.all(10.r),
                radius: 14,
              ),
            ],
          ),
          Row(
            children: List.generate(
                5,
                (index) => _Star(
                      isActive: index < 4,
                    )),
          ),
          SizedBox(
            height: 32.h,
          ),
          _Tabs(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 31.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Hard(text: "Exynos 990", icon: LocalIcons.cpu),
                _Hard(text: "108 + 12 mp", icon: LocalIcons.photo),
                _Hard(text: "8 GB", icon: LocalIcons.ram),
                _Hard(text: "256 GB", icon: LocalIcons.sd),
              ],
            ),
          ),
          Text("Select color and capacity"),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorSwitch(),
              HardSwitch(),
            ],
          ),
          SizedBox(height: 27.h,),
          Button(
            radius: 10.r,
            color: ConstColors.orange,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            action: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  "Add to Cart",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: ConstColors.white, fontSize: 20.sp),
                )),
                Expanded(
                    child: Text(
                  "\$1.500.00",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: ConstColors.white, fontSize: 20.sp),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Hard extends StatelessWidget {
  String icon;
  String text;

  _Hard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: Colors.grey, fontSize: 11.sp),
        )
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  ValueNotifier<int> count = ValueNotifier(0);

  final menu = ["Shop", "Details", "Features"];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: count,
        builder: (context, data, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                menu.length,
                (index) => Expanded(
                      child: GestureDetector(
                          onTap: () => count.value = index,
                          child: titleTab(context, data == index, menu[index])),
                    )),
          );
        });
  }

  Widget titleTab(BuildContext context, bool isActive, String text) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: isActive ? ConstColors.orange : Colors.grey.shade300),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          color: isActive ? ConstColors.orange : Colors.transparent,
          height: 3.h,
        )
      ],
    );
  }
}

class _Star extends StatelessWidget {
  bool isActive;

  _Star({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Icon(
        Icons.star,
        color: isActive ? Colors.yellow : Colors.grey,
        size: 20.r,
      ),
    );
  }
}
