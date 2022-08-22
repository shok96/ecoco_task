/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:01
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/data/models/MDetail.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/color_switch.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/hard_switch.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailInfo extends StatefulWidget {
  MDetail mDetail;

  DetailInfo({required this.mDetail});

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {

  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.mDetail.isFavorites;
    super.initState();
  }

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
              Text(widget.mDetail.title, style: mark500(context, size: 24),),
              Button(
                action: (){
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                color: ConstColors.bluewDark,
                icon: !isFavorite ? Icons.favorite_border : Icons.favorite,
                padding: EdgeInsets.all(10.r),
                radius: 14,
              ),
            ],
          ),
          Row(
            children: List.generate(
                5,
                (index) => _Star(
                      isActive: index < widget.mDetail.rating,
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
                _Hard(text: widget.mDetail.CPU, icon: LocalIcons.cpu),
                _Hard(text: widget.mDetail.camera, icon: LocalIcons.photo),
                _Hard(text: widget.mDetail.ssd, icon: LocalIcons.ram),
                _Hard(text: widget.mDetail.sd, icon: LocalIcons.sd),
              ],
            ),
          ),
          Text("Select color and capacity", style: mark500(context, size: 16),),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorSwitch(colors: widget.mDetail.getColors()),
              HardSwitch(volumes: widget.mDetail.capacity,),
            ],
          ),
          SizedBox(height: 27.h,),
          Button(
            radius: 10.r,
            color: ConstColors.orange,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            action: () {
              Utils.toast(context, "${widget.mDetail.title} успешно добавлен");
              context.read<BlocCart>().add(BlocCartEvent.addItem(widget.mDetail));
            },
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  "Add to Cart",
                  textAlign: TextAlign.center,
                  style: mark700(context, size: 20)
                      ?.copyWith(color: ConstColors.white),
                )),
                Expanded(
                    child: Text(
                  "\$${widget.mDetail.price}",
                  textAlign: TextAlign.center,
                  style: mark700(context, size: 20)
                      ?.copyWith(color: ConstColors.white),
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
          style: mark400(context, size: 11)
              ?.copyWith(color: Colors.grey),
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
          style: isActive ? mark700(context, size: 20)?.copyWith(
              color: ConstColors.bluewDark) : mark400(context, size: 20)?.copyWith(color: Colors.grey.shade400),
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
