/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 22:01
 *
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:ecocotask/presentation/widgets/error_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerGallery extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.h,
        child: BlocBuilder<BlocHome, BlocHomeState>(
          builder: (context, state) {
            return state.when(
                idle: () => SizedBox.shrink(),
                proceed: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                fetchedHome: (data) => PageView.builder(
                      itemBuilder: (context, index) =>
                          _Items(homeStore: data.home_store[index]),
                      itemCount: data.home_store.length,
                      scrollDirection: Axis.horizontal,
                    ),
                error: (e) => ErrorCard(
                    action: () =>
                        context.read<BlocHome>().add(BlocHomeEvent.getHome())));
          },
        ));
  }
}

class _Items extends StatelessWidget {
  MHomeStore homeStore;

  _Items({required this.homeStore});

  List<Widget> genContent(BuildContext context, {bool? isActivate = true}){
    var res = [
      _News(),
      RichText(
        text: TextSpan(
          text: '${homeStore.title}\n',
          style: mark700(context, size: 25)
              ?.copyWith(color: ConstColors.white),
          children: <TextSpan>[
            TextSpan(
                text: '${homeStore.subtitle}',
                style: mark400(context, size: 11)?.copyWith(
                    color: ConstColors.white)),
          ],
        ),
      ),
      homeStore.is_buy
          ? Button(
          action: () {},
          color: ConstColors.white,
          text: "Buy now!",
          text_color: ConstColors.bluewDark,
          style: mark700(context, size:11)?.copyWith(color: ConstColors.bluewDark),
          padding:
          EdgeInsets.symmetric(horizontal: 27.w, vertical: 5.h))
          : SizedBox.shrink(),
    ];
    if(isActivate == null){
      res.removeAt(0);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          image: DecorationImage(image: CachedNetworkImageProvider(homeStore.picture), fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.only(left: 32.w, top: 23.h, bottom: 26.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: genContent(context, isActivate: homeStore.is_new),
        ),
      ),
    );
  }
}

class _News extends StatefulWidget  {
  @override
  State<_News> createState() => _NewsState();
}

class _NewsState extends State<_News> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      lowerBound: 0.5,
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()..repeat(reverse: true)
      ..addListener(() {
        if (controller.isCompleted) {
          controller.forward();
        }
      });
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Transform.scale(
          scale: controller.value,
          child: Container(
            decoration: BoxDecoration(
              color: ConstColors.orange,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              child: Text(
                "New",
                style: mark700(context, size: 10)
                    ?.copyWith(color: ConstColors.white, fontSize: 10.sp),
              ),
            ),
          ),
        );
      }
    );
  }
}
